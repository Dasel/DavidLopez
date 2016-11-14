----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:28:46 10/11/2016 
-- Design Name: 
-- Module Name:    PSRM - Behavioral 
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

entity PSRM is
    Port ( 
			  Op1 : in  STD_LOGIC;
           Op2 : in  STD_LOGIC;
			  OP: in STD_LOGIC_VECTOR(1 downto 0);
			  Aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  reset : in STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRM;

architecture Behavioral of PSRM is

begin

	process(Op1,Op2,OP,Aluresult,Aluop,reset)
	begin
	
	if (reset = '1')then
		nzvc <= (others => '0');
		
	else		
		if(Aluop = "001001" or Aluop = "001011")then 
			nzvc(3) <= Aluresult(31);				
			nzvc(1) <= (Op1 and Op2 and (not Aluresult(31))) or ((not Op1) and (not Op2) and Aluresult(31));
			nzvc(0) <= (Op1 and Op2) or ((not Aluresult(31)) and (Op1 or Op2));
			
		else
			if(Aluop = "001100" or Aluop = "001110")then 
				nzvc(3) <= Aluresult(31);			
				nzvc(1) <= ((Op1 and (not Op2) and (not Aluresult(31))) or ((not Op1) and Op2 and Aluresult(31)));
				nzvc(0) <= ((not Op1) and Op2) or (Aluresult(31) and ((not Op1) or Op2));
				
			else
				if(Aluop = "001111" or Aluop = "010000" or Aluop = "010001" or Aluop = "010010" or Aluop = "010011" or Aluop = "010100")then
					nzvc(3) <= Aluresult(31);				
					nzvc(1) <= '0';
					nzvc(0) <= '0';
				
				end if;
			end if;
		end if;
		
		if(Aluresult = X"00000000")then
				nzvc(2) <= '1';
			else
				nzvc(2) <= '0';
			end if;	
	end if;
	end process;

end Behavioral;