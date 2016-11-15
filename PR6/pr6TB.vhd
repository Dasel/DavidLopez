--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   06:35:34 11/15/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/process/procesador6-master/pr6/pr6TB.vhd
-- Project Name:  pr6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Procesador6
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
 
ENTITY pr6TB IS
END pr6TB;
 
ARCHITECTURE behavior OF pr6TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador6
    PORT(
         clk_in : IN  std_logic;
         reset_in : IN  std_logic;
         ProcesadorResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk_in : std_logic := '0';
   signal reset_in : std_logic := '0';

 	--Outputs
   signal ProcesadorResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_in_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador6 PORT MAP (
          clk_in => clk_in,
          reset_in => reset_in,
          ProcesadorResult => ProcesadorResult
        );

   -- Clock process definitions
   clk_in_process :process
   begin
		clk_in <= '0';
		wait for clk_in_period/2;
		clk_in <= '1';
		wait for clk_in_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
     reset_in <= '1';
      wait for 250 ns;
		reset_in <= '0';
		wait for 500 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
