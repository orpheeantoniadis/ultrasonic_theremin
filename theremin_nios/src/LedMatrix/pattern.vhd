library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use work.GeneralPkg.all;

entity pattern is
	port(
		CLOCK : in std_logic;
		Button_n0 : in std_logic;
		img : in image_t;
		LED_SelC_n : out std_logic_vector(11 downto 0);
		LED_Sel_R : out std_logic_vector(7 downto 0);
		LED_Sel_G : out std_logic_vector(7 downto 0);
		LED_Sel_B : out std_logic_vector(7 downto 0)
	);
end pattern;

architecture behavior of pattern is
	signal en_cnt2 : std_logic := '0';
	signal clock_count : std_logic_vector(31 downto 0);
	signal col_count : std_logic_vector(3 downto 0);

begin
	CNT1 : compteur generic map (size => 32)
	port map (
		clk => CLOCK,
		rst => Button_n0,
		load => '0',
		enable => '1',
		load_value => (others => '0'),
		max_value => rate_100Hz,
		counter_value => clock_count
	);

	CNT2 : compteur generic map (size => 4)
	port map (
		clk => CLOCK,
		rst => Button_n0,
		load => '0',
		enable => en_cnt2,
		load_value => (others => '0'),
		max_value => nb_cols,
		counter_value => col_count
	);

	process(CLOCK)
	begin
		if rising_edge(CLOCK) then
			if clock_count = rate_100Hz then
				en_cnt2 <= '1';
			else
				en_cnt2 <= '0';
			end if;
		end if;
		LED_SelC_n <= (others => '1');
		LED_SelC_n(to_integer(unsigned(col_count))) <= '0';
		LED_Sel_R <= img(2)(to_integer(unsigned(col_count)));
		LED_Sel_G <= img(1)(to_integer(unsigned(col_count)));
		LED_Sel_B <= img(0)(to_integer(unsigned(col_count)));
	end process;
end behavior;
