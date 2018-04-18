library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;
use work.GeneralPkg.all;

entity LedMatrix is
	generic(size: integer := 16);
	port(
		-- Avalon interface signals
		Clk : in std_logic;
		nReset : in std_logic;

		Address : in std_logic_vector(6 downto 0);
		ChipSelect : in std_logic;

		Read : in std_logic;
		Write : in std_logic;

		ReadData : out std_logic_vector(size-1 downto 0);
		WriteData : in std_logic_vector(size-1 downto 0);

		-- LedMatrix external interfaces
		LED_SelC_n : out std_logic_vector(11 downto 0);
		LED_Sel_R : out std_logic_vector(7 downto 0);
		LED_Sel_G : out std_logic_vector(7 downto 0);
		LED_Sel_B : out std_logic_vector(7 downto 0)
	);
end LedMatrix;

architecture behavior of LedMatrix is
	-- signals for register access
	signal iRegData : pixels_t := (others => (others => '0'));
	
	signal m_image : image_t := empty_img;
	signal Reset : std_logic;

begin
	Reset <= not nReset;
	
	PATTERN0 : pattern
	port map (
		CLOCK => Clk,
		Button_n0 => Reset,
		img => m_image,
		LED_SelC_n => LED_SelC_n,
		LED_Sel_R => LED_Sel_R,
		LED_Sel_G => LED_Sel_G,
		LED_Sel_B => LED_Sel_B
	);

	-- Write Process
	pRegWr : process(Clk, nReset)
	begin
		if Reset = '1' then
			iRegData <= (others => (others => '0'));
		elsif rising_edge(Clk) then
			if ChipSelect = '1' and Write = '1' then
				iRegData(to_integer(unsigned(Address))) <= writeData(2 downto 0);
			end if;
		end if;
	end process pRegWr;
	
	-- Read Process
	pRegRd : process(Clk)
	begin
		if rising_edge(Clk) then
			ReadData <= (others => '0');
			if ChipSelect = '1' and Read = '1' then
				ReadData(2 downto 0) <= iRegData(to_integer(unsigned(Address)));
			end if;
		end if;
	end process pRegRd;
	
	-- Led Matrix output values
	pImage : process(iRegData)
	begin
		for i in 0 to 11 loop
			for j in 0 to 7 loop
				m_image(0)(i)(j) <= iRegData(j*12+i)(0);
				m_image(1)(i)(j) <= iRegData(j*12+i)(1);
				m_image(2)(i)(j) <= iRegData(j*12+i)(2);
			end loop;
		end loop;
	end process pImage;

end behavior;
