library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use ieee.math_real.all;

entity tb_i2s is
end tb_i2s;

architecture behavior of tb_i2s is
	--Inputs
	signal clk : std_logic := '0';

	-- bidons
	signal enable : std_logic := '0';
	signal addresse : std_logic_vector(2 downto 0);
	signal data : std_logic_vector(15 downto 0) := (others => '0');--"01100011011000001111000011110000";

	--Outputs
	signal mclk : std_logic;
	signal lrck : std_logic;
	signal sd : std_logic;
	signal sck : std_logic;

	-- Clock period definitions
	constant clock_period : time := 20 ns;

	-- Component Declaration for the Unit Under Test (UUT)
	component i2s_controller
		port(
			-- AVALON connections --
			clock  : in std_logic; -- wrapped to MCLK (need PLL)
			nReset : in std_logic;
			addresse : in std_logic_vector(2 downto 0);
			chip_select : in std_logic;
			write : in std_logic;
			write_data : in std_logic_vector(15 downto 0);

			-- outputs
			GPIO_2_D0   : out std_logic := '0'; -- Master clock (MCLK)
			GPIO_2_D1   : out std_logic := '0'; -- Left/right select (LRCK)
			GPIO_2_D2   : out std_logic := '0'; -- Data out (SD)
			GPIO_2_D3   : out std_logic := '0'  -- Data clock (not used in this behavior) (SCK)
		);
	end component;

begin
	-- Instantiate the Unit Under Test (UUT)
	uut : i2s_controller
	port map (
		clock  			=> clk,
		nReset 			=> '1',
		addresse 		=> addresse,
		chip_select => '1',
		write => '1',
		write_data => data,

		-- outputs
		GPIO_2_D0   => mclk, -- Master clock (MCLK)
		GPIO_2_D1   => lrck, -- Left/right select (LRCK)
		GPIO_2_D2   => sd, -- Data out (SD)
		GPIO_2_D3   => sck  -- Data clock (not used in this behavior) (SCK)
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

	begin
		enable <= '0';
		addresse <= "000";
		data <= "0000000000000001";
		wait for 10*clock_period;
		enable <= '1';
		wait for 2000 ns;

		addresse <= "001";
		data <= "0011000011000000";
		wait for 2000 ns;
		addresse <= "010";
		data <= "0111000011111000";

		wait for 2000 ms;
		enable <= '0';
		wait;
	end process;
end behavior;
