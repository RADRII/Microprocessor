library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FunctionalUnitTB is
end FunctionalUnitTB;

architecture Behavioral of FunctionalUnitTB is

component FunctionalUnit is
    Port( A,B : in STD_LOGIC_VECTOR(31 downto 0);
          GSct : in STD_LOGIC_VECTOR(3 downto 0);
          HSct : in STD_LOGIC_VECTOR(1 downto 0);
          MF : in STD_LOGIC;
          V,C,N,Z : out STD_LOGIC;
          O : out STD_LOGIC_VECTOR(31 downto 0));     
end component;

signal A,B,O : STD_LOGIC_VECTOR(31 downto 0);
signal GSct : STD_LOGIC_VECTOR(3 downto 0);
signal HSct : STD_LOGIC_VECTOR(1 downto 0);
signal MF,V,C,N,Z : STD_LOGIC;

begin
UUT: FunctionalUnit port map(A=>A, B=>B, GSct=>GSct, HSct=>HSct, MF=>MF, V=>V, C=>C, N=>N, Z=>Z, O=>O);
    Function_Run : process
    begin
        A <= "00000000000000000000000000000001";
        B <= "11111111111111111111111111111110";
        MF <= '0';
        HSct <= "00";
        GSct <= "0000";
        wait for 400ns; --G = A, 00000001 = 00000001
        GSct <= "0001";
        wait for 400ns; --G = A + 1, 000000002 = 00000001 + 1
        GSct <= "0010";
        wait for 400ns; --G = A + B, FFFFFFFF = FFFFFFFE + 00000001
        GSct <= "0011";
        wait for 400ns; --G = A + B + 1, 00000000 = FFFFFFFE + 00000001 + 1
        HSct <= "01";
        GSct <= "0100"; 
        wait for 400ns; --G = A + One's Compliment B, 00000002 = 00000001 + One's Compliment(FFFFFFFE)
        GSct <= "0101";
        wait for 400ns; --G = A + 2's compliment(B), 00000003 = 00000001 + 2's compliment(FFFFFFFE)
        GSct <= "0110";
        wait for 400ns; --G = A - 1, 00000000 = 00000001 - 1
        GSct <= "0111";
        wait for 400ns; --G = A, 00000001 = 00000001
        HSct <= "00";
        GSct <= "1000";
        wait for 400ns; --G = A ^ B, 00000000 = 00000001 ^ FFFFFFFE
        HSct <= "10";
        GSct <= "1010";
        wait for 400ns; --G = A or B, FFFFFFFF = 00000001 or FFFFFFFE
        GSct <= "1100";
        wait for 400ns; --G = A xor B. FFFFFFFF = 00000001 xor FFFFFFFE
        GSct <= "1110";
        wait for 400ns; --G = ¬A, FFFFFFFE = ¬(00000001)
        MF <= '1';
        GSct <= "0000";
        Hsct <= "00";
        wait for 400ns; --HSct = 00 -> G = B, FFFFFFFE = FFFFFFFE
        GSct <= "0100";
        HSct <= "01";
        wait for 400ns; --HSct = 01 -> G = sr B, 7FFFFFFFF = sr(FFFFFFFE)
        GSct <= "1000";
        HSct <= "10";
        wait for 400ns; --HSct = 10 -> G = sl B, FFFFFFFC = sl(FFFFFFFE)
        
        A<="11111111111111111111111111111111";
        
    end process;
end Behavioral;
