library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALUTB is
end ALUTB;

architecture Behavioral of ALUTB is
component ALU is
    Port( A, B : in STD_LOGIC_VECTOR(31 downto 0);
          Sct : in STD_LOGIC_VECTOR(3 downto 0);
          V,C : out STD_LOGIC;
          G : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal A,B,G : STD_LOGIC_VECTOR(31 downto 0);
signal V,C : STD_LOGIC;
signal Sct : STD_LOGIC_VECTOR(3 downto 0);

begin
UUT: ALU port map (A=>A, B=>B, Sct=>Sct, V=>V, C=>C, G=>G);
    ALU_Run : process
    begin
        A<= "00000000000000000000000000000001";
        B <= "11111111111111111111111111111110";
        Sct <= "0000";
        wait for 400ns; --G = A, 00000001 = 00000001
        Sct <= "0001";
        wait for 400ns; --G = A + 1, 000000002 = 00000001 + 1
        Sct <= "0010";
        wait for 400ns; --G = A + B, FFFFFFFF = FFFFFFFE + 00000001
        Sct <= "0011";
        wait for 400ns;--G = A + B + 1, 00000000 = FFFFFFFE + 00000001 + 1
        Sct <= "0100";
        wait for 400ns; --G = A + One's Compliment B, 00000002 = 00000001 + One's Compliment(FFFFFFFE)
        Sct <= "0101";
        wait for 400ns; --G = A + 2's compliment(B), 00000003 = 00000001 + 2's compliment(FFFFFFFE)
        Sct <= "0110";
        wait for 400ns; --G = A - 1, 00000000 = 00000001 - 1
        Sct <= "0111";
        wait for 400ns; --G = A, 00000001 = 00000001
        Sct <= "1000";
        wait for 400ns; --G = A ^ B, 00000000 = 00000001 ^ FFFFFFFE
        Sct <= "1010";
        wait for 400ns; --G = A or B, FFFFFFFF = 00000001 or FFFFFFFE
        Sct <= "1100";
        wait for 400ns; --G = A xor B. FFFFFFFF = 00000001 xor FFFFFFFE
        Sct <= "1110";
        wait for 400ns; --G = ¬A, FFFFFFFE = ¬(00000001)
    end process;
end Behavioral;
