library ieee;
use ieee.std_logic_1164.all;

entity Ultrasound is
	port(
		-- Avalon interface signals
		Clk : in std_logic;
		nReset : in std_logic;

		ChipSelect : in std_logic;

		Read : in std_logic;
		ReadData : out std_logic_vector(31 downto 0);
		
		-- ultrasound external interfaces
		Echo : in std_logic;
		Trig : out std_logic
		
	);
end Ultrasound;

architecture behavior of Ultrasound is
	component hcsr04
		port(
			clk : in std_logic;
			rst : in std_logic;
			echo : in std_logic;
			trig : out std_logic;
			dist : out std_logic_vector(31 downto 0)
		);
	end component;
	
	signal iRegData : std_logic_vector(31 downto 0) := (others => '0');
	signal Reset : std_logic;

begin
	Reset <= not nReset;
	
	CAPTOR0 : hcsr04
	port map (
		clk => Clk,
		rst => Reset,
		echo => Echo,
		trig => Trig,
		dist => iRegData
	);
	
	-- Read Process
	pRegRd : process(Clk)
	begin
		if rising_edge(Clk) then
			ReadData <= (others => '0');
			if ChipSelect = '1' and Read = '1' then
				ReadData <= iRegData;
			end if;
		end if;
	end process pRegRd;

end behavior;
