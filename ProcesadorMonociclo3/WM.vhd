----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:46:32 10/22/2016 
-- Design Name: 
-- Module Name:    WM - Behavioral 
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

entity WM is
    Port ( RS1 : in  STD_LOGIC (4 downto 0);
           RS2 : in  STD_LOGIC (4 downto 0);
           RD : in  STD_LOGIC (4 downto 0);
           OP : in  STD_LOGIC (1 downto 0);
           OP3 : in  STD_LOGIC (5 downto 0);
           nRS1 : out  STD_LOGIC (5 downto 0);
           nRS2 : out  STD_LOGIC (5 downto 0);
           nRD : in  STD_LOGIC (5 downto 0);
           cwp : in  STD_LOGIC;
           ncwp : out  STD_LOGIC;
			  rg : in  STD_LOGIC (5 downto 0));
end WM;

architecture Behavioral of WM is

begin


	process(RS1,RS2,RD,cwp,OP,OP3)
	begin
		
		if cwp = '1' then
			rg <= "011111";
		else
			rg <= "001111";
		end if;
		
		if(OP = "10" and OP3 = "111100")then 
			ncwp <= '0';
		elsif(OP = "10" and OP3 = "111101")then 
			ncwp <= '1';
		end if;
		
		
		if(RS1>="11000" and RS1<="11111") then 
			if cwp = '1' then
				nRS1 <= '0'&RS1 - "010000";
			else
				nRS1 <= '0'&RS1;
			end if;
		else
			if(RS1>="10000" and RS1<="10111") then
				if cwp = '1' then
					nRS1 <= '0'&RS1 + "010000";
				else
					nRS1 <= '0'&RS1;
				end if;
			else		
				if(RS1>="11100" and RS1<="01111") then
					if cwp = '1' then
						nRS1 <= '0'&RS1 + "010000";
					else
						nRS1 <= '0'&RS1;
					end if;
				else
					if(RS1>="00000" and RS1<="00111") then
						nRS1 <= '0'&RS1;
					end if;
				end if;
			end if;
		 end if;


		if(RS2>="11000" and RS2<="11111") then 
			if cwp = '1' then
				nRS2 <= '0'&RS2 - "010000";
			else
				nRS2 <= '0'&RS2;
			end if;
		else
			if(RS2>="10000" and RS2<="10111") then
				if cwp = '1' then
					nRS2 <= '0'&RS2 + "010000";
				else
					nRS2 <= '0'&RS2;
				end if;
			else		
				if(RS2>="11100" and RS2<="01111") then
					if cwp = '1' then
						nRS2 <= '0'&RS2 + "010000";
					else
						nRS2 <= '0'&RS2;
					end if;
				else
					if(RS2>="00000" and RS2<="00111") then
						nRS2 <= '0'&RS2;
					end if;
				end if;
			end if;
		 end if;
		 
		 
		 
	 if(RD>="11000" and RD<="11111") then 
			if cwp = '1' then
				nRD <= '0'&RD - "010000";
			else
				nRD <= '0'&RD;
			end if;
		else
			if(RD>="10000" and RD<="10111") then
				if cwp = '1' then
					nRD <= '0'&RD + "010000";
				else
					nRD <= '0'&RD;
				end if;
			else		
				if(RD>="11100" and RD<="01111") then
					if cwp = '1' then
						nRD <= '0'&RD+ "010000";
					else
						nRD <= '0'&RD;
					end if;
				else
					if(RD>="00000" and RD<="00111") then
						nRD <= '0'&RD;
					end if;
				end if;
			end if;
		 end if;
		 
	end process;
end Behavioral;

