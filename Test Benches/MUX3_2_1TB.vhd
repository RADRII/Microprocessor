library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX3_2_1TB is
end MUX3_2_1TB;

architecture Behavioral of MUX3_2_1TB is
    component MUX3_2_1 is
    Port(
           Left, Same, Right : in STD_LOGIC;
           S : STD_LOGIC_VECTOR(1 downto 0);
           BitOut : out STD_LOGIC);
    end component;  
    
    signal Left, Same, Right : STD_LOGIC;
    signal S : STD_LOGIC_VECTOR(1 downto 0);
    signal BitOut : STD_LOGIC;
begin
UUT: MUX3_2_1 port map(Left => Left, Right => Right, Same => Same, S => S, BitOut => BitOut);
    Multi31_Run : process
    begin
        Left <= '1';
        Right <= '0';
        Same <= '1';
        wait for 5ns; 
        
        S <= "11";
        wait for 10ns;
        S <= "01";
        wait for 10ns;
        S <= "10";
        wait for 10ns;
        S <= "00";
        wait for 10ns;
        
    end process;
end Behavioral;