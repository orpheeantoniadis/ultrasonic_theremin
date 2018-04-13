library ieee;
use ieee.std_logic_1164.all;

package i2s_pattern is

subtype pixel is std_logic_vector(2 downto 0); -- bit0 = R, bit1 = G, bit2 = B
type ligne is array (7 downto 0) of pixel; -- tableau de pixel (représente tous les pixels d'une ligne)
type img_t is array (11 downto 0) of ligne; -- ainsi on ajoute la colonne et on obtient le type image

type amp is std_logic_vector(31 downto 0);
type sound_t is array (11 downto 0) of amp;

constant sound1 : sound_t := (
	0 => ("01100011011000001111000011110000"),
	1 => ("01100011011000001111000011110000"),
	2 => ("01100011011000001111000011110000"),
	3 => ("01100011011000001111000011110000"),
	4 => ("01100011011000001111000011110000"),
	5 => ("01100011011000001111000011110000"),
	6 => ("01100011011000001111000011110000"),
	7 => ("01100011011000001111000011110000"),
	8 => ("01100011011000001111000011110000"),
	9 => ("01100011011000001111000011110000"),
	10 => ("01100011011000001111000011110000"),
	11 => ("01100011011000001111000011110000")
);


constant smiley : img_t := (
		2 => (1 => "010", others => "000"),
		3 => (1 => "100", 3 => "100", others => "000"),
		4 => (2 => "111", 3 => "110", others => "000"),
		5 => (1 => "101", 3 => "100", others => "000"),
		6 => (1 => "010", others => "000"),
		others => (others => (others => '0')));

constant heart_mini : img_t := (
		2 => (1 => "010", others => "000"),
		3 => (4 => "100", 1 => "100", others => "000"),
		4 => (1 => "111", 3 => "110", others => "000"),
		5 => (4 => "101", 3 => "100", others => "000"),
		8 => (5 => "010", others => "000"),
		others => (others => (others => '0')));

end i2s_pattern;
