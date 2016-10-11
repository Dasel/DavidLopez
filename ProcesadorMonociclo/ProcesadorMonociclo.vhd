
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
		  Port (  dataIn : in  STD_LOGIC_VECTOR (31 downto 0);--PC
					  clk : in  STD_LOGIC;
					  reset : in  STD_LOGIC;
					  dataOut : out  STD_LOGIC_VECTOR (31 downto 0));			  
		end component;
		
		component	nPC
			 Port ( clk : in  STD_LOGIC;
					  reset : in STD_LOGIC;
					  dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
					  dataOut : out  STD_LOGIC_VECTOR (31 downto 0));	  
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
			--  carry : in STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;

		component add
		Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           resultado : out  STD_LOGIC_VECTOR (31 downto 0));
		end component;
	

	
	signal auxPC : std_logic_vector(31 downto 0);
	signal addToPC :std_logic_vector(31 downto 0);
	signal PCtoIM : std_logic_vector(31 downto 0);	
	signal auxRF: std_logic_vector(31 downto 0);
	signal auxAlu : std_logic_vector(5 downto 0);
	signal auxCRs1 : std_logic_vector(31 downto 0);
	signal auxCRs2 : std_logic_vector(31 downto 0);
	signal salida : std_logic_vector(31 downto 0);
	signal carryAlu : std_logic;
	
	
begin

	aux_add: add PORT MAP(
		op1 =>auxPc,
		op2 => "00000000000000000000000000000001",
		resultado => addToPC
	);
	
	aux_nPC: nPC PORT MAP(
		dataIn => addToPC,
		clk => clk,
		reset => rst,
		dataOut => auxPC 
	);

	aux_PC: PC PORT MAP(
		dataIn => auxPC,
		reset => rst,
		clk => clk,
		dataOut => PCtoIM
	);
	
	aux_InstructionMem: InstructionMem PORT MAP(
		dataIn => PCtoIM,
		reset => rst,
		dataOut =>auxRF 
	);
	
	aux_RF: RF PORT MAP(	
		rs1 => auxRF(18 downto 14),
		rs2 => auxRF(4 downto 0),
		rd => auxRF(29 downto 25),
		reset => rst,
		datawrite => salida,
		CRs1  => auxCRs1,
		CRs2 => auxCRs2
		);

	aux_CU: CU PORT MAP(
		op => auxRF(31 downto 30),
		op3 => auxRF(24 downto 19),
		CUout => auxAlu
	);	
	
	aux_ALU: ALU PORT MAP(
		op1 => auxCRs1,
		op2 => auxCRs2,
		aluOP => auxAlu,
	--	carry => carryAlu,
		AluResult => salida	
		);
	
	ProcesadorResult <= salida;

end Behavioral;

