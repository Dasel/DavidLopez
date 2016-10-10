--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:54:00 10/09/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/GITHUB/TallerProcesador1/pcTB.vhd
-- Project Name:  procesador
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

			reset <= '1';
			wait for 20 ns;	
			reset <= '0'; 
			dataIn <= x"00000011";       
			wait for 20 ns;
			dataIn <= x"00000100";
			wait for 20 ns;
			dataIn <= x"00000111";
			wait for 20 ns;
			reset <= '0'; 
      wait;
   end process;

END;
