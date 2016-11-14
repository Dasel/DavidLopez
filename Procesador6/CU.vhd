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
    Port ( op : in  STD_LOGIC_VECTOR (1 downto 0);
           op2 : in  STD_LOGIC_VECTOR (2 downto 0);
			  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
			  enableMem : out STD_LOGIC;
           rfDest : out  STD_LOGIC;
           rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0);
           wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC;	
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0));
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

process(op, op2, op3, cond, icc)
	begin
			if(op = "01")then --CALL
				pcSource <= "01"; 
				wrEnRF <= '1'; 
				rfSource <= "10"; 
				enableMem <= '1';
				rfDest <= '1'; 
				wrEnMem <= '0'; 
				ALUOP <= "111111"; 
			else
				if(op = "00")then
					if(op2 = "010")then -- Branch on Integer Condition Codes Instructions
						case cond is
							when "1000" => -- Branch Always
								pcSource <= "10"; 
								wrEnRF <= '0';
								enableMem <= '1';
								rfSource <= "00"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "111111";
							when "1001" => -- Branch on Not Equal
								if(not(icc(2)) = '1') then 
									pcSource <= "10"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								end if;
							when "0001" => -- Branch on Equal
								if(icc(2) = '1') then
									pcSource <= "10";
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0';
									ALUOP <= "111111";
								end if;
							when "1010" => -- Branch on Greater
								if((not(icc(2) or (icc(3) xor icc(1)))) = '1') then 
									pcSource <= "10"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								end if;
							
							when "0010" => -- Branch on Less or Equal
								if((icc(2) or (icc(3) xor icc(1))) = '1') then 
									pcSource <= "10"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0';
									wrEnMem <= '0';
									ALUOP <= "111111";
								end if;
							when "1011" => -- Branch on Greater or Equal
								if((not(icc(3) xor icc(1))) = '1') then 
									pcSource <= "10"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								end if;
							when "0011" => -- Branch on Less
								if((icc(3) xor icc(1)) = '1') then 
									pcSource <= "10"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								else
									pcSource <= "11"; 
									wrEnRF <= '0';
									enableMem <= '1';
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "111111";
								end if;
							when others => -- Not Implemented
								pcSource <= "00";
								wrEnRF <= '0';
								enableMem <= '1';
								rfSource <= "00";
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "111111"; 
						end case;
					else
						if(op2 = "100")then -- NOP
							pcSource <= "11"; 
							wrEnRF <= '0';  
							rfSource <= "01"; 
							rfDest <= '0'; 
							wrEnMem <= '0'; 
							ALUOP <= "111111";
							enableMem <= '1';
						end if;
					end if;
				else
					if(op = "10")then				
						case op3 is
							when "000000" => -- ADD
								pcSource <= "11"; 
								wrEnRF <= '1'; 
								rfSource <= "01"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "000000";
								enableMem <= '1';
								
							when "010000" => -- ADDCC
								pcSource <= "11"; 
								wrEnRF <= '1'; 
								rfSource <= "01"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "000001";
								enableMem <= '1';
								
							when "000010" => -- OR
								pcSource <= "11"; 
								wrEnRF <= '1';
								rfSource <= "01"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "001000";
								enableMem <= '1';

							when "000100" => -- SUB
								pcSource <= "11"; 
								wrEnRF <= '1'; 
								rfSource <= "01"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "010000";
								enableMem <= '1';
							
							when "010100" => -- SUBCC
								pcSource <= "11"; 
								wrEnRF <= '1'; 
								rfSource <= "01"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "000101";
								enableMem <= '1';
							
							when "111100" => -- SAVE
								pcSource <= "11"; 
								wrEnRF <= '1'; 
								rfSource <= "01"; 
								rfDest <= '0';
								wrEnMem <= '0';
								ALUOP <= "000000"; 
								enableMem <= '1';
								
							when "111101" => -- RESTORE
								pcSource <= "11"; 
								wrEnRF <= '1'; 
								rfSource <= "01"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "000000"; 
								enableMem <= '1';
							
							when "111000" => -- JMPL
								pcSource <= "00"; 
								wrEnRF <= '1'; 
								rfSource <= "10"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "000000"; 
								enableMem <= '1';
							
							when others => 
								pcSource <= "11"; 
								wrEnRF <= '0'; 
								rfSource <= "01"; 
								rfDest <= '0'; 
								wrEnMem <= '0'; 
								ALUOP <= "000000";
								enableMem <= '1';
						end case;
						
					else
						if(op = "11")then -- SW
							case op3 is
								when "000100" => 
									pcSource <= "11"; 
									wrEnRF <= '0'; 
									rfSource <= "01"; 
									rfDest <= '0'; 
									wrEnMem <= '1';
									ALUOP <= "000000";
									enableMem <= '1';
								
								when "000000" => -- LW
									pcSource <= "11"; 
									wrEnRF <= '1'; 
									rfSource <= "00"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "000000";
									enableMem <= '1';
								
								when others => 
									pcSource <= "11"; 
									wrEnRF <= '0'; 
									rfSource <= "01"; 
									rfDest <= '0'; 
									wrEnMem <= '0'; 
									ALUOP <= "000000";
									enableMem <= '1';
							end case;
						end if;
					
					end if;
				end if;
			end if;
	end process;


end Behavioral;