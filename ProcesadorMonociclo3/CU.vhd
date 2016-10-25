----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:10 10/09/2016 
-- Design Name: 
-- Module Name:	CU - Behavioral 
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

entity CU is
    Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
           CU_out : out  STD_LOGIC_VECTOR (5 downto 0));
end CU;

architecture Behavioral of CU is

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

begin

	process (Op, Op3)	
	begin
	
		if(op = "10") then
			case (Op3) is
				when("000000") =>
					CU_out <= "000001"; -- Add
				when("000100") =>
					CU_out <= "000010"; -- Sub
				when("000001") =>
					CU_out <= "000011"; -- And
				when("000101") =>
					CU_out <= "000100"; -- Nand
				when("000010") =>
					CU_out <= "000101"; -- Or	
				when("000110") =>
					CU_out <= "000110"; -- Nor
				when("000011") =>
					CU_out <= "000111"; -- Xor
				when("000111") =>
					CU_out <= "001000"; -- Xnor				
				when others =>
					CU_out <= "000000";
			end case;
		end if;
	end process;

end Behavioral;