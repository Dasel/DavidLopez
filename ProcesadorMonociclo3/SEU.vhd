----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:32:09 10/09/2016 
-- Design Name: 
-- Module Name:    SEU - Behavioral 
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

entity SEU is
	 Port ( imm : in  STD_LOGIC_VECTOR (12 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));

end SEU;

architecture Behavioral of SEU is

begin
	process(imm)
	begin
		
		dataOut(12 downto 0) <= imm;
		if(imm(12) = '0')then
			dataOut(31 downto 13) <= (others=>'0');
		else
			dataOut(31 downto 13) <= (others=>'1');
		end if;			
	
	end process;


end Behavioral;

