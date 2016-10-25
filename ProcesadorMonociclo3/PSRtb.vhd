--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   07:10:37 10/12/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/GITHUB/PSRM/PSRtb.vhd
-- Project Name:  PSRM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PSR
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
 
ENTITY PSRtb IS
END PSRtb;
 
ARCHITECTURE behavior OF PSRtb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PSR
    PORT(
         reset : IN  std_logic;
         clk : IN  std_logic;
         nzvc : IN  std_logic_vector(3 downto 0);
         psr_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal clk : std_logic := '0';
   signal nzvc : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal psr_out : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PSR PORT MAP (
          reset => reset,
          clk => clk,
          nzvc => nzvc,
          psr_out => psr_out
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
      reset <= '1';
      wait for 40 ns;	
		reset <= '0'; 
		nzvc <= X"1";       
		wait for 40 ns;
		nzvc <= x"0"; 


      wait;
   end process;

END;
