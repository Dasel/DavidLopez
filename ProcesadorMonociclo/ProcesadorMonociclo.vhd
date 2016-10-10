
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ProcesadorMonociclo is
		Port ( 
				clk : in  STD_LOGIC;
				rst : in  STD_LOGIC;
				ProcesadorResult : inout  STD_LOGIC_VECTOR (31 downto 0));
				
end ProcesadorMonociclo;

architecture Behavioral of ProcesadorMonociclo is
		
		component CU	  
			Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0); --CU
					  Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
					  CUout : out  STD_LOGIC_VECTOR (5 downto 0));
	   end component;

		component RF			  
			Port ( rs1 : in  STD_LOGIC_VECTOR (4 downto 0);--RF
					  rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
					  rd : in  STD_LOGIC_VECTOR (4 downto 0);
					  reset : in  STD_LOGIC;
					  datawrite : in  STD_LOGIC_VECTOR (31 downto 0);
					  CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
					  CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));		  
		end component;
		
		component  PC
		  Port ( dataIn : in  STD_LOGIC_VECTOR (31 downto 0);--PC
					  clk : in  STD_LOGIC;
					  reset : in  STD_LOGIC;
					  dataOut : out  STD_LOGIC_VECTOR (31 downto 0));			  
		end component;
		
		component	nPC
			Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0); --nPC
					  op2 : in  STD_LOGIC_VECTOR (31 downto 0);
					  resultado : out  STD_LOGIC_VECTOR (31 downto 0));		  
		end component;
		
		component	InstructionMem
			Port ( reset : in  STD_LOGIC; --IM
					  dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
					  dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;  
		
		component ALU
		Port ( aluOP : in  STD_LOGIC_VECTOR (5 downto 0);
			  op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			  carry : in STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;

		component add
		Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
	


	
	
begin

	
end Behavioral;

