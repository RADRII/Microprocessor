library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Shifter32TB is
end Shifter32TB;

architecture Behavioral of Shifter32TB is
    component Shifter32 is
      Port(
                DataIn : in STD_LOGIC_VECTOR(31 downto 0);
                S : in STD_LOGIC_VECTOR(1 downto 0);
                DataOut : out STD_LOGIC_VECTOR(31 downto 0));         
    end component;

    signal DataIn :  STD_LOGIC_VECTOR(31 downto 0);
    signal S :  STD_LOGIC_VECTOR(1 downto 0);
    signal DataOut : STD_LOGIC_VECTOR(31 downto 0);      
begin
    UUT: Shifter32 port map(DataIn => DataIn, S => S, DataOut => DataOut);
    Shifter_Run : process
    begin
        DataIn <= "01010101010101010101010101010101";
        wait for 5ns;
        S <= "00";
        wait for 10ns; --make sure nothing changes right now
        S <= "01";
        wait for 10ns; --shift right
        S <= "10";
        wait for 10ns; --shift left
        S <= "11";
        wait for 10ns; --set to 0
    end process;
end Behavioral;