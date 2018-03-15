library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use ieee.math_real.all;

entity tb_hcsr04 is
end tb_hcsr04;

architecture behavior of tb_hcsr04 is
	--Inputs
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal echo : std_logic := '0';

	--Outputs
	signal trig : std_logic;
	signal dist : std_logic_vector(15 downto 0);

	-- Clock period definitions
	constant clock_period : time := 20 ns;
	
	-- Component Declaration for the Unit Under Test (UUT)
	component hcsr04
		port(
			clk : in std_logic;
			rst : in std_logic;
			echo : in std_logic;
			trig : out std_logic;
			dist : out std_logic_vector(15 downto 0)
		);
	end component;

begin
	-- Instantiate the Unit Under Test (UUT)
	uut : hcsr04
	port map (
		clk => clk,
		rst => rst,
		echo => echo,
		trig => trig,
		dist => dist
	);

	-- Clock process definitions
	clock_process : process
	begin
		clk <= '0';
		wait for clock_period/2;
		clk <= '1';
		wait for clock_period/2;
	end process;

	-- Stimulus process
	stim_proc : process
	variable seed1 : positive := 425167809;
	variable seed2 : positive := 563872878;
	variable rand: real;
	variable int_rand: integer;
	
	begin
		rst <= '1';
		wait for clock_period * 10;
		rst <= '0';
		
		for i in 0 to 10 loop
			UNIFORM(seed1, seed2, rand);
			int_rand := INTEGER(TRUNC(rand*4096.0));
			wait until (trig = '0');
			echo <= '1';
			wait for clock_period * int_rand;
			echo <= '0';
		end loop;
		wait;
	end process;
end behavior;
