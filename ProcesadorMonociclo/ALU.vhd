----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:07:17 10/08/2016 
-- Design Name: 
-- Module Name:	ALU - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( aluOP : in  STD_LOGIC_VECTOR (5 downto 0);
           CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture Behavioral of ALU is

begin
	process(CRs1,CRs2,aluOP)
	begin
	   case (aluOP) is 
			when "000001" => -- Add
				AluResult <= CRs1 + CRs2;
			when "000010" => -- Sub
				AluResult <= CRs1 - CRs2;
			when "000011" => -- And
				AluResult <= CRs1 and CRs2;
			when "000100" => -- Nand
				AluResult <= CRs1 nand CRs2;
			when "000101" => -- Or
				AluResult <= CRs1 or CRs2;
			when "000110" => -- Nor
				AluResult <= CRs1 nor CRs2;
			when "000111" => -- Xor
				AluResult <= CRs1 xor CRs2;
			when "001000" => -- Xnor
				AluResult <= CRs1 xnor CRs2;
			when others => 
				AluResult <= (others=>'0');
		end case;
	end process;

end Behavioral;