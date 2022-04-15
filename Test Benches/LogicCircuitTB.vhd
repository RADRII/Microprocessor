library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LogicCircuitTB is
end LogicCircuitTB;

architecture Behavioral of LogicCircuitTB is
component LogicCircuit is
    Port( A, B, S0, S1 : in STD_LOGIC;
          O : out STD_LOGIC);
end component;
signal A,B,S0,S1,O : STD_LOGIC;

begin
UUT: LogicCircuit port map(A=>A,B=>B,S0=>S0,S1=>S1,O=>O);
    Logic_Run : process
    begin
        A <= '0';
        B <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 10ns; --Expecting O = 0
        S0 <= '1';
        wait for 10ns; --Expecting O = 0
        S1 <= '1';
        wait for 10ns; --Expecting O = 1
        S0 <= '0';
        wait for 10ns; --Expecting O = 0
        
        A <= '1';
        B <= '0';
        S0 <= '0';
        S1 <= '0';
        wait for 10ns; --Expecting O = 0
        S0 <= '1';
        wait for 10ns; --Expecting O = 1
        S1 <= '1';
        wait for 10ns; --Expecting O = 0
        S0 <= '0';
        wait for 10ns; --Expecting O = 1
        
        A <= '0';
        B <= '1';
        S0 <= '0';
        S1 <= '0';
        wait for 10ns; --Expecting O = 0
        S0 <= '1';
        wait for 10ns; --Expecting O = 1
        S1 <= '1';
        wait for 10ns; --Expecting O = 1
        S0 <= '0';
        wait for 10ns; --Expecting O = 1
        
        A <= '1';
        B <= '1';
        S0 <= '0';
        S1 <= '0';
        wait for 10ns; --Expecting O = 1
        S0 <= '1';
        wait for 10ns; --Expecting O = 0
        S1 <= '1';
        wait for 10ns; --Expecting O = 0
        S0 <= '0';
        wait for 10ns; --Expecting O = 1
        
        
    end process;
end Behavioral;