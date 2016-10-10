----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:00 10/09/2016 
-- Design Name: 
-- Module Name:     nPC - Behavioral 
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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity nPC is
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture Behavioral of nPC is

begin

	process (clk, reset, dataIn)
	begin
		if (reset = '1') then
			dataOut <= (others => '0');
		else
			if(rising_edge(clk)) then
				dataOut <= dataIn;
			end if;
		end if;
end process;

end Behavioral;