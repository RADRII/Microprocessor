library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmaticCircuit is
    Port(A, B, CIn, S1, S0 : in STD_LOGIC;
         COut, G : out STD_LOGIC);
end ArithmaticCircuit;

architecture Behavioral of ArithmaticCircuit is

component FullAdder is
    Port( X, Y, CIn : in STD_LOGIC;
          Sum, COut : out STD_LOGIC);  
end component;

signal W : STD_LOGIC;

begin
FA : FullAdder port map (X => W, Y => A, CIn => CIn, Sum => G, COut => COut);
W <= (B and S0) or ((not B) and S1);

end Behavioral;