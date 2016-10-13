--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:27:52 10/12/2016
-- Design Name:   
-- Module Name:   D:/Users/DAVID/Desktop/GITHUB/procesado1/TB_Pr2.vhd
-- Project Name:  procesado1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Procesador2
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
 
ENTITY TB_Pr2 IS
END TB_Pr2;
 
ARCHITECTURE behavior OF TB_Pr2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Procesador2
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         ProcesadorResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal ProcesadorResult : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Procesador2 PORT MAP (
          clk => clk,
          rst => rst,
          ProcesadorResult => ProcesadorResult
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
      rst <= '1';
      wait for 40 ns;	
		rst <= '0';		
      -- insert stimulus here 

      wait;
   end process;

END;
