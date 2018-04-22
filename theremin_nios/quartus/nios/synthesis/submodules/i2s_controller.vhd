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
		ready	 : out std_logic; -- 32 bits sent
    MCLK   : out std_logic := '0'; -- Master clock
    LRCK   : out std_logic := '0'; -- Left/right select
    SD     : out std_logic := '0'; -- Data out
    SCK    : out std_logic := '0'  -- Data clock (not used in this behavior)
  );
end component;

-------- registres -------
signal iRegCtrl  : std_logic_vector(7 downto 0) := (others => '0');
--signal iRegDataL  : std_logic_vector(15 downto 0) := (others => '0');
--signal iRegDataR  : std_logic_vector(15 downto 0) := (others => '0');
signal iRegData : std_logic_vector(31 downto 0) := (others => '0');
signal iRegBuffer : std_logic_vector(31 downto 0) := (others => '0');

------- datas --------
signal sent : std_logic := '0';
signal en : std_logic := '0';

begin

	i2s_comp: i2s port map(
  CLOCK  => clock,
  enable => en, -- whe bit0 iRegCtrl = 1, enable i2s component directly
  data   => iRegData,
	ready	 => sent,
  MCLK   => GPIO_2_D0,
  LRCK   => GPIO_2_D1,
  SD     => GPIO_2_D2,
  SCK    => GPIO_2_D3);

	-- write process
	pRegWr : process(clock, nReset)
	begin
	  if nReset = '0' then
	    iRegCtrl <= (others => '0');
	    iRegBuffer <= (others => '0');
	  elsif rising_edge(clock) then
	    if chip_select = '1' and write = '1' then -- write cycle
	      case addresse is
	        when "000" => iRegCtrl  <= write_data(7 downto 0);
	        when "001" => iRegBuffer(31 downto 16) <= write_data; -- write left
			  when "010" => iRegBuffer(15 downto 0) <= write_data;  -- write right
	        when others => null;
	      end case;
	    end if;
			-- if sent = '1' then
			-- 	iRegCtrl(1) <= '1';
			-- end if;
	  end if;
	end process pRegWr;

	pSent : process(sent)
	begin
		if sent = '1' then
			iRegData <= iRegBuffer;
		end if;
	end process pSent;

	-- IRQ process
	-- pIRQ : process(iRegCtrl)
	-- begin
	-- 	if iRegCtrl(1) = '1' then
	-- 		irq <= '1';
	-- 	else
	-- 		irq <= '0';
	-- 	end if;
	-- end process pIRQ;

	-- control process
	pRegCtrl : process(iRegCtrl)
	begin
		if iRegCtrl(0) = '1' then
			en <= '1';
		else
			en <= '0';
		end if;
	end process pRegCtrl;


end behavioral;
