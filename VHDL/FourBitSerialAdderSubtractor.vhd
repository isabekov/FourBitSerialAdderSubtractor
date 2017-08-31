library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FourBitSerialAdderSubtractor is
generic (N : INTEGER:=4); -- N-bit Serial Adder/Subtractor
port(
    A: in STD_LOGIC_VECTOR (N-1 downto 0); -- Input number A
    B: in STD_LOGIC_VECTOR (N-1 downto 0); -- Input number B
    CLK: in STD_LOGIC; -- Clock signal
    Mode: in STD_LOGIC; -- Operating mode (addition/subtraction)
    Load: in STD_LOGIC; -- Parallel load
    A_Reg_Out: out STD_LOGIC_VECTOR(N-1 downto 0); -- Output of register A
    B_Reg_Out: out STD_LOGIC_VECTOR(N-1 downto 0); -- Output of register B
    Sev_Seg_Out: out STD_LOGIC_VECTOR(6 downto 0)); -- Seven segment output
end FourBitSerialAdderSubtractor;

architecture Behavioral of FourBitSerialAdderSubtractor is
signal CarryOut: STD_LOGIC; -- Carry-out signal
signal A_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0'); -- Register A
signal B_Reg: STD_LOGIC_VECTOR(N-1 downto 0):=(others => '0'); -- Register B

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
        B_Reg <= (B_Reg(0) & B_Reg(N-1 downto 1));
        -- Full-adder: summation output is assigned to variable "Sum" (immediate)
        Sum := (A_Reg(0) xor B_Reg(0)) xor (CarryOut);
        -- Write sum output of the full-adder to the MSB of the register A_Reg
        A_Reg <= (Sum & A_Reg(N-1 downto 1));
        -- Write carry out output of the full-adder to the flip-flop
        CarryOut <= (((A_Reg(0) xor B_Reg(0)) and CarryOut)) or (A_Reg(0) and B_Reg(0));
    end if;
end if;
end process;

-------------- Combinational part ----------------
A_Reg_Out <= A_Reg; -- Map A_REG to LEDs
B_Reg_Out <= B_Reg; -- Map B_REG to LEDs

-- Seven segment display for register A_Reg
Sev_Seg_Out <=  "0000001" when A_Reg = "0000" else
                "1001111" when A_Reg = "0001" else
                "0010010" when A_Reg = "0010" else
                "0000110" when A_Reg = "0011" else
                "1001100" when A_Reg = "0100" else
                "0100100" when A_Reg = "0101" else
                "0100000" when A_Reg = "0110" else
                "0001111" when A_Reg = "0111" else
                "0000000" when A_Reg = "1000" else
                "0000100" when A_Reg = "1001" else
                "0001000" when A_Reg = "1010" else
                "1100000" when A_Reg = "1011" else
                "0110001" when A_Reg = "1100" else
                "1000010" when A_Reg = "1101" else
                "0110000" when A_Reg = "1110" else
                "0111000" when A_Reg = "1111" else
                "0000001";
end Behavioral;