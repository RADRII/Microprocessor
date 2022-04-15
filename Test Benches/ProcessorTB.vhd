library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ProcessorTB is
end ProcessorTB;

architecture Behavioral of ProcessorTB is

component Processor
    Port(Clk, Reset : in STD_LOGIC;
    RP00,RP01,RP02,RP03,RP04,RP05,RP06,RP07,RP08,RP09,RP10,RP11,RP12,RP13,RP14,RP15,
             RP16,RP17,RP18,RP19,RP20,RP21,RP22,RP23,RP24,RP25,RP26,RP27,RP28,RP29,RP30,RP31,RP32 : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal Clk : STD_LOGIC := '0';
signal Reset : STD_LOGIC;
signal RP00,RP01,RP02,RP03,RP04,RP05,RP06,RP07,RP08,RP09,RP10,RP11,RP12,RP13,RP14,RP15,
       RP16,RP17,RP18,RP19,RP20,RP21,RP22,RP23,RP24,RP25,RP26,RP27,RP28,RP29,RP30,RP31,RP32 : STD_LOGIC_VECTOR(31 downto 0);
begin
UUT: Processor port map(Clk => Clk, Reset => Reset,
                        RP00 => RP00, RP01 => RP01, RP02 => RP02, RP03 => RP03, RP04 => RP04, RP05 => RP05, RP06 => RP06, RP07 => RP07, RP08 => RP08, RP09 => RP09, RP10 => RP10, RP11 => RP11, RP12 => RP12, RP13 => RP13, RP14 => RP14, RP15 => RP15, RP16 => RP16, RP17 => RP17, RP18 => RP18, RP19 => RP19, RP20 => RP20, RP21 => RP21, RP22 => RP22, RP23 => RP23, RP24 => RP24, RP25 => RP25, RP26 => RP26, RP27 => RP27, RP28 => RP28, RP29 => RP29, RP30 => RP30, RP31 => RP31, RP32 => RP32);
    Clk <= not CLk after 5000ns; 
    processor_run : process
    begin
        Reset <= '1';
        wait for 10000ns;
        Reset <= '0';
        wait for 80000000ns;
    end process;
end behavioral;