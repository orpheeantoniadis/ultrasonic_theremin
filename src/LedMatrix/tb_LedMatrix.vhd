library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;

entity tb_LedMatrix is
end tb_LedMatrix;

architecture behavior of tb_LedMatrix is
	--Inputs
	signal clk : std_logic := '0';
	signal rst : std_logic := '0';
	signal addr : std_logic_vector(6 downto 0) := (others => '0');
	signal CS : std_logic := '0';
	signal re : std_logic := '0';
	signal wr : std_logic := '0';
	signal WriteData : std_logic_vector(15 downto 0) := (others => '0');

	--Outputs
	signal ReadData : std_logic_vector(15 downto 0) := (others => '0');
	signal col : std_logic_vector(11 downto 0) := (others => '0');
	signal r : std_logic_vector(7 downto 0) := (others => '0');
	signal g : std_logic_vector(7 downto 0) := (others => '0');
	signal b : std_logic_vector(7 downto 0) := (others => '0');

	-- Clock period definitions
	constant clock_period : time := 20 ns;
	
	-- Component Declaration for the Unit Under Test (UUT)
	component LedMatrix
		generic(size: integer := 16);
		port(
			Clk : in std_logic;
			nReset : in std_logic;
			Address : in std_logic_vector(6 downto 0);
			ChipSelect : in std_logic;
			Read : in std_logic;
			Write : in std_logic;
			ReadData : out std_logic_vector(size-1 downto 0);
			WriteData : in std_logic_vector(size-1 downto 0);
			LED_SelC_n : out std_logic_vector(11 downto 0);
			LED_Sel_R : out std_logic_vector(7 downto 0);
			LED_Sel_G : out std_logic_vector(7 downto 0);
			LED_Sel_B : out std_logic_vector(7 downto 0)
		);
	end component;

begin
	-- Instantiate the Unit Under Test (UUT)
	uut : LedMatrix
	port map (
		Clk => clk,
		nReset => rst,
		Address => addr,
		ChipSelect => CS,
		Read => re,
		Write => wr,
		ReadData => ReadData,
		WriteData => WriteData,
		LED_SelC_n => col,
		LED_Sel_R => r,
		LED_Sel_G => g,
		LED_Sel_B => b
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
		-- reset system
		rst <= '0';
		wait for clock_period*5;
		rst <= '1';
		wait for clock_period*5;
		-- chip select
		CS <= '1';
		wait for clock_period*5;
		-- addr select
		addr <= "0000000";
		wait for clock_period*5;
		-- writing data..
		WriteData <= "0000000000000111";
		wait for clock_period*5;
		wait for clock_period/2;
		wr <= '1';
		wait for clock_period;
		wr <= '0';
		wait for clock_period*5;
		-- reading data..
		re <= '1';
		wait for clock_period;
		re <= '0';
		wait for clock_period*50;
		-- addr select
		addr <= "0000001";
		wait for clock_period*5;
		-- writing data..
		WriteData <= "0000000000000001";
		wait for clock_period*5;
		wait for clock_period/2;
		wr <= '1';
		wait for clock_period;
		wr <= '0';
		wait for clock_period*5;
		-- chip select
		CS <= '0';
		wait;
	end process;
end behavior;
