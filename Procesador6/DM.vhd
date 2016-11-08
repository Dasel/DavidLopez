----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:13:11 11/08/2016 
-- Design Name: 
-- Module Name:    DM - Behavioral 
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

entity DM is
    Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
			  cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           aluIn : in STD_LOGIC_VECTOR (31 downto 0);	
			  rdenmem  : in  STD_LOGIC;			  
           wrenmem : in  STD_LOGIC;
           datatomem : out  STD_LOGIC_VECTOR (31 downto 0));

end DM;

architecture Behavioral of DM is
	type ram_type is array (0 to 63) of std_logic_vector (31 downto 0);
	signal ramMemory : ram_type:=(others => x"00000000");

begin
	process(clk)
	begin
		if(rising_edge(clk))then
			if(rdenmem = '1') then
				if(rst = '1')then
					datatomem <= (others => '0');
					ramMemory <= (others => x"00000000");
				else
					if(wrenmem = '0')then
						datatomem <= ramMemory(conv_integer(aluIn(5 downto 0)));
					else
						ramMemory(conv_integer(aluIn(5 downto 0))) <= cRD;
					end if;
				end if;
			end if;
		end if;
	end process;
end Behavioral;

