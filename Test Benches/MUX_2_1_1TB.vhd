library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX2_1_1TB is
end MUX2_1_1TB;

architecture Behavioral of MUX2_1_1TB is
component MUX2_1_1 is
    Port( A, B, S : in STD_LOGIC;
          O : out STD_LOGIC);         
end component;

signal A, B, S, O : STD_LOGIC;
begin
    UUT: MUX2_1_1 port map(A=>A, B=>B, S=>S, O=>O);
    Multi_Run : process
    begin
        A <= '1';
        B <= '0';
        S <= '0';
        wait for 10ns;
        S <= '1';
        wait for 10ns;
    end process;
end Behavioral;
