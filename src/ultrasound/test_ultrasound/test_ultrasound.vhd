library ieee;
use ieee.std_logic_1164.all;

entity test_ultrasound is
  port(
	CLOCK : in std_logic;
	Button_n0 : in std_logic; 
	GPIO_2_D2 : inout std_logic; -- PIO_22
	GPIO_2_D3 : inout std_logic; -- PIO_23
	Sw_LedA : out std_logic_vector(7 downto 0);
	Sw_LedB : out std_logic_vector(7 downto 0)
  );
end test_ultrasound;

architecture struct_behav of test_ultrasound is

	component hcsr04
		port(
			clk : in std_logic;
			rst : in std_logic;
			echo : in std_logic;
			trig : out std_logic;
			dist : out std_logic_vector(31 downto 0)
		);
	end component;

	signal calc_dist : std_logic_vector(31 downto 0);

begin
	uut : hcsr04
	port map (
		clk => CLOCK,
		rst => not Button_n0,
		echo => GPIO_2_D3,
		trig => GPIO_2_D2,
		dist => calc_dist
	);
	
	Sw_LedA <= calc_dist(31 downto 24);
	Sw_LedB <= calc_dist(23 downto 16);

end struct_behav;
