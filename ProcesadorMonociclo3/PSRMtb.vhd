--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:53:08 10/12/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/GITHUB/PSRM/PSRMtb.vhd
-- Project Name:  PSRM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSRM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY PSRMtb IS
END PSRMtb;
 
ARCHITECTURE behavior OF PSRMtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSRM
    PORT(
         Op1 : IN  std_logic;
         Op2 : IN  std_logic;
         Aluresult : IN  std_logic_vector(31 downto 0);
         Aluop : IN  std_logic_vector(5 downto 0);
         reset : IN  std_logic;
         nzvc : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op1 : std_logic := '0';
   signal Op2 : std_logic := '0';
   signal Aluresult : std_logic_vector(31 downto 0) := (others => '0');
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal nzvc : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSRM PORT MAP (
          Op1 => Op1,
          Op2 => Op2,
          Aluresult => Aluresult,
          Aluop => Aluop,
          reset => reset,
          nzvc => nzvc
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
	
		reset<= '1';      
		wait for 50 ns;
		reset<= '0';
		wait for 50 ns;
	
		Aluresult <= x"00000000";
		Op1 <= '1';
 		Op2 <= '1';
		Aluop <= "001001";
      wait for 30 ns;	
		Aluresult <= x"0000001F";
		Op1 <= '1';
 		Op2 <= '0';
		Aluop <= "001100";
		wait for 30 ns;
		Aluresult <= x"F0000100";
		Op1 <= '0';
 		Op2 <= '1';
		Aluop <= "001011";
		wait for 30 ns;
		Aluresult <= x"F00000F0";
		Op1 <= '0';
 		Op2 <= '0';
		Aluop <= "010001";

      wait;
   end process;

END;
