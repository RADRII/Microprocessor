

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


ENTITY Decoder5To32TB is
end Decoder5To32TB;

architecture Behavioral of Decoder5To32TB is
    component Decoder5To32 is
        Port ( 
                DestA : in std_logic_vector(4 downto 0);
                DestChoice : out std_logic_vector(31 downto 0)
              );    
    end component;
    
    signal DestA : std_logic_VECTOR (4 downto 0);
    signal DestChoice : STD_LOGIC_VECTOR(31 downto 0);
    
begin
UUT : Decoder5To32 port map (DestA => DestA, DestChoice => DestChoice);

    Decoder_run : process
        begin
            DestA <= "00000";
            wait for 10ns;
            DestA <= "00001";
            wait for 10ns;
            DestA <= "00010";
            wait for 10ns;
            DestA <= "00011";
            wait for 10ns;
            DestA <= "00100";
            wait for 10ns;
            DestA <= "00101";
            wait for 10ns;
            DestA <= "00110";
            wait for 10ns;
            DestA <= "00111";
            wait for 10ns;
            DestA <= "01000";
            wait for 10ns;
            DestA <= "01001";
            wait for 10ns;
            DestA <= "01010";
            wait for 10ns;
            DestA <= "01011";
            wait for 10ns;
            DestA <= "01100";
            wait for 10ns;
            DestA <= "01101";
            wait for 10ns;
            DestA <= "01110";
            wait for 10ns;
            DestA <= "01111";
            wait for 10ns;
            DestA <= "10000";
            wait for 10ns;
            DestA <= "10001";
            wait for 10ns;
            DestA <= "10010";
            wait for 10ns;
            DestA <= "10011";
            wait for 10ns;
            DestA <= "10100";
            wait for 10ns;
            DestA <= "10101";
            wait for 10ns;
            DestA <= "10110";
            wait for 10ns;
            DestA <= "10111";
            wait for 10ns;
            DestA <= "11000";
            wait for 10ns;
            DestA <= "11001";
            wait for 10ns;
            DestA <= "11010";
            wait for 10ns;
            DestA <= "11011";
            wait for 10ns;
            DestA <= "11100";
            wait for 10ns;
            DestA <= "11101";
            wait for 10ns;
            DestA <= "11110";
            wait for 10ns;
            DestA <= "11111";
            wait for 10ns;       
        end process;
end Behavioral;
