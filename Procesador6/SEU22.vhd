----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:49:31 11/08/2016 
-- Design Name: 
-- Module Name:    SEU22 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SEU22 is
    Port ( SEU22 : in  STD_LOGIC_VECTOR (21 downto 0);
           out32 : out  STD_LOGIC_VECTOR (31 downto 0));

end SEU22;

architecture Behavioral of SEU22 is

begin
process(SEU22)
	begin
		if(SEU22(21) = '1')then
			out32(21 downto 0) <= SEU22;
			out32(31 downto 22) <= (others=>'1');
		else
			out32(21 downto 0) <= SEU22;
			out32(31 downto 22) <= (others=>'0');
		end if;
	end process;


end Behavioral;

