library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;

entity hcsr04 is
	port(
		clk : in std_logic;
		rst : in std_logic;
		echo : in std_logic;
		trig : out std_logic;
		dist : out std_logic_vector(15 downto 0)
	);
end hcsr04;

architecture behavior of hcsr04 is
	constant rate_100ms : std_logic_vector(8 downto 0) := std_logic_vector(to_unsigned(500, 9));
	signal en_count : std_logic;
	signal trig_count : std_logic_vector(8 downto 0);
	signal echo_count : unsigned(15 downto 0);
	
	component counter
		generic(size: integer := 9);
		port(
			clk : in std_logic;
			rst : in std_logic;
			load : in std_logic;
			enable : in std_logic;
			load_value : in std_logic_vector(size-1 downto 0);
			max_value : in std_logic_vector(size-1 downto 0);
			counter_value : out std_logic_vector(size-1 downto 0)
		);
	end component;

begin
	CNT1 : counter generic map (size => 9)
	port map (
		clk => clk,
		rst => rst,
		load => '0',
		enable => en_count,
		load_value => (others => '0'),
		max_value => rate_100ms,
		counter_value => trig_count
	);
	
	process(clk)
	variable computing : std_logic;
	variable init : std_logic;
	variable calc_dist : std_logic_vector(15 downto 0);
	
	begin
		if rst = '1' then
			trig <= '0';
			en_count <= '0';
			echo_count <= (others => '0');
			computing := '0';
			init := '0';
			calc_dist := (others => '0');
		elsif rising_edge(clk) then
			if computing = '0' then
				trig <= '1';
				en_count <= '1';
				echo_count <= (others => '0');
				computing := '1';
				init := '1';
			else
				if trig_count = rate_100ms then
					trig <= '0';
					en_count <= '0';
					init := '1';
				elsif init = '1' then
						if echo = '1' then
							echo_count <= echo_count + 1;
						elsif std_logic_vector(echo_count) /= "0000000000000000" then
							computing := '0';
							init := '0';
							calc_dist := std_logic_vector(echo_count);
						end if;
					end if;
			end if;
		end if;
		dist <= calc_dist;
	end process;
end behavior;