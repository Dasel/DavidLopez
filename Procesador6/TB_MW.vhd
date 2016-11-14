-- TestBench Template 

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY WM_TB IS
END WM_TB;
 
ARCHITECTURE behavior OF WM_TB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT WM
    PORT(
         OP : IN  std_logic_vector(1 downto 0);
         OP3 : IN  std_logic_vector(5 downto 0);
         RS1 : IN  std_logic_vector(4 downto 0);
         RS2 : IN  std_logic_vector(4 downto 0);
         RD : IN  std_logic_vector(4 downto 0);
         cwp : IN  std_logic;
         nRS1 : OUT  std_logic_vector(5 downto 0);
         nRS2 : OUT  std_logic_vector(5 downto 0);
         nRD : OUT  std_logic_vector(5 downto 0);
         ncwp : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal OP: std_logic_vector(1 downto 0) := (others => '0');
   signal OP3 : std_logic_vector(5 downto 0) := (others => '0');
   signal RS1 : std_logic_vector(4 downto 0) := (others => '0');
   signal RS2 : std_logic_vector(4 downto 0) := (others => '0');
   signal RD : std_logic_vector(4 downto 0) := (others => '0');
   signal cwp : std_logic := '0';

 	--Outputs
   signal nRS1 : std_logic_vector(5 downto 0);
   signal nRS2 : std_logic_vector(5 downto 0);
   signal nRD : std_logic_vector(5 downto 0);
   signal ncwp : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: WM PORT MAP (
          OP => OP,
          OP3 => OP3,
          RS1 => RS1,
          RS2 => RS2,
          RD => RD,
          cwp => cwp,
          nRS1 => nRS1,
          nRS2 => nRS2,
          nRD => nRD,
          ncwp => ncwp
        ); 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		cwp <= '0';
		OP<= "10";
		OP3 <= "111101";
		RS1 <= "00100";
		RS2 <= "01110";
		RD<= "11100";		
      wait for 100 ns;	
		cwp <= '0';
		OP <= "10";
		OP3 <= "111100";
		RS1 <= "00100";
		RS2 <= "01110";
		rd <= "11100";
		wait for 100 ns;	
		cwp <= '1';
		OP <= "10";
		OP3 <= "111101";
		RS1 <= "00100";
		RS2 <= "01110";
		RD <= "11100";
      -- insert stimulus here 

      wait;
   end process;

END;
