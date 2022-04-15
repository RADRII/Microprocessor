library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CAR is
    Port(Code : in STD_LOGIC_VECTOR(16 downto 0);
         S, Clk, Reset : in STD_LOGIC;
         Code_Out : out STD_LOGIC_VECTOR(16 downto 0));
end CAR;

architecture Behavioral of CAR is

component Register32_bit 
    Port( InData : in STD_LOGIC_VECTOR (31 downto 0);
          Load : in STD_LOGIC;
          Clk : in STD_LOGIC;
          OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALU
    Port( A, B : in STD_LOGIC_VECTOR(31 downto 0);
          Sct : in STD_LOGIC_VECTOR(3 downto 0);
          V,C : out STD_LOGIC;
          G : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component MUX17_1_17 
    Port(A, B : in STD_LOGIC_VECTOR(16 downto 0);
         S : in STD_LOGIC;
         O : out STD_LOGIC_VECTOR(16 downto 0));
end component;

signal ALU_To_MUX1, MUX1_To_MUX2, MUX2_Out : STD_LOGIC_VECTOR(16 downto 0);
signal Reg_To_ALU, MUX2_To_Reg, ALU_Out : STD_LOGIC_VECTOR(31 downto 0);
signal Sct : STD_LOGIC_VECTOR(3 downto 0);

begin
Reg: Register32_bit port map(InData => MUX2_To_Reg, Load => Clk, Clk => Clk, OutData => Reg_To_ALU);
ALU0: ALU port map(A => Reg_To_ALU, B => x"00000000", Sct => Sct, V => open, C => open, G => ALU_Out);
MUX1: MUX17_1_17 port map(A => Code, B => ALU_To_MUX1, S => S, O => MUX1_To_MUX2);
MUX2: MUX17_1_17 port map(A => "00000000000000000", B => MUX1_To_MUX2, S => Reset, O => MUX2_Out);

ALU_To_MUX1 <= ALU_Out(16 downto 0);
MUX2_To_Reg <= "000000000000000" & MUX2_Out;
Sct <= "000" & not(S);
Code_Out <= MUX2_Out after 5ns;

end Behavioral;
