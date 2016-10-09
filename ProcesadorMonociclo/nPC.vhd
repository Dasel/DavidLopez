--------------------------------------------------------------------------------
--                       Maria Alejandra Gomez Montoya                        --
--                       Juan Sebastian Herrera Giraldo                       --
--                       Cristhian Andrés Rivera Osorio                       --
--------------------------------------------------------------------------------
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