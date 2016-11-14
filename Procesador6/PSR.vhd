----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:29:23 10/11/2016 
-- Design Name: 
-- Module Name:    PSR - Behavioral 
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

entity PSR is
    Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  icc: out STD_LOGIC_VECTOR (3 downto 0);
           psr_out : out  STD_LOGIC;
			  cwp : out  STD_LOGIC;
			  ncwp : in  STD_LOGIC
			  );
end PSR;

architecture Behavioral of PSR is

signal PSRegister: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others=>'0');

begin

	process(clk,reset)
		begin
			if(reset = '1') then
				cwp <= '0';
				psr_out <= '0';
				icc <= "0000";
			else
				if(rising_edge(clk))then
					PSRegister(0) <= ncwp;
					psr_out <= PSRegister(20);
					cwp <= ncwp;
				end if;
				PSRegister(23 downto 20) <= nzvc;
				icc <= PSRegister(23 downto 20);
			end if;
		end process;

end Behavioral;

