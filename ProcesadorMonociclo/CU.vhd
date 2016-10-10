--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CU is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CUout : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

begin

	process (Op, Op3)	
	begin
	
		if(Op = "10") then
			case (Op3) is
				when("000000") =>
					CUout <= "000001"; -- Add
				when("000100") =>
					CUout <= "000010"; -- Sub
				when("000001") =>
					CUout <= "000011"; -- And
				when("000101") =>
					CUout <= "000100"; -- Nand
				when("000010") =>
					CUout <= "000101"; -- Or	
				when("000110") =>
					CUout <= "000110"; -- Nor
				when("000011") =>
					CUout <= "000111"; -- Xor
				when("000111") =>
					CUout <= "001000"; -- Xnor				
				when others =>
					CUout <= "000000";
			end case;
		end if;
	end process;

end Behavioral;