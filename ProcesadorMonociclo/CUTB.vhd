--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:38:30 10/09/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/GITHUB/TallerProcesador1/CUTB.vhd
-- Project Name:  procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: CU
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
 
ENTITY CUTB IS
END CUTB;
 
ARCHITECTURE behavior OF CUTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT CU
    PORT(
         Op : IN  std_logic_vector(1 downto 0);
         Op3 : IN  std_logic_vector(5 downto 0);
         CUout : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Op : std_logic_vector(1 downto 0) := (others => '0');
   signal Op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal CUout : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
--   constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CU PORT MAP (
          Op => Op,
          Op3 => Op3,
          CUout => CUout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      Op <= "10";
		Op3 <= "000000" ;wait for 10 ns;
		Op3 <= "000100" ;wait for 10 ns; 
		Op3 <= "000001" ;wait for 10 ns;
		Op3 <= "000101" ;wait for 10 ns;
		Op3 <= "000010" ;wait for 10 ns;
		Op3 <= "000110" ;wait for 10 ns;
		Op3 <= "000011" ;wait for 10 ns;
		Op3 <= "000111" ;wait for 10 ns;

      wait;
   end process;

END;
