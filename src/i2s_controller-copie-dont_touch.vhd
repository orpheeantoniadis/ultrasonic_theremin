library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2s_controller is
	port(
    -- AVALON connections --
		clock  : in std_logic; -- wrapped to MCLK (need PLL)
    nReset : in std_logic;
    addresse : in std_logic_vector(2 downto 0);
    chip_select : in std_logic;
    write : in std_logic;
    write_data : in std_logic_vector(15 downto 0); -- data   : in std_logic_vector(31 downto 0) := (others => '0');
    read : in std_logic;
    read_data : out std_logic_vector(15 downto 0);

    -- outputs
		GPIO_2_D0   : out std_logic := '0'; -- Master clock (MCLK)
		GPIO_2_D1   : out std_logic := '0'; -- Left/right select (LRCK)
		GPIO_2_D2   : out std_logic := '0'; -- Data out (SD)
    GPIO_2_D3   : out std_logic := '0'  -- Data clock (not used in this behavior) (SCK)
	);
end i2s_controller;

architecture behavioral of i2s_controller is


component i2s is
  port(
    CLOCK  : in std_logic; -- wrapped to MCLK (need PLL)
    enable : in std_logic;
    data   : in std_logic_vector(31 downto 0) := (others => '0');
    MCLK   : out std_logic := '0'; -- Master clock
    LRCK   : out std_logic := '0'; -- Left/right select
    SD     : out std_logic := '0'; -- Data out
    SCK    : out std_logic := '0'  -- Data clock (not used in this behavior)
  );
end component;

-------- registres -------


---------------------------- pour debug/test ----------------------------------------------------------
signal divider : integer := 0;
signal counter : integer := 0;
signal sound : std_logic_vector(31 downto 0);

subtype amp is std_logic_vector(31 downto 0);
type sound_t is array (12 downto 0) of amp;

constant sound1 : sound_t := (
	0  => "00000000000000000000000000000000",
	1  => "00000000000010000000000000001000",
	2  => "00000000000100000000000000010000",
	3  => "00000000001000000000000000100000",
	4  => "00000001100000000000000011000000",
	5  => "00000001000000000000000100000000",
	6  => "00000100000000000000010000000000",
	7  => "00001000000000000000100000000000",
	8  => "00010000000000000001000000000000",
	9  => "00100000000000000010000000000000",
	10 => "01000000000000000100000000000000",
	11 => "10000000000000001000000000000000",
  12 => "11111111111111111111111111111111"
);

begin

  i2s_comp: i2s port map(
  CLOCK  => clock,
  enable => '1',
  data   => sound,
  MCLK   => GPIO_2_D0,
  LRCK   => GPIO_2_D1,
  SD     => GPIO_2_D2,
  SCK    => GPIO_2_D3);

  sound <= sound1(counter);

  -- pour le moment, seulement pour debug/teste le DAC
  process(clock)
  begin
    divider <= divider+1;
    if divider = 500 then
      divider <= 0;
      counter <= counter+1;
    end if;
    if counter = 12 then
      counter <= 0;
    end if;
  end process;


end behavioral;
