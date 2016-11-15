library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity sumador_disp30 is
	port(A,B : in std_logic_vector(31 downto 0);
         SUM : out std_logic_vector(31 downto 0));
end sumador_disp30;

architecture Behavioral of sumador_disp30 is

begin

	SUM <= (A + B);
	
end Behavioral;

