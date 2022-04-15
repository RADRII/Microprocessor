library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU is
    Port( A, B : in STD_LOGIC_VECTOR(31 downto 0);
          Sct : in STD_LOGIC_VECTOR(3 downto 0);
          V,C : out STD_LOGIC;
          G : out STD_LOGIC_VECTOR(31 downto 0));
end ALU;

architecture Behavioral of ALU is
component ALUSlice is
    Port( A, B, S0, S1, S2, CIn : in STD_LOGIC;
          COut, O : out STD_LOGIC);
end component;

signal C0, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16, C17, C18,
       C19, C20, C21, C22, C23, C24, C25, C26, C27, C28, C29, C30, C31 : STD_LOGIC;
      
begin
ALUSlice_0 : ALUSlice port map (A=>A(0), B=>B(0), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>Sct(0), COut=>C0, O=>G(0));
ALUSlice_1 : ALUSlice port map (A=>A(1), B=>B(1), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C0 , COut=>C1, O=>G(1));
ALUSlice_2 : ALUSlice port map (A=>A(2), B=>B(2), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C1 , COut=>C2, O=>G(2));
ALUSlice_3 : ALUSlice port map (A=>A(3), B=>B(3), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C2 , COut=>C3, O=>G(3));
ALUSlice_4 : ALUSlice port map (A=>A(4), B=>B(4), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C3 , COut=>C4, O=>G(4));
ALUSlice_5 : ALUSlice port map (A=>A(5), B=>B(5), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C4 , COut=>C5, O=>G(5));
ALUSlice_6 : ALUSlice port map (A=>A(6), B=>B(6), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C5 , COut=>C6, O=>G(6));
ALUSlice_7 : ALUSlice port map (A=>A(7), B=>B(7), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C6 , COut=>C7, O=>G(7));
ALUSlice_8 : ALUSlice port map (A=>A(8), B=>B(8), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C7 , COut=>C8, O=>G(8));
ALUSlice_9 : ALUSlice port map (A=>A(9), B=>B(9), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C8 , COut=>C9, O=>G(9));
ALUSlice_10 : ALUSlice port map (A=>A(10), B=>B(10), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C9 , COut=>C10, O=>G(10));
ALUSlice_11 : ALUSlice port map (A=>A(11), B=>B(11), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C10 , COut=>C11, O=>G(11));
ALUSlice_12 : ALUSlice port map (A=>A(12), B=>B(12), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C11 , COut=>C12, O=>G(12));
ALUSlice_13 : ALUSlice port map (A=>A(13), B=>B(13), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C12 , COut=>C13, O=>G(13));
ALUSlice_14 : ALUSlice port map (A=>A(14), B=>B(14), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C13 , COut=>C14, O=>G(14));
ALUSlice_15 : ALUSlice port map (A=>A(15), B=>B(15), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C14 , COut=>C15, O=>G(15));
ALUSlice_16 : ALUSlice port map (A=>A(16), B=>B(16), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C15 , COut=>C16, O=>G(16));
ALUSlice_17 : ALUSlice port map (A=>A(17), B=>B(17), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C16 , COut=>C17, O=>G(17));
ALUSlice_18 : ALUSlice port map (A=>A(18), B=>B(18), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C17 , COut=>C18, O=>G(18));
ALUSlice_19 : ALUSlice port map (A=>A(19), B=>B(19), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C18 , COut=>C19, O=>G(19));
ALUSlice_20 : ALUSlice port map (A=>A(20), B=>B(20), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C19 , COut=>C20, O=>G(20));
ALUSlice_21 : ALUSlice port map (A=>A(21), B=>B(21), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C20 , COut=>C21, O=>G(21));
ALUSlice_22 : ALUSlice port map (A=>A(22), B=>B(22), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C21 , COut=>C22, O=>G(22));
ALUSlice_23 : ALUSlice port map (A=>A(23), B=>B(23), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C22 , COut=>C23, O=>G(23));
ALUSlice_24 : ALUSlice port map (A=>A(24), B=>B(24), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C23 , COut=>C24, O=>G(24));
ALUSlice_25 : ALUSlice port map (A=>A(25), B=>B(25), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C24 , COut=>C25, O=>G(25));
ALUSlice_26 : ALUSlice port map (A=>A(26), B=>B(26), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C25 , COut=>C26, O=>G(26));
ALUSlice_27 : ALUSlice port map (A=>A(27), B=>B(27), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C26 , COut=>C27, O=>G(27));
ALUSlice_28 : ALUSlice port map (A=>A(28), B=>B(28), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C27 , COut=>C28, O=>G(28));
ALUSlice_29 : ALUSlice port map (A=>A(29), B=>B(29), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C28 , COut=>C29, O=>G(29));
ALUSlice_30 : ALUSlice port map (A=>A(30), B=>B(30), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C29 , COut=>C30, O=>G(30));
ALUSlice_31 : ALUSlice port map (A=>A(31), B=>B(31), S0=>Sct(1), S1=>Sct(2), S2=>Sct(3), CIn=>C30 , COut=>C31, O=>G(31));

C <= C31;
V <= C31 xor C30;

end Behavioral;
