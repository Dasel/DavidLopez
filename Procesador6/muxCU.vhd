----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:27:26 11/08/2016 
-- Design Name: 
-- Module Name:    muxCU - Behavioral 
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

entity muxCU is
	Port ( PCDisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCDisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC4 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));

end muxCU;

architecture Behavioral of muxCU is

begin
process(PCDisp30,PCDisp22,PC4,aluResult,PCSource)
begin
		case PCSource is
			when "00" =>
				mux_out <= aluResult;
			when "01" =>
				mux_out <= PCDisp30;
			when "10" =>
				mux_out <= PCDisp22;
			when "11" =>
				mux_out <= PC4;
			when others =>
				mux_out <= PC4;
		end case;
end process;


end Behavioral;

