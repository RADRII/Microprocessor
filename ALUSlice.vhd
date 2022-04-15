library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUSlice is
    Port( A, B, S0, S1, S2, CIn : in STD_LOGIC;
          COut, O : out STD_LOGIC);
end ALUSlice;

architecture Behavioral of ALUSlice is
component ArithmaticCircuit is
    Port(A, B, CIn, S0, S1 : in STD_LOGIC;
         COut, G : out STD_LOGIC);
end component;

component LogicCircuit is
    Port( A, B, S0, S1 : in STD_LOGIC;
          O : out STD_LOGIC);
end component;

component MUX2_1_1 is
    Port( A, B, S : in STD_LOGIC;
          O : out STD_LOGIC);         
end component;

signal ArithToMux, LogicToMux,waitC : STD_LOGIC;
begin

Arithmatic : ArithmaticCircuit port map(A=>A, B=>B, CIn=>CIn, S0=>S0, S1=>S1, G => ArithToMux, COut => waitC);
Logic : LogicCircuit port map(A=>A, B=>B, S0=>S0, S1=>S1, O=> LogicToMux);
Multi : MUX2_1_1 port map(A=>ArithToMux, B=>LogicToMux, S => S2, O=>O);
COut <= waitC after 5ns;

end Behavioral;
