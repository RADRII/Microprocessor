library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MemoryMTB is
end MemoryMTB;

architecture Behavioral of MemoryMTB is

component MemoryM
    Port(Data_In, Address : in STD_LOGIC_VECTOR(31 downto 0);
     MW : in STD_LOGIC;
     Data_Out : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal Data_In, Address, Data_Out : STD_LOGIC_VECTOR(31 downto 0);
signal MW : STD_LOGIC;

begin
UUT: MemoryM port map(Data_In => Data_In, Address => Address, MW => MW, Data_Out => Data_Out);
    Mem_run : process
    begin
        Data_In <= "11111111111111111111111111111111";
        MW <= '0';
        Address <= "00000000000000000000000000000000";
        Wait for 20ns;
        Address <= "00000000000000000000000000000001";
        Wait for 20ns;
        Address <= "00000000000000000000000000000010";
        Wait for 20ns;
        Address <= "00000000000000000000000000000011";
        Wait for 20ns;
        Address <= "00000000000000000000000000000100";
        Wait for 20ns;
        Address <= "00000000000000000000000000000101";
        Wait for 20ns;
        Address <= "00000000000000000000000000000110";
        Wait for 20ns;
        Address <= "00000000000000000000000000000111";
        Wait for 20ns;
        MW <= '1';
        Address <= "00000000000000000000000000000000";
        wait for 20ns;
    end process;
end Behavioral;
