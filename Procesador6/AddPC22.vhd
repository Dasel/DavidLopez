library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.all;

entity AdderPC22 is
	Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
          disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
          suma : out  STD_LOGIC_VECTOR (31 downto 0));
end AdderPC22;

architecture arq_AdderPC22 of AdderPC22 is

begin
process(PC,disp22) is
begin
	suma <= std_logic_vector(unsigned(PC) + unsigned(disp22));
end process;

end arq_AdderPC22;
