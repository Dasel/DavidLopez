
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Procesador4 is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           ProcesadorResult : out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador4;

architecture Behavioral of Procesador4 is

	component nPC
	Port(
		nPC_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		nPC_out : OUT std_logic_vector(31 downto 0)
		);
	end component;

	component PC
	Port(
		PC_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		PC_out : OUT std_logic_vector(31 downto 0)
		);
	end component;

	component add
	Port(
		op1 : IN std_logic_vector(31 downto 0);
		op2 : IN std_logic_vector(31 downto 0);          
		resultado : OUT std_logic_vector(31 downto 0)
		);
	end component;

	component IM
	Port(
		IM_in : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;        
		IM_out : OUT std_logic_vector(31 downto 0)
		);
	end component;
	
	component CU
	Port(
		Op : IN std_logic_vector(1 downto 0);
		Op3 : IN std_logic_vector(5 downto 0);
		CU_out : OUT std_logic_vector(5 downto 0)
		);
	end component;
	
	component RF
	Port(
		reset : IN std_logic;
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		datawrite : IN std_logic_vector(31 downto 0);          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0)
		);
	end component;

	component ALU
	Port(
		c : in  STD_LOGIC;
		CRs1 : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);
		aluOP : IN std_logic_vector(5 downto 0);
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	end component;
	
	component MUX
	    Port ( op1 : in  STD_LOGIC_VECTOR (31 downto 0);
           op2 : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0);
			  i : in  STD_LOGIC
           );
	end component;
	
	component PSRM
		Port ( 
			  Op1 : in  STD_LOGIC;
           Op2 : in  STD_LOGIC;
			  Aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  reset : in STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
	end component;
	
	component PSR
		Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
           psr_out : out  STD_LOGIC;
			  cwp : out  STD_LOGIC;
			  ncwp  : in  STD_LOGIC);
	end component;
	
	component SEU
		 Port ( imm : in  STD_LOGIC_VECTOR (12 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component WM
		Port ( RS1 : in  STD_LOGIC_VECTOR (4 downto 0);
           RS2 : in  STD_LOGIC_VECTOR (4 downto 0);
           RD : in  STD_LOGIC_VECTOR (4 downto 0);
           OP : in  STD_LOGIC_VECTOR (1 downto 0);
           OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
           nRS1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRS2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRD : out  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC;
           ncwp : out  STD_LOGIC
			  );
	end component;
	
	signal resultado, auxPC, PC_out, auxRF, auxCRs1, auxCRs2,AluResult : std_logic_vector(31 downto 0);
	signal CU_out ,auxnRS1,auxnRS2,auxnRD: std_logic_vector(5 downto 0);
	signal aux_c,aux_ncwp, aux_cwp:   STD_LOGIC;
	signal SEUout,MUXout : std_logic_vector(31 downto 0);
	signal icc : std_logic_vector(3 downto 0);
	begin

	aux_nPC: nPC PORT MAP(
		nPC_in => resultado,
		reset => rst,
		clk => clk,
		nPC_out => auxPC
	);
	
	aux_PC: PC PORT MAP(
		PC_in => auxPC,
		reset => rst,
		clk => clk,
		PC_out => PC_out 
	);
	
	aux_add: add PORT MAP(
		op1 => "00000000000000000000000000000001",
		op2 => auxPC,
		resultado => resultado
	);
	
	aux_IM: IM PORT MAP(
		IM_in => PC_out,
		reset => rst,
		IM_out => auxRF
	);
	
	aux_CU: CU PORT MAP(
		Op => auxRF(31 downto 30),
		Op3 => auxRF(24 downto 19),
		CU_out => CU_out
	);
	
	
	
	aux_SEU: SEU PORT MAP(
		imm =>auxRF(12 downto 0),
      dataOut =>SEUout
	);
	
	aux_WM: WM PORT MAP(
			  RS1 =>auxRF(18 downto 14),
           RS2 =>auxRF(4 downto 0),
           RD =>auxRF(29 downto 25),
           OP =>auxRF(31 downto 30),
           OP3 =>auxRF(24 downto 19),
           nRS1 =>auxnRS1,
           nRS2 =>auxnRS2,
           nRD =>auxnRD,
           cwp =>aux_cwp,
           ncwp =>aux_ncwp			  
	);
	
	aux_RF: RF PORT MAP(
		reset => rst,
		rs1 => auxnRS1,
		rs2 => auxnRS2,
		rd => auxnRD,
		datawrite => AluResult,
		CRs1 => auxCRs1,
		CRs2 => auxCRs2
	);
		
	aux_PSR: PSR PORT MAP(
		reset => rst,
		clk => clk,
      nzvc => icc,
      psr_out => aux_c,
		cwp =>aux_cwp,
		ncwp => aux_ncwp
	);
		
	aux_MUX: MUX PORT MAP(
		op1 =>auxCRs2,
      op2 =>SEUout,
      dataOut =>MUXout,
		i =>auxRF(13)
	);
	
	aux_PSRM: PSRM PORT MAP(
		Op1 => auxCRs1(31),
      Op2 => MUXout(31),
		Aluresult => AluResult,
      Aluop => CU_out,
		reset => rst,
      nzvc => icc 
	);
	
	aux_ALU: ALU PORT MAP(
		c => aux_c,
		CRs1 => auxCRs1,
		CRs2 => MUXout,
		aluOP => CU_out,
		AluResult => AluResult
	);
	
	ProcesadorResult <= AluResult;

end Behavioral;