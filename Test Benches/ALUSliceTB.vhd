library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUSliceTB is
end ALUSliceTB;

architecture Behavioral of ALUSliceTB is
component ALUSlice is
    Port( A, B, S0, S1, S2, CIn : in STD_LOGIC;
          COut, O : out STD_LOGIC);
end component;

signal A,B,S0,S1,S2,CIn,COut,O : STD_LOGIC;
signal input : STD_LOGIC_VECTOR(5 downto 0);
begin
UUT: ALUSlice port map(A=>A, B=>B, S0=>S0, S1=>S1, S2=>S2, CIn=>CIn, COut=>COut, O=>O);
    A <= input(0);
    B <= input(1);
    S0 <= input(2);
    S1 <= input(3);
    S2 <= input(4);
    CIn <= input(5);
    
    Slice_Run : process
    begin
    
    input <= "000000"; --Expecting COut: 0 Out: 0
    wait for 20ns; 
    input <= "000001"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "000010"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "000011"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "000100"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "000101"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "000110"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "000111"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "001000"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "001001"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "001010"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "001011"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "001100"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "001101"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "001110"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "001111"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "010000"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "010001"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "010010"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "010011"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "010100"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "010101"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "010110"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "010111"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "011000"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "011001"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "011010"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "011011"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "011100"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "011101"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "011110"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "011111"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "100000"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "100001"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "100010"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "100011"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "100100"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "100101"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "100110"; --Expecting COut:1 Out: 0
    wait for 20ns;
    input <= "100111"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "101000"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "101001"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "101010"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "101011"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "101100"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "101101"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "101110"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "101111"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "110000"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "110001"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "110010"; --Expecting COut: 0 Out: 0
    wait for 20ns;
    input <= "110011"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "110100"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "110101"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "110110"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "110111"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "111000"; --Expecting COut: 0 Out: 1
    wait for 20ns;
    input <= "111001"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "111010"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "111011"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "111100"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "111101"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    input <= "111110"; --Expecting COut: 1 Out: 0
    wait for 20ns;
    input <= "111111"; --Expecting COut: 1 Out: 1
    wait for 20ns;
    
    end process;
end Behavioral;
