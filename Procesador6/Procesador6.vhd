
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
	Port ( Op : in  STD_LOGIC_VECTOR (1 downto 0);
           Op2 : in  STD_LOGIC_VECTOR (2 downto 0);
			  Op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  cond : in  STD_LOGIC_VECTOR (3 downto 0);
           icc : in  STD_LOGIC_VECTOR (3 downto 0);
			  enableMem : out STD_LOGIC;
           rfDest : out  STD_LOGIC;
           rfSource : out  STD_LOGIC_VECTOR (1 downto 0);
			  pcSource : out STD_LOGIC_VECTOR (1 downto 0);
           wrEnMem : out  STD_LOGIC;
           wrEnRF : out  STD_LOGIC;
           ALUOP : out  STD_LOGIC_VECTOR (5 downto 0)
			  );
	end component;
	
	component RF
	Port ( we : in STD_LOGIC;
			  rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
           rd : in  STD_LOGIC_VECTOR (5 downto 0);
           reset : in  STD_LOGIC;
           datawrite : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0);
			  Crd : out  STD_LOGIC_VECTOR (31 downto 0)		  
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
			  OP: in STD_LOGIC_VECTOR(1 downto 0);
			  Aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop : in  STD_LOGIC_VECTOR (5 downto 0);
			  reset : in STD_LOGIC;
           nzvc : out  STD_LOGIC_VECTOR (3 downto 0));
			  end component;
	
	component PSR
		Port ( reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           nzvc : in  STD_LOGIC_VECTOR (3 downto 0);
			  icc: out STD_LOGIC_VECTOR (3 downto 0);
           psr_out : out  STD_LOGIC;
			  cwp : out  STD_LOGIC;
			  ncwp : in  STD_LOGIC
			  );
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
			  RO7 : out STD_LOGIC_VECTOR (5 downto 0);
           nRS1 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRS2 : out  STD_LOGIC_VECTOR (5 downto 0);
           nRD : out  STD_LOGIC_VECTOR (5 downto 0);
           cwp : in  STD_LOGIC;
           ncwp : out  STD_LOGIC
			  );
	end component;		
		
		
	component SEU22
		    Port ( SEU22 : in  STD_LOGIC_VECTOR (21 downto 0);
           out32 : out  STD_LOGIC_VECTOR (31 downto 0));
			  end component;
	
	component muxCU
		Port ( PCDisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
           PCDisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
           PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluResult : in  STD_LOGIC_VECTOR (31 downto 0);
           PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
           mux_out : out  STD_LOGIC_VECTOR (31 downto 0));

	end component;

	component muxDM
		Port ( DatoFromMem : in  STD_LOGIC_VECTOR (31 downto 0);
				  AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
				  PC : in  STD_LOGIC_VECTOR (31 downto 0);
				  RFSource : in  STD_LOGIC_VECTOR (1 downto 0);
				  RFData : out  STD_LOGIC_VECTOR (31 downto 0));
	end component;
	
	component muxWM
	Port ( nrd : in  STD_LOGIC_VECTOR (5 downto 0);
           registroO7 : in  STD_LOGIC_VECTOR (5 downto 0);
           RFDestSel : in  STD_LOGIC;
           RFDest : out  STD_LOGIC_VECTOR (5 downto 0));
	end component;

	
	component DM
		Port ( clk : in  STD_LOGIC;
			  rst : in STD_LOGIC;
			  cRD : in  STD_LOGIC_VECTOR (31 downto 0);
           aluIn : in STD_LOGIC_VECTOR (31 downto 0);	
           wrenmem : in  STD_LOGIC;
           datatomem : out  STD_LOGIC_VECTOR (31 downto 0));

	end component;
	
	
	component AdderPC22
	Port ( 
	      PC : in  STD_LOGIC_VECTOR (31 downto 0);
         disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
         suma : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	component AdderPC30
	Port ( 
	      PC : in  STD_LOGIC_VECTOR (31 downto 0);
         disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
         suma : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	end component;
	
	signal aux_outnPC,aux_outPC,aux_outCRS1,aux_outCRS2,aux_outAdd,aux_outIM,aux_outAluResult,aux_simm32out,aux_OperandoAluout,aux_outCRD,aux_outdata,aux_data_to_write: std_logic_vector(31 downto 0);--addressnPC
	signal aux_outPCAddressOut,aux_out22SEU32,aux_out22suma,aux_out30suma: std_logic_vector(31 downto 0);
	signal aux_outAluop,aux_outnRS1,aux_outnRS2,aux_outnRD,aux_RO7,aux_outnRDMuxRF: std_logic_vector(5 downto 0);
	signal aux_outNZVC,aux_icc: std_logic_vector(3 downto 0);
	signal aux_outCarry,aux_outnCWP,aux_outCWP,aux_outWrEn,aux_outwrenDM,aux_outRFdest: std_logic;
	signal aux_PCSource,aux_outselectorMux : std_logic_vector(1 downto 0);
	
	

	begin

   aux_Add: Add PORT MAP(
		op1 => "00000000000000000000000000000001",
		op2 => aux_outnPC,
		resultado => aux_outAdd
	);

	aux_nPC: nPC PORT MAP(
		nPC_in => aux_outPCAddressOut,
		reset => rst,
		clk => clk,
		nPC_out => aux_outnPC
	);

	aux_PC: PC PORT MAP(
		PC_in => aux_outnPC,
		reset => rst,
		clk => clk,
		PC_out => aux_outPC 
	);
	
	aux_IM: IM PORT MAP(
--		clk => clk,
		IM_in => aux_outPC,
		reset => rst,
		IM_out => aux_outIM
	);

	aux_RF: RF PORT MAP(
		reset => rst,
	 --clk => clk,
		we => aux_outWrEn,
		rs1 => aux_outnRS1,
		rs2 => aux_outnRS2,
		rd  => aux_outnRDMuxRF,
		datawrite => aux_data_to_write,
		CRs1 => aux_outCRS1,
		CRs2 => aux_outCRS2,
		Crd => aux_outCRD
	);
	
	aux_CU: CU PORT MAP(
		op => aux_outIM(31 downto 30),
		op2 => aux_outIM(24 downto 22),
		op3 => aux_outIM(24 downto 19),
		icc => aux_icc,
	   cond => aux_outIM(28 downto 25),	
		wrEnMem => aux_outwrenDM,
		rfSource => aux_outselectorMux,
	   wrEnRF => aux_outWrEn,
		ALUOP => aux_outAluop,
		rfDest => aux_outRFdest,
		pcSource => aux_PCSource
	);

	aux_ALU: ALU PORT MAP(
		CRs1 => aux_outCRS1,
		CRs2 => aux_OperandoAluout,
		c => aux_outCarry,
		aluOP => aux_outAluop,
		AluResult => aux_outAluResult
		
	);
	
	aux_SEU: SEU PORT MAP(
		imm => aux_outIM(12 downto 0),
		dataOut => aux_simm32out
	);
	
	aux_MUX: MUX PORT MAP(
		op1 => aux_outCRS2,
      op2 => aux_simm32out,
      i => aux_outIM(13),
      dataOut => aux_OperandoAluout
	);
	
	aux_PSRM: PSRM PORT MAP(
		Op1 => aux_outCRS1(31),
      Op2 => aux_OperandoAluout(31),
      reset => rst,
		Aluop => aux_outIM(24 downto 19),--op3     
		OP => aux_outIM(31 downto 30),											
      Aluresult => aux_outAluResult,
		nzvc => aux_outNZVC
		
	);
	
	aux_PSR: PSR PORT MAP(
	   clk => clk,
	   reset => rst,
		ncwp => aux_outnCWP,
		cwp => aux_outCWP,
	   nzvc => aux_outNZVC,
		icc => aux_icc,
      psr_out => aux_outCarry
	);
	
	aux_WM: WM PORT MAP(
	   RS1 => aux_outIM(18 downto 14),
      RS2 => aux_outIM(4 downto 0),
      RD => aux_outIM(29 downto 25),
      OP => aux_outIM(31 downto 30),
      OP3 => aux_outIM(24 downto 19),
		RO7 => aux_RO7,
      cwp => aux_outCWP,
      ncwp => aux_outnCWP,
      nRS1 => aux_outnRS1,
      nRS2 => aux_outnRS2,
      nRD => aux_outnRD 
	);
	
	aux_DM: DM PORT MAP(
      rst => rst,
		clk => clk,
      wrenmem => aux_outwrenDM,
      aluIn => aux_outAluResult,
      cRD => aux_outCRD,		
      datatomem => aux_outdata
	);
		
	aux_MuxDM: MuxDM PORT MAP( 
	   RFSource => aux_outselectorMux,
		DatoFromMem => aux_outdata, 
      AluResult => aux_outAluResult,
      PC => aux_outPC, 
		RFData =>  aux_data_to_write
	);
	
	aux_MuxRF: muxWM PORT MAP(
		nrd => aux_outnRD,
		registroO7 => aux_RO7,
		RFDestSel => aux_outRFdest,
		RFDest => aux_outnRDMuxRF
	);
	
	aux_MuxCU: muxCU PORT MAP(
		PCDisp30 => aux_out30suma,
      PCDisp22 => aux_out22suma,
      PC1 => aux_outAdd, 
      aluResult => aux_outAluResult,
      PCSource => aux_PCSource,
      mux_out => aux_outPCAddressOut
	);
	
	aux_SEU22: SEU22 PORT MAP(
		SEU22 => aux_outIM(21 downto 0),
      out32 => aux_out22SEU32
	);
	
		
	aux_AdderPC22: AdderPC22 PORT MAP(
		 PC => aux_outPC,
       disp22 => aux_out22SEU32,
       suma => aux_out22suma
	);
	
	aux_AdderPC30: AdderPC30 PORT MAP(
		 PC => aux_outPC, 
       disp30 => aux_outIM,
       suma => aux_out30suma
	);
   
	 ProcesadorResult <=aux_data_to_write;


end Behavioral;