library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX17_1_17TB is
end MUX17_1_17TB;

architecture Behavioral of MUX17_1_17TB is

component MUX17_1_17 
    Port(A, B : in STD_LOGIC_VECTOR(16 downto 0);
         S : in STD_LOGIC;
         O : out STD_LOGIC_VECTOR(16 downto 0));
end component;

signal A, B : STD_LOGIC_VECTOR(16 downto 0);
signal S : STD_LOGIC;
signal O : STD_LOGIC_VECTOR(16 downto 0);

begin
UUT: MUX17_1_17 port map(A=>A , B=>B , S=>S , O=>O);
    MUX_Run : process
    begin
        A <= "11111111111111111";
        B <= "00000000000000000";
        S <= '0';
        wait for 10ns;
        S <= '1';
        wait for 10ns;
    end process;
end Behavioral;
