----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:47:13 10/09/2016 
-- Design Name: 
-- Module Name:    InstructionMem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity InstructionMem is
	Port ( reset : in  STD_LOGIC;
           dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0));
end InstructionMem;

architecture Behavioral of InstructionMem is
	type rom is array (0 to 63) of std_logic_vector (31 downto 0);
			
		impure function Cargar(name: in string) return rom is
		
			FILE fl: text open read_mode is name;
			variable linea : line;
			variable aux_bv : bit_vector(31 downto 0);
			variable aux_mem : rom;			
			begin			
				for I in rom'range loop
					readline (fl, linea);
					read(linea, aux_bv);
					aux_mem(i) := to_stdlogicvector(aux_bv);
				end loop;
				
			return aux_mem;
		end function;
		
		signal instruccion : rom := Cargar("test.data");
	
begin

	process(reset,dataIn, instruccion)
	begin
	
			if(reset = '1')then
				dataOut <= (others=>'0');
			else
				dataOut <= instruccion(conv_integer(dataIn(5 downto 0)));
			end if;
		
	end process;

end Behavioral;
