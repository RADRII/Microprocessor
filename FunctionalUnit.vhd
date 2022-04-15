library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity FunctionalUnit is
    Port( A,B : in STD_LOGIC_VECTOR(31 downto 0);
          GSct : in STD_LOGIC_VECTOR(3 downto 0);
          HSct : in STD_LOGIC_VECTOR(1 downto 0);
          MF : in STD_LOGIC;
          V,C,N,Z : out STD_LOGIC;
          O : out STD_LOGIC_VECTOR(31 downto 0));     
end FunctionalUnit;

architecture Behavioral of FunctionalUnit is

component MUX32_1_32 is
    port(
          S : in STD_LOGIC;
          InData, RData : in STD_LOGIC_VECTOR(31 downto 0);
          DataOut : out STD_LOGIC_VECTOR(31 downto 0)
         );
end component;

component Shifter32 is
    Port(
          DataIn : in STD_LOGIC_VECTOR(31 downto 0);
          S : in STD_LOGIC_VECTOR(1 downto 0);
          DataOut : out STD_LOGIC_VECTOR(31 downto 0));         
end component;

component ALU is
    Port( A, B : in STD_LOGIC_VECTOR(31 downto 0);
          Sct : in STD_LOGIC_VECTOR(3 downto 0);
          V,C : out STD_LOGIC;
          G : out STD_LOGIC_VECTOR(31 downto 0));
end component;

component ZeroDetect32 is
    Port( Data : in STD_LOGIC_VECTOR(31 downto 0);
          DataOut : out STD_LOGIC);
end component;

signal ALUToMux, ShiftToMux : STD_LOGIC_VECTOR(31 downto 0);
begin
Mux: MUX32_1_32 port map(InData => AluToMux, RData=>ShiftToMux, S => MF, DataOut=>O);
Shifter: Shifter32 port map(DataIn=> B, S=> HSct, DataOut=> ShiftToMux);
ALU1: ALU port map(A=>A, B=>B, Sct=>GSct, V=>V, C=>C, G=>ALUToMux);
ZeroD: ZeroDetect32 port map(Data=>ALUToMux, DataOut=>Z);
N <= ALUToMux(31);

end Behavioral;
