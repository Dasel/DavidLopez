--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
	   case (ALUOp) is 
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