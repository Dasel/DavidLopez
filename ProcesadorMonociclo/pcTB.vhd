--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:56:33 10/04/2016
-- Design Name:   
-- Module Name:   C:/Users/Usuario/Desktop/usbBackup/PC/pcTB.vhd
-- Project Name:  PC
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 
ENTITY pcTB IS
END pcTB;
 
ARCHITECTURE behavior OF pcTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         dataIn : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         dataOut : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal dataIn : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          dataIn => dataIn,
          clk => clk,
          reset => reset,
          dataOut => dataOut
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
