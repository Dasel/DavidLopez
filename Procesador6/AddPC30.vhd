
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;


entity AdderPC30 is
	Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
			 disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
          suma : out  STD_LOGIC_VECTOR (31 downto 0));
			 
end AdderPC30;

architecture arq_AdderPC30 of AdderPC30 is

begin
process(disp30,PC) is
begin
	suma <= std_logic_vector(unsigned(disp30) + unsigned(PC));
end process;
end arq_AdderPC30;

