library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Datapath is
    Port( DataIn, ConstantIn : in STD_LOGIC_VECTOR(31 downto 0);
          Clk: in STD_LOGIC;
          Control: in STD_LOGIC_VECTOR(22 downto 0);
          AddressOut, DataOut : out STD_LOGIC_VECTOR(31 downto 0);
          V, C, N, Z : out STD_LOGIC);
end Datapath;

architecture Behavioral of Datapath is

component FunctionalUnit is
    Port( A,B : in STD_LOGIC_VECTOR(31 downto 0);
          GSct : in STD_LOGIC_VECTOR(3 downto 0);
          HSct : in STD_LOGIC_VECTOR(1 downto 0);
          MF : in STD_LOGIC;
          V,C,N,Z : out STD_LOGIC;
          O : out STD_LOGIC_VECTOR(31 downto 0));     
end component;

component OldRegister32DP is
    Port( DSelect, MuxA, MuxB : in STD_LOGIC_VECTOR (4 downto 0);
      Clk, LEnable : in STD_LOGIC;
      InData : in STD_LOGIC_VECTOR (31 downto 0);
      DataA, DataB : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component OldMultiplexer2To32 is
    port(
      S : in STD_LOGIC;
      InData, RData : in STD_LOGIC_VECTOR(31 downto 0);
      DataOut : out STD_LOGIC_VECTOR(31 downto 0));
end component;
signal BusA, BusB1, BusB2, BusD, FunctToMux : STD_LOGIC_VECTOR(31 downto 0);
signal MD, MB, MF, LEnable : STD_LOGIC;
signal HSct : STD_LOGIC_VECTOR(1 downto 0);
signal ASct, BSct, DSct : STD_LOGIC_VECTOR(4 downto 0);
signal GSct : STD_LOGIC_VECTOR(3 downto 0);

begin
MD <= Control(1);
MB <= Control(7);
MF <= Control(6);
LEnable <= Control(0);
DSct <= Control(22 downto 18);
HSct <= Control(5 downto 4);
ASct <= Control(17 downto 13);
BSct <= Control(12 downto 8);
GSct <= Control(5 downto 2);

Funct: FunctionalUnit port map(A=>BusA, B=>BusB2, GSct=> GSct, HSct=>HSct, MF=>MF, V=>V, C=>C, N=>N, Z=>Z, O=>FunctToMux);
Reg: OldRegister32DP port map(DSelect=>DSct, MuxA=>ASct, MuxB=>BSct, Clk=>Clk, LEnable=>LEnable, InData=>BusD, DataA=>BusA, DataB=>BusB1);
RegToFunct: Multiplexer2To32 port map(S=>MB, InData=>BusB1, RData=>ConstantIn, DataOut=>BusB2);
FunctToReg: Multiplexer2To32 port map(S=>MD, InData=>FunctToMux, RData=>DataIn, DataOut=>BusD);

DataOut <= BusB2 after 5ns; 
AddressOut <= BusA after 5ns;

end Behavioral;
