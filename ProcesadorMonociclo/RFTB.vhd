--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:13:51 10/09/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/GITHUB/TallerProcesador1/RFTB.vhd
-- Project Name:  procesador
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF
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
 
ENTITY RFTB IS
END RFTB;
 
ARCHITECTURE behavior OF RFTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         reset : IN  std_logic;
         datawrite : IN  std_logic_vector(31 downto 0);
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal reset : std_logic := '0';
   signal datawrite : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          reset => reset,
          datawrite => datawrite,
          CRs1 => CRs1,
          CRs2 => CRs2
        );

   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';
		rs1 <= "10000";
		rs2 <= "10001";
		rd <= "00001";
		datawrite <= x"00001000";

      wait;
   end process;

END;
