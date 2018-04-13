library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity compteur is
	generic(size: integer :=8);
	port(
		CLOCK : in std_logic;
		rst : in std_logic;
		load : in std_logic;
		enable : in std_logic;
		cary : out std_logic;
		load_value : in std_logic_vector(size-1 downto 0) := (others => '0');
		max_value : in std_logic_vector(size-1 downto 0);
		counter_value : out std_logic_vector(size-1 downto 0) := (others => '0')
	);
end compteur;

architecture behavioral of compteur is
signal count: unsigned(size-1 downto 0) := (others => '0');
begin
	counter_value <= std_logic_vector(count);
	process(CLOCK)
	begin
		if rising_edge(CLOCK) then
			if rst='1' then
				count <= (others=>'0');
			elsif load='1' then
				count <= unsigned(load_value);
			elsif enable='1' then
				if count = unsigned(max_value) then
					count <= (others=>'0');
				else
					count <= count+1;
				end if;
			end if;
		end if;
	end process;

	cary <= '1' when unsigned(max_value) = count else
			'0';

end behavioral;
