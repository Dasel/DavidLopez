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
			  op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  carry : in STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;


architecture Behavioral of ALU is

begin

	process(op1,op2,aluOP)
	
	begin
	   case (aluOP) is 
			when "000001" => -- Add
				AluResult <= op1 + op2;				
			when "000010" => -- Sub
				AluResult <= op1 - op2;				
			when "000011" => -- And
				AluResult <= op1 and op2;				
			when "000100" => -- Nand
				AluResult <= op1 nand op2;
			when "000101" => -- Or
				AluResult <= op1 or op2;
			when "000110" => -- Nor
				AluResult <= op1 nor op2;
			when "000111" => -- Xor
				AluResult <= op1 xor op2;
			when "001000" => -- Xnor
				AluResult <= op1 xnor op2;
			when others => 
				AluResult <= (others=>'0');
		end case;
	end process;

end Behavioral;