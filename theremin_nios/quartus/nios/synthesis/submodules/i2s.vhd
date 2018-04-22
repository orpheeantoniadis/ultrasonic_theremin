library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity i2s is
	port(
		CLOCK  : in std_logic; -- wrapped to MCLK (need PLL)
		enable : in std_logic;
		data   : in std_logic_vector(31 downto 0) := (others => '0');
		ready	 : out std_logic := '0'; -- 32 bits sent

		MCLK   : out std_logic := '0'; -- Master clock
		LRCK   : out std_logic := '0'; -- Left/right select
		SD     : out std_logic := '0'; -- Data out
    SCK    : out std_logic := '0'  -- Data clock (not used in this behavior)
	);
end i2s;

architecture behavioral of i2s is
-- all rate calculate with CLOCK entry (which is also MCLK)
constant rate_LRCK : std_logic_vector(7 downto 0) := std_logic_vector(to_unsigned(31, 8));
--constant rate_SCK  : std_logic_vector(1 downto 0) := std_logic_vector(to_unsigned(1, 2));
constant rate_DATA : std_logic_vector(2 downto 0) := std_logic_vector(to_unsigned(1, 3));
-- counters
signal LRCK_c : unsigned(7 downto 0) := (others => '0');
signal SCK_c  : unsigned(1 downto 0) := (others => '0');
signal DATA_c : unsigned(2 downto 0) := (others => '0');

-- need it, because of the first bit of each channel
--signal bit_count : std_logic_vector(6 downto 0) := (others => '0');
signal bit_count : integer := 0;

-- those signals are used to invert output clocks
signal blrck : std_logic := '0';
signal bsck : std_logic := '0';

begin


	MCLK <= CLOCK when enable = '1' else
			'0';
	LRCK <= blrck;
	SCK <= bsck; -- attention avec les signaux et les sorties, ca marche enfin !

	-- clocks manager process
	process(CLOCK,enable)
	begin
			if rising_edge(CLOCK) then
				ready <= '0';
				if enable='1' then
					LRCK_c <= LRCK_c+1;
					SCK_c <= SCK_c+1;
					DATA_c <= DATA_c+1;

					if std_logic_vector(LRCK_c) = rate_LRCK then -- if LRCK rate is reached
							blrck <= not blrck;
							LRCK_c <= (others => '0');
					end if;
					--if std_logic_vector(SCK_c) = "01"	then	-- if SCK rate is reached
						bsck <= not bsck;
						--SCK_c <= (others => '0');
					--end if;
					if std_logic_vector(DATA_c) = rate_DATA	then -- if data rate is reached
						SD <= data(31-bit_count); -- output write
						bit_count <= bit_count+1;
						DATA_c <= (others => '0');
						if bit_count = 31 then
							bit_count <= 0;
							ready <= '1';
						end if;
					end if;
				else
					bit_count <= 0;
					blrck <= '0';
					SD <= '0';
					bsck <= '0';
					LRCK_c <= (others => '0');
					SCK_c <= (others => '0');
					DATA_c <= (others => '0');
				end if;
			end if;
	end process;

end behavioral;
