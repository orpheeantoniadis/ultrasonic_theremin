library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;

package GeneralPkg is
	-- TYPES DECLARATION --
	type line_t is array (11 downto 0) of std_logic_vector(7 downto 0);
	type image_t is array (2 downto 0) of line_t;
	type pixels_t is array (95 downto 0) of std_logic_vector(2 downto 0);

	-- COMPONENTS DECLARATION --
	component compteur
		generic(size: integer := 32);
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
	
	component pression_detect
		port(
			clk : in std_logic;
			button : in std_logic;
			pulse : out std_logic
		);
	end component;

	component pattern
		port(
			CLOCK : in std_logic;
			Button_n0 : in std_logic;
			img : in image_t;
			LED_SelC_n : out std_logic_vector(11 downto 0);
			LED_Sel_R : out std_logic_vector(7 downto 0);
			LED_Sel_G : out std_logic_vector(7 downto 0);
			LED_Sel_B : out std_logic_vector(7 downto 0)
		);
	end component;

	-- LED SHIELD SIZE
	constant nb_lines : std_logic_vector(3 downto 0) := "1000";
	constant nb_cols : std_logic_vector(3 downto 0) := "1011";

	-- TIME CONSTANTS (50MHZ CLOCK)
	constant rate_2s : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(100000000, 32));
	constant rate_1s : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(50000000, 32));
	constant rate_800ms : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(40000000, 32));
	constant rate_500ms : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(25000000, 32));
	constant rate_200ms : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(10000000, 32));
	constant rate_100ms : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(5000000, 32));
	constant rate_50ms : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(2500000, 32));
	
	-- LEDS REFRESH RATE CONSTANTS (50MHZ for 12x8 leds)
	constant rate_50Hz : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(83333, 32));
	constant rate_100Hz : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(41666, 32));
	
	-- LEDS REFRESH RATE FOR TESTBENCHS
	-- constant rate_100Hz : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(41, 32));

	

	-- IMAGES CONSTANTS
	constant empty_img : image_t := (others => (others => (others => '0')));
	
	constant happy_smiley : image_t := (
	("11111111",
	"10000001",
	"10110001",
	"10100101",
	"10100001",
	"10100001",
	"10100001",
	"10100001",
	"10100101",
	"10110001",
	"10000001",
	"11111111"),
	("11111111",
	"10000001",
	"10110001",
	"10100101",
	"10100001",
	"10100001",
	"10100001",
	"10100001",
	"10100101",
	"10110001",
	"10000001",
	"11111111"),
	(others => (others => '0'))
	);

	constant sad_smiley : image_t := (
	("11111111",
	"10000001",
	"11100001",
	"10100101",
	"10100001",
	"10100001",
	"10100001",
	"10100001",
	"10100101",
	"11100001",
	"10000001",
	"11111111"),
	("11111111",
	"10000001",
	"11100001",
	"10100101",
	"10100001",
	"10100001",
	"10100001",
	"10100001",
	"10100101",
	"11100001",
	"10000001",
	"11111111"),
	(others => (others => '0'))
	);

	constant yellow_circle : image_t := (
	("00000000",
	"00000000",
	"00111100",
	"01000010",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"01000010",
	"00111100",
	"00000000",
	"00000000"),
	("00000000",
	"00000000",
	"00111100",
	"01000010",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"01000010",
	"00111100",
	"00000000",
	"00000000"),
	(others => (others => '0'))
	);

	constant green_circle : image_t := (
	(others => (others => '0')),
	("00000000",
	"00000000",
	"00111100",
	"01000010",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"01000010",
	"00111100",
	"00000000",
	"00000000"),
	(others => (others => '0'))
	);

	constant red_square : image_t := ( 
	("11111111",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"10000001",
	"11111111"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant big_heart : image_t := ( 
	("00000000",
	"00001110",
	"00010001",
	"00100001",
	"01000001",
	"10000010",
	"10000010",
	"01000001",
	"00100001",
	"00010001",
	"00001110",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant small_heart : image_t := ( 
	("00000000",
	"00000000",
	"00000000",
	"00011100",
	"00100010",
	"01000100",
	"01000100",
	"00100010",
	"00011100",
	"00000000",
	"00000000",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant letter_f : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000010",
	"00001010",
	"01111110",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000" ),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant letter_p : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"00000000",
	"00011110",
	"00010010",
	"01111110",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000" ),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant letter_g : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"00000000",
	"00010000",
	"01110010",
	"01000010",
	"01111110",
	"00000000",
	"00000000",
	"00000000",
	"00000000" ),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant letter_a : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"00000000",
	"01111110",
	"00010010",
	"01111110",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant number_1 : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"11111110",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant number_2 : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"10011110",
	"10010010",
	"10010010",
	"10010010",
	"10010010",
	"11110010",
	"00000000",
	"00000000",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant number_3 : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"11111110",
	"10010010",
	"10010010",
	"10010010",
	"10010010",
	"00000000",
	"00000000",
	"00000000",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant number_4 : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"11111110",
	"00010000",
	"00010000",
	"00010000",
	"00011110",
	"00000000",
	"00000000",
	"00000000",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);

	constant number_5 : image_t := (
	("00000000",
	"00000000",
	"00000000",
	"11110010",
	"10010010",
	"10010010",
	"10010010",
	"10010010",
	"10011110",
	"00000000",
	"00000000",
	"00000000"),
	(others => (others => '0')),
	(others => (others => '0'))
	);
	
	constant gol_pattern : image_t := (
	(others => (others => '0')),
	(others => (others => '0')), 
	("00000000",
	"01001010",
	"00010110",
	"00101000",
	"01101110",
	"00100100",
	"00001010",
	"01110110",
	"00101010",
	"01001000",
	"00101100",
	"00000000")
	);
	
	constant gol_blinker : image_t := (
	(others => (others => '0')),
	(others => (others => '0')), 
	("00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00011100",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000",
	"00000000")
	);
	
	constant gol_glider : image_t := (
	(others => (others => '0')),
	(others => (others => '0')), 
	("00000000",
	"00110000",
	"00101000",
	"00100000",
	"00001100",
	"00001010",
	"00001000",
	"00000000",
	"00001100",
	"00001010",
	"00001000",
	"00000000")
	);
	
end GeneralPkg;