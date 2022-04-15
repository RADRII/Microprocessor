library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ArithmaticCircuitTB is
end ArithmaticCircuitTB;

architecture Behavioral of ArithmaticCircuitTB is
component ArithmaticCircuit is
    Port(A, B, CIn, S0, S1 : in STD_LOGIC;
         COut, G : out STD_LOGIC);
end component;

signal A, B, CIn, S0, S1, COut, G : STD_LOGIC;
begin
UUT : ArithmaticCircuit port map( A=>A, B=>B, CIn => CIn, S0=>S0, S1=>S1, COut=>COut, G=>G);
    Circuit_Run : process
    begin
        A <= '0';
        B <= '0';
        CIn <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
        
        CIn <= '1';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
        
        A <= '0';
        B <= '1';
        CIn <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
        
        CIn <= '1';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
        
        A <= '1';
        B <= '0';
        CIn <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
        
        CIn <= '1';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
        
        A <= '1';
        B <= '1';
        CIn <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
        
        CIn <= '1';
        S1 <= '0';
        wait for 20ns;
        S0 <= '1';
        wait for 20ns;
        S1 <= '1';
        wait for 20ns;
        S0 <= '0';
        wait for 20ns;
    end process;
end Behavioral;
