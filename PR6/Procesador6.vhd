library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Procesador6 is
	Port (  clk_in : in  STD_LOGIC;
           reset_in : in  STD_LOGIC:='0';
          ProcesadorResult: out  STD_LOGIC_VECTOR (31 downto 0));
end Procesador6;

architecture Behavioral of Procesador6 is

COMPONENT nPC
	PORT(
		nPC_in : IN std_logic_vector(31 downto 0);
		clk : IN std_logic;
		reset : IN std_logic;          
		nPC_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT PC
	PORT(
		CLK : IN std_logic;
		CLR : IN std_logic;          
		entrada_pc : IN std_logic_vector(31 downto 0);
		salida_pc : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT sumador_32b
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		SUM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT sumador_disp22
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		SUM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT sumador_disp30
	PORT(
		A : IN std_logic_vector(31 downto 0);
		B : IN std_logic_vector(31 downto 0);          
		SUM : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT Instruction_Memory
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;          
		outInstruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT ucontrol
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op2 : IN std_logic_vector(2 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		icc : IN std_logic_vector(3 downto 0);
		cond : IN std_logic_vector(3 downto 0);          
		ucout : OUT std_logic_vector(5 downto 0);
		rfdest : OUT std_logic;
		wrenmem : OUT std_logic;
		rdenmem : OUT std_logic;
		rfsource : OUT std_logic_vector(1 downto 0);
		we : OUT std_logic;
		pcsource : OUT std_logic_vector(1 downto 0)
		);
	END COMPONENT;
	
COMPONENT registerFile
	PORT(
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		DWR : IN std_logic_vector(31 downto 0);
		we : in std_logic;
		reset : IN std_logic;          
		crs1 : OUT std_logic_vector(31 downto 0);
		crs2 : OUT std_logic_vector(31 downto 0);
		crd : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;

COMPONENT SEU22
	PORT(
		inme22 : IN std_logic_vector(21 downto 0);          
		seu_out : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT seu_32
	PORT(
		inme13 : IN std_logic_vector(12 downto 0);          
		seu_out : OUT std_logic_vector(31 downto 0)
		);
END COMPONENT;

COMPONENT MUX_32
	PORT(
		clk : IN std_logic;
		opcion : IN std_logic_vector(0 downto 0);
		entrada1 : IN std_logic_vector(31 downto 0);
		entrada2 : IN std_logic_vector(31 downto 0);       
		salida : INOUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT alu32
	PORT(
		crs1 : IN std_logic_vector(31 downto 0);
		crs2 : IN std_logic_vector(31 downto 0);
		ucalu : IN std_logic_vector(5 downto 0);          
		alu_result : OUT std_logic_vector(31 downto 0);
		c : in  std_logic);
	END COMPONENT;

COMPONENT MUX32Alu
	PORT(
		clk : IN std_logic;
		opcion : IN std_logic_vector(1 downto 0);
		entrada1 : IN std_logic_vector(31 downto 0);
		entrada2 : IN std_logic_vector(31 downto 0);
		entrada3 : IN std_logic_vector(31 downto 0);       
		salida : INOUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT DM
	PORT(
		reset : IN std_logic;
		WEnable : IN std_logic;
		RDEnable : IN  STD_LOGIC;
		Address : IN std_logic_vector(31 downto 0);
		Data : IN std_logic_vector(31 downto 0);          
		DMout : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

COMPONENT Mux32disp
	PORT(
		clk : IN std_logic;
		opcion : IN std_logic_vector(1 downto 0);
		entrada1 : IN std_logic_vector(31 downto 0);
		entrada2 : IN std_logic_vector(31 downto 0);
		entrada3 : IN std_logic_vector(31 downto 0);
		entrada4 : IN std_logic_vector(31 downto 0);       
		salida : INOUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
COMPONENT WM
	PORT(
		rst : in std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		OP3 : IN std_logic_vector(5 downto 0);
		OP : IN std_logic_vector(1 downto 0);
		cwp : IN std_logic:= '0';          
		ncwp : OUT std_logic;
		nrs1 : OUT std_logic_vector(5 downto 0);
		nrs2 : OUT std_logic_vector(5 downto 0);
		nrd : OUT std_logic_vector(5 downto 0);
		registro07: OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX_RD
	PORT(
		clk : IN std_logic;
		entrada1 : IN std_logic_vector(5 downto 0);
		entrada2 : IN std_logic_vector(5 downto 0);
		RF_DEST : IN std_logic;       
		salida : INOUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSR_Modifier
	PORT(
		rst : in std_logic;
		CRS1 : IN std_logic;
		operando2 : IN std_logic;
		AluResult : IN std_logic_vector(31 downto 0);
		AluOP : IN std_logic_vector(5 downto 0);          
		nzvc : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	
	COMPONENT psr
	PORT(
		Clk : IN std_logic;
		Reset : IN std_logic;
		ncwp : IN std_logic;
		nzvc : IN std_logic_vector(3 downto 0);          
		cwp : OUT std_logic;
		Carry : OUT std_logic
		);
	END COMPONENT;
signal Mux32disp_to_nPC: std_logic_vector(31 downto 0);
signal Sum32b_to_Mux32disp: std_logic_vector(31 downto 0);
signal Sumdisp22_to_Mux32disp: std_logic_vector(31 downto 0);
signal Sumdisp30_to_Mux32disp: std_logic_vector(31 downto 0);
signal SEU22_to_sumdisp22: std_logic_vector(31 downto 0);
signal UC_to_Mux32disp: std_logic_vector(1 downto 0);
signal UC_to_DM_RDEN: std_logic;
signal UC_to_DM_WEN: std_logic;
signal UC_to_MUX32Alu: std_logic_vector(1 downto 0);
signal UC_to_RF_WEN: std_logic;
signal UC_to_RF_DEST: std_logic;
signal MUX32Alu_to_RF: std_logic_vector(31 downto 0);
signal WM_to_MUX_RD: std_logic_vector(5 downto 0);
signal MUX_RD_to_RF: std_logic_vector(5 downto 0);

signal DM_to_MUX32Alu: std_logic_vector(31 downto 0);

signal ADD_to_nPC: std_logic_vector(31 downto 0);

signal nPC_to_PC: std_logic_vector(31 downto 0);
signal PC_to_IM: std_logic_vector(31 downto 0);
signal IM_to_RF: std_logic_vector(31 downto 0);
signal RF_to_ALU: std_logic_vector(31 downto 0);
signal RF_to_MUX: std_logic_vector(31 downto 0);
signal RF_to_DM: std_logic_vector(31 downto 0);
signal SEU_to_MUX: std_logic_vector(31 downto 0);
signal MUX_to_ALU: std_logic_vector(31 downto 0);
signal UC_to_ALU: std_logic_vector(5 downto 0);
signal ALU_to_RF: std_logic_vector(31 downto 0);--Resultado ALU
signal IM_to_WM: std_logic_vector(31 downto 0);
signal WM_to_RF: std_logic_vector(17 downto 0);
signal PSR_MOD_to_PSR: std_logic_vector(3 downto 0);
signal WM_to_PSR: std_logic_vector(0 downto 0):= "0";
signal PSR_to_WM: std_logic_vector(0 downto 0):= "0";
signal PSR_to_ALU: std_logic_vector(0 downto 0):= "0";

begin
ProcesadorResult <= ALU_to_RF;--Resultado ALU

aux_nPC: nPC PORT MAP(
		nPC_in => Mux32disp_to_nPC,
		nPC_out => nPC_to_PC,
		clk => clk_in,
		reset => reset_in
	);

aux_PC: PC PORT MAP(
		CLK => clk_in,
		CLR => reset_in,
		entrada_pc => nPC_to_PC,
		salida_pc => PC_to_IM
	);

aux_sumador_32b: sumador_32b PORT MAP(
		A => "00000000000000000000000000000001",
		B => nPC_to_PC,
		SUM => Sum32b_to_Mux32disp
	);

aux_sumador_disp22: sumador_disp22 PORT MAP(
		A => PC_to_IM,
		B => SEU22_to_sumdisp22,
		SUM => Sumdisp22_to_Mux32disp
	);

aux_sumador_disp30: sumador_disp30 PORT MAP(
		A => IM_to_RF,
		B => PC_to_IM,
		SUM => Sumdisp30_to_Mux32disp
	);
	
aux_Instruction_Memory: Instruction_Memory PORT MAP(
		address => PC_to_IM,
		reset => reset_in,
		outInstruction => IM_to_RF 
	);

aux_ucontrol: ucontrol PORT MAP(
		op => IM_to_RF(31 downto 30),
		op2 => IM_to_RF(24 downto 22),
		op3 => IM_to_RF(24 downto 19),
		icc => PSR_MOD_to_PSR,--NZVC
		cond => IM_to_RF(28 downto 25),
		ucout => UC_to_ALU,
		rfdest => UC_to_RF_DEST,
		wrenmem => UC_to_DM_WEN,
		rdenmem => UC_to_DM_RDEN,
		rfsource => UC_to_MUX32Alu,
		we => UC_to_RF_WEN,
		pcsource => UC_to_Mux32disp
	);
	
IM_to_WM(31 downto 30) <= IM_to_RF(31 downto 30);
IM_to_WM(24 downto 19) <= IM_to_RF(24 downto 19);

aux_registerFile: registerFile PORT MAP(
		rs1 => WM_to_RF(5 downto 0),
		rs2 => WM_to_RF(11 downto 6),
		rd => MUX_RD_to_RF,
		we => UC_to_RF_WEN,
		DWR => MUX32Alu_to_RF,
		reset => reset_in,
		crs1 => RF_to_ALU,
		crs2 => RF_to_MUX,
		crd => RF_to_DM
	);
	
aux_SEU22: SEU22 PORT MAP(
		inme22 => IM_to_RF(21 downto 0),
		seu_out => SEU22_to_sumdisp22
	);
	
aux_seu_32: seu_32 PORT MAP(
		inme13 => IM_to_RF(12 downto 0),
		seu_out => SEU_to_MUX
	);

aux_MUX_32: MUX_32 PORT MAP(
		clk => clk_in,
		opcion => IM_to_RF(13 downto 13),
		entrada1 => RF_to_MUX,
		entrada2 => SEU_to_MUX,
		salida => MUX_to_ALU
	);

aux_alu32: alu32 PORT MAP(
		crs1 => RF_to_ALU,
		crs2 => MUX_to_ALU,
		ucalu => UC_to_ALU,
		alu_result => ALU_to_RF,
		c => PSR_to_ALU(0)
	);

aux_MUX32Alu: MUX32Alu PORT MAP(
		clk => clk_in,
		opcion => UC_to_MUX32Alu,
		entrada1 => DM_to_MUX32Alu,
		entrada2 => ALU_to_RF,--Resultado ALU
		entrada3 => PC_to_IM,
		salida => MUX32Alu_to_RF
	);
	
aux_DM: DM PORT MAP(
		reset => reset_in,
		WEnable => UC_to_DM_WEN,
		RDEnable => UC_to_DM_RDEN,
		Address => RF_to_DM,
		Data => ALU_to_RF,--Resultado ALU
		DMout => DM_to_MUX32Alu
	);

aux_Mux32disp: Mux32disp PORT MAP(
		clk => clk_in,
		opcion => UC_to_Mux32disp,
		entrada1 => Sumdisp30_to_Mux32disp,
		entrada2 => Sumdisp22_to_Mux32disp,
		entrada3 => Sum32b_to_Mux32disp,
		entrada4 => ALU_to_RF,--Resultado ALU
		salida => Mux32disp_to_nPC
	);
	
aux_WM: WM PORT MAP(
		rst => reset_in,
		rs1 => IM_to_RF(18 downto 14),
		rs2 => IM_to_RF(4 downto 0),
		rd => IM_to_RF(29 downto 25),
		OP3 => IM_to_WM(24 downto 19),
		OP => IM_to_WM(31 downto 30),
		cwp => PSR_to_WM(0),
		ncwp => WM_to_PSR(0),
		nrs1 => WM_to_RF(5 downto 0),
		nrs2 => WM_to_RF(11 downto 6),
		nrd => WM_to_RF(17 downto 12),
		registro07 => WM_to_MUX_RD
	);

aux_MUX_RD: MUX_RD PORT MAP(
		clk => clk_in,
		entrada1 => WM_to_RF(17 downto 12),
		entrada2 => WM_to_MUX_RD,
		RF_DEST => UC_to_RF_DEST,
		salida => MUX_RD_to_RF
	);
	
aux_PSR_Modifier: PSR_Modifier PORT MAP(
		rst => reset_in,
		CRS1 => RF_to_ALU(31),
		operando2 => MUX_to_ALU(31),
		AluResult => ALU_to_RF,--Resultado ALU
		AluOP => IM_to_WM(24 downto 19),
		nzvc => PSR_MOD_to_PSR
	);

aux_psr: psr PORT MAP(
		Clk => clk_in,
		Reset => reset_in,
		ncwp => WM_to_PSR(0),
		nzvc => PSR_MOD_to_PSR,
		cwp => PSR_to_WM(0),
		Carry => PSR_to_ALU(0)
	);
	
end Behavioral;

