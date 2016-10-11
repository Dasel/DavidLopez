--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY SEUTB IS
END SEUTB;
 
ARCHITECTURE behavior OF SEUTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SEU
    PORT(
         imm : IN  std_logic_vector(12 downto 0);
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;    

   --Inputs
   signal imm : std_logic_vector(12 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SEU PORT MAP (
          imm => imm,
          dataOut => dataOut
        );

   -- Stimulus process
	stim_proc: process
   begin		
	
      imm <= "0000000000010";
      wait for 100 ns;	
		imm <= "1111111111101";
      wait;
		
   end process;

END;
