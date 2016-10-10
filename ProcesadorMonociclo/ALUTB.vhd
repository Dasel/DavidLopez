--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   19:31:41 10/09/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/GITHUB/TallerProcesador1/ALUTB.vhd
-- Project Name:  procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY ALUTB IS
END ALUTB;
 
ARCHITECTURE behavior OF ALUTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         aluOP : IN  std_logic_vector(5 downto 0);
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         carry : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal aluOP : std_logic_vector(5 downto 0) := (others => '0');
   signal op1 : std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal carry : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          aluOP => aluOP,
          op1 => op1,
          op2 => op2,
          carry => carry,
          AluResult => AluResult
        );

   -- Clock process definitions
  -- <clock>_process :process

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		op1<= "00000000000000000000000000010011"; --19
      op2<= "00000000000000000000000000001100"; --12
		
		aluOP <= "000001";  wait for 10 ns;-- Add
		aluOP <= "000010";  wait for 10 ns;-- Sub
		aluOP <= "000011";  wait for 10 ns;-- And
		aluOP <= "000100";  wait for 10 ns;-- Nand				
		aluOP <= "000101";  wait for 10 ns;-- Or		
		aluOP <= "000110";  wait for 10 ns;-- Nor
		aluOP <= "000111";  wait for 10 ns;-- Xor
		aluOP <= "001000";  wait for 10 ns;-- Xnor
		aluOP <= "100000";  wait for 10 ns;-- otros

      wait;
   end process;

END;
