library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitSerialAdderSubtractor is
port (
    A: in STD_LOGIC_VECTOR (3 downto 0); -- Input number A
    B: in STD_LOGIC_VECTOR (3 downto 0); -- Input number B
    CLK: in STD_LOGIC; -- Clock signal
    Mode: in STD_LOGIC; -- Operating mode (addition/subtraction)
    Load: in STD_LOGIC; -- Parallel load
    A_Reg_Out: out STD_LOGIC_VECTOR(3 downto 0); -- Output of register A
    B_Reg_Out: out STD_LOGIC_VECTOR(3 downto 0); -- Output of register B
    Sev_Seg_Out: out STD_LOGIC_VECTOR(6 downto 0)); -- Seven segment output
end FourBitSerialAdderSubtractor;

architecture Behavioral of FourBitSerialAdderSubtractor is

signal CarryOut: STD_LOGIC; -- Carry-out signal
signal A_Reg: STD_LOGIC_VECTOR(3 downto 0):="0000"; -- Register A
signal B_Reg: STD_LOGIC_VECTOR(3 downto 0):="0000"; -- Register B

begin
-------------- Sequential part --------------
process(CLK)
variable Sum: STD_LOGIC;
begin
if(rising_edge(CLK)) then
    if (Load = '1') then
       A_Reg <= A;
        if (Mode = '0') then
            -- Addition
            B_Reg <= B;
            CarryOut <= '0';
        else  -- Subtraction    (two's complement of B is loaded into B_Reg)
            -- By setting carry in (carry-out(0)) as "1", and negating number B
            -- the two's complement representation is obtained
            B_Reg <= not(B);
            CarryOut <= '1';
        end if;
    else
        -- Rotate right register B_Reg
        B_Reg <= (B_Reg(0) & B_Reg(3 downto 1));
        -- Full-adder: summation output is assigned to variable "Sum" (immediate)
        Sum := (A_Reg(0) xor B_Reg(0)) xor (CarryOut);
        -- Write sum output of the full-adder to the MSB of the register A_Reg
        A_Reg <= (Sum & A_Reg(3 downto 1));
        -- Write carry out output of the full-adder to the flip-flop
        CarryOut <= (((A_Reg(0) xor B_Reg(0)) and CarryOut)) or (A_Reg(0) and B_Reg(0));
    end if;
end if;
end process;

-------------- Combinational part ----------------
A_Reg_Out <= A_Reg; -- Map A_REG to LEDs
B_Reg_Out <= B_Reg; -- Map B_REG to LEDs

-- Seven segment display for register A_Reg
with A_Reg select
Sev_Seg_Out <=  "0000001" when "0000",
                "1001111" when "0001",
                "0010010" when "0010",
                "0000110" when "0011",
                "1001100" when "0100",
                "0100100" when "0101",
                "0100000" when "0110",
                "0001111" when "0111",
                "0000000" when "1000",
                "0000100" when "1001",
                "0001000" when "1010",
                "1100000" when "1011",
                "0110001" when "1100",
                "1000010" when "1101",
                "0110000" when "1110",
                "0111000" when "1111",
                "0000001" when others;
end Behavioral;
