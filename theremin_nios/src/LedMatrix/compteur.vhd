library ieee;
use ieee.std_logic_1164.all;
use ieee.Numeric_Std.all;

entity compteur is
	generic(size: integer := 8);
	port(
		clk : in std_logic;
		rst : in std_logic;
		load : in std_logic;
		enable : in std_logic;
		load_value : in std_logic_vector(size-1 downto 0) := (others => '0');
		max_value : in std_logic_vector(size-1 downto 0) := (others => '1');
		counter_value : out std_logic_vector(size-1 downto 0) := (others => '0')
	);
end compteur;

architecture behavior of compteur is
	signal count : unsigned(size-1 downto 0) := (others => '0');

begin
	process(clk)
		begin
		if rising_edge(clk) then
			if rst='1' then
				count <= (others => '0');
			elsif load='1' then
				count <= unsigned(load_value);
			elsif enable='0' then
				count <= count;
			elsif std_logic_vector(count)=max_value then
				count <= (others => '0');
			else
				count <= count+1;
			end if;
			counter_value <= std_logic_vector(count);
		end if;
	end process;
end behavior;
