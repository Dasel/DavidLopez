----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:23:46 11/08/2016 
-- Design Name: 
-- Module Name:    muxDM - Behavioral 
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

entity muxDM is
	Port ( DatoFromMem : in  STD_LOGIC_VECTOR (31 downto 0);
				  AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
				  PC : in  STD_LOGIC_VECTOR (31 downto 0);
				  RFSource : in  STD_LOGIC_VECTOR (1 downto 0);
				  RFData : out  STD_LOGIC_VECTOR (31 downto 0));
end muxDM;

architecture Behavioral of muxDM is

begin

process(DatoFromMem,AluResult,PC,RFSource)
	begin
		case RFSource is
			when "00" =>
				RFData <= DatoFromMem;
			when "01" =>
				RFData <= AluResult;
			when "10" =>
				RFData <= PC;
			when others =>
				RFData <= (others =>'0');
		end case;
	end process;

end Behavioral;

