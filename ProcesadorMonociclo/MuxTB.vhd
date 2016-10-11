-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY MuxTB IS
END MuxTB;
 
ARCHITECTURE behavior OF MuxTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         op1 : IN  std_logic_vector(31 downto 0);
         op2 : IN  std_logic_vector(31 downto 0);
         dataOut : OUT  std_logic_vector(31 downto 0);
         i : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal op1: std_logic_vector(31 downto 0) := (others => '0');
   signal op2 : std_logic_vector(31 downto 0) := (others => '0');
   signal i : std_logic := '0';

 	--Outputs
   signal dataOut : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          op1 => op1,
          op2 => op2,
          dataOut => dataOut,
          i => i
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op1 <= x"00001301";
		op2 <= x"00120A04";
		i <= '0';
      wait for 100 ns;	
		i <= '1';

      wait;
   end process;

END;
