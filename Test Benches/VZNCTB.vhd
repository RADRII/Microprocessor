library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VZNCTB is
end VZNCTB;

architecture Behavioral of VZNCTB is
component VZNC
     Port(V,Z,N,C,FL, Clk : in STD_LOGIC;
        Reset : in STD_LOGIC_VECTOR(3 downto 0);
        NZVC : out STD_LOGIC_VECTOR(3 downto 0));
end component;

signal V,Z,N,C,FL : STD_LOGIC;
signal Reset, NZVC : STD_LOGIC_VECTOR(3 downto 0);
signal Clk : STD_LOGIC:= '0';

begin
UUT: VZNC port map(V => V, Z => Z, N => N, C => C, FL => FL, Clk => Clk, Reset => Reset, NZVC => NZVC);
    Clk <= not CLk after 10ns; 
    VZNC_Run : Process
    begin
        V <= '1';
        Z <= '1';
        N <= '1';
        C <= '1';
        FL <= '1';
        Reset <= "0000";
        wait for 20ns; --output should be 1111
        FL <= '0';
        Reset <= "1000"; 
        wait for 20ns; --output should be  1101
        Reset <= "0100";
        wait for 20ns; --output should be  1100
        Reset <= "0010";
        wait for 20ns; --output should be  0100
        Reset <= "0001";
        wait for 20ns;
        Reset <= "0000"; --output should be  0000
        wait for 20ns;
    
    end process;
end Behavioral;
