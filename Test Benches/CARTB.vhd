library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CARTB is
end CARTB;

architecture Behavioral of CARTB is

component CAR
    Port(Code : in STD_LOGIC_VECTOR(16 downto 0);
     S, Clk, Reset : in STD_LOGIC;
     Code_Out : out STD_LOGIC_VECTOR(16 downto 0));
end component;

signal Code, Code_Out : STD_LOGIC_VECTOR(16 downto 0);
signal S, Reset : STD_LOGIC;
signal Clk : STD_LOGIC:= '0';

begin
UUT: CAR port map(Code => Code, S => S, Clk => Clk, Reset => Reset, Code_Out => Code_Out);
    Clk <= not CLk after 500ns; 
    CAR_Run : Process
    begin
        Code <= "10000000000000001";
        S <= '0';
        Reset <= '1';
        wait for 1000ns;
        Reset <= '0';
        wait for 10000ns;
        S <= '1';
        wait for 1000ns;
        S <= '0';
        Reset <= '1';
        wait for 1000ns;
    end process;
end Behavioral;
