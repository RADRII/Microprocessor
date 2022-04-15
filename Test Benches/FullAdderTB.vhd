library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FullAdderTB is
end FullAdderTB;

architecture Behavioral of FullAdderTB is
component FullAdder is
    Port( X, Y, CIn : in STD_LOGIC;
          Sum, COut : out STD_LOGIC);  
end component;

signal X, Y, CIn, Sum, COut : STD_LOGIC;
begin
    UUT: FullAdder port map (X=>X, Y=>Y, CIn=>CIn, Sum=>Sum, COut=>COut); 
    Adder_Run : process
    begin
        X <= '0';
        y <= '0';
        CIn <= '0';
        wait for 10ns; --Expecting sum = 0, COut = 0
        
        CIn <= '1';
        wait for 10ns; --Expecting sum = 1, COut = 0
        
        Y <= '1';
        wait for 10ns;  --Expecting sum = 0, COut = 1
        CIn <= '0';
        wait for 10ns;  --Expecting sum = 1, COut = 0
        
        X <= '1';
        wait for 10ns;  --Expecting sum = 0, COut = 1
        CIn <= '1';
        wait for 10ns;  --Expecting sum = 1, COut = 1
        
        Y <= '0';
        wait for 10ns; --Expecting sum = 0, COut = 1
        CIn <= '0';
        wait for 10ns; --Expecting sum = 1, COut = 0
    end process;
end Behavioral;
