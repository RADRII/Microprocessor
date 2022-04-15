library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register33TB is
end Register33TB;

architecture Behavioral of Register33TB is

component Register32_bitSystem is
    Port( DSelect, MuxA, MuxB : in STD_LOGIC_VECTOR (4 downto 0);
          Clk, LEnable, TD, TA, TB : in STD_LOGIC;
          InData : in STD_LOGIC_VECTOR (31 downto 0);
          DataA, DataB : out STD_LOGIC_VECTOR (31 downto 0);
          RP00,RP01,RP02,RP03,RP04,RP05,RP06,RP07,RP08,RP09,RP10,RP11,RP12,RP13,RP14,RP15,
          RP16,RP17,RP18,RP19,RP20,RP21,RP22,RP23,RP24,RP25,RP26,RP27,RP28,RP29,RP30,RP31,RP32 : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal DSelect, MuxA, MuxB :  STD_LOGIC_VECTOR (4 downto 0);
signal Clk : STD_LOGIC:= '0';
signal LEnable, TD, TA, TB :  STD_LOGIC;
signal InData :  STD_LOGIC_VECTOR (31 downto 0);
signal DataA, DataB : STD_LOGIC_VECTOR (31 downto 0);
signal RP00,RP01,RP02,RP03,RP04,RP05,RP06,RP07,RP08,RP09,RP10,RP11,RP12,RP13,RP14,RP15,
       RP16,RP17,RP18,RP19,RP20,RP21,RP22,RP23,RP24,RP25,RP26,RP27,RP28,RP29,RP30,RP31,RP32 :STD_LOGIC_VECTOR(31 downto 0);

begin
UUT: Register32_bitSystem port map (DSelect => DSelect, MuxA => MuxA, MuxB => MuxB, Clk => Clk, TD => TD, TA => TA, TB => TB, LEnable => LEnable, InData => InData, DataA => DataA, DataB => DataB,
        RP00 => RP00, RP01 => RP01, RP02 => RP02, RP03 => RP03, RP04 => RP04, RP05 => RP05, RP06 => RP06, RP07 => RP07, RP08 => RP08, RP09 => RP09, RP10 => RP10, RP11 => RP11, RP12 => RP12, RP13 => RP13, RP14 => RP14, RP15 => RP15, RP16 => RP16, RP17 => RP17, RP18 => RP18, RP19 => RP19, RP20 => RP20, RP21 => RP21, RP22 => RP22, RP23 => RP23, RP24 => RP24, RP25 => RP25, RP26 => RP26, RP27 => RP27, RP28 => RP28, RP29 => RP29, RP30 => RP30, RP31 => RP31, RP32 => RP32);

    Clk <= not CLk after 10ns;  
    RegDB_Run : process
    begin
     --first set all the regs to student num
        InData <= x"19304296";
        TD <= '0';
        LEnable <= '1';
        DSelect <= "00000";
        wait for 20ns;
        InData <= x"19304295";
        DSelect <= "00001";
        wait for 20ns;
        InData <= x"19304294";
        DSelect <= "00010";
        wait for 20ns;
        InData <= x"19304293";
        DSelect <= "00011";
        wait for 20ns;
        InData <= x"19304292";
        DSelect <= "00100";
        wait for 20ns;
        InData <= x"19304291";
        DSelect <= "00101";
        wait for 20ns;
        InData <= x"19304290";
        DSelect <= "00110";
        wait for 20ns;
        InData <= x"1930428F";
        DSelect <= "00111";
        wait for 20ns;
        InData <= x"1930428E";
        DSelect <= "01000";
        wait for 20ns;
        InData <= x"1930428D";
        DSelect <= "01001";
        wait for 20ns;
        InData <= x"1930428C";
        DSelect <= "01010";
        wait for 20ns;
        InData <= x"1930428B";
        DSelect <= "01011";
        wait for 20ns;
        InData <= x"1930428A";
        DSelect <= "01100";
        wait for 20ns;
        InData <= x"19304289";
        DSelect <= "01101";
        wait for 20ns;
        InData <= x"19304288";
        DSelect <= "01110";
        wait for 20ns;
        InData <= x"19304287";
        DSelect <= "01111";
        wait for 20ns;
        InData <= x"19304286";
        DSelect <= "10000";
        wait for 20ns;
        InData <= x"19304285";
        DSelect <= "10001";
        wait for 20ns;
        InData <= x"19304284";
        DSelect <= "10010";
        wait for 20ns;
        InData <= x"19304283";
        DSelect <= "10011";
        wait for 20ns;
        InData <= x"19304282";
        DSelect <= "10100";
        wait for 20ns;
        InData <= x"19304281";
        DSelect <= "10101";
        wait for 20ns;
        InData <= x"19304280";
        DSelect <= "10110";
        wait for 20ns; 
        InData <= x"1930427F";
        DSelect <= "10111";
        wait for 20ns;
        InData <= x"1930427E";
        DSelect <= "11000";
        wait for 20ns;
        InData <= x"1930427D";
        DSelect <= "11001";
        wait for 20ns;
        InData <= x"1930427C";
        DSelect <= "11010";
        wait for 20ns;
        InData <= x"1930427B";
        DSelect <= "11011";
        wait for 20ns;
        InData <= x"1930427A";
        DSelect <= "11100";
        wait for 20ns;
        InData <= x"19304279";
        DSelect <= "11101";
        wait for 20ns;
        InData <= x"19304278";
        DSelect <= "11110";
        wait for 20ns;
        InData <= x"19304277";
        DSelect <= "11111";
        wait for 20ns;
        TD <= '1';
        InData <= x"19304276";
        wait for 20ns;
    --now try to read the stuff from the multiplexers
        LEnable <= '0';
        TA <= '0';
        TB <= '0';
        MuxA <= "00000";
        MuxB <= "00000";
        wait for 20ns;
    
        MuxA <= "00001";
        MuxB <= "00001";
        wait for 20ns;
    
        MuxA <= "00010";
        MuxB <= "00010";
        wait for 20ns;
    
        MuxA <= "00011";
        MuxB <= "00011";
        wait for 20ns;
    
        MuxA <= "00100";
        MuxB <= "00100";
        wait for 20ns;
    
        MuxA <= "00101";
        MuxB <= "00101";
        wait for 20ns;
    
        MuxA <= "00110";
        MuxB <= "00110";
        wait for 20ns;
    
        MuxA <= "00111";
        MuxB <= "00111";
        wait for 20ns;
    
        MuxA <= "01000";
        MuxB <= "01000";
        wait for 20ns;
    
        MuxA <= "01001";
        MuxB <= "01001";
        wait for 20ns;
    
        MuxA <= "01010";
        MuxB <= "01010";
        wait for 20ns;
    
        MuxA <= "01011";
        MuxB <= "01011";
        wait for 20ns;
    
        MuxA <= "01100";
        MuxB <= "01100";
        wait for 20ns;
    
        MuxA <= "01101";
        MuxB <= "01101";
        wait for 20ns;
    
        MuxA <= "01110";
        MuxB <= "01110";
        wait for 20ns;
    
        MuxA <= "01111";
        MuxB <= "01111";
        wait for 20ns;
    
        MuxA <= "10000";
        MuxB <= "10000";
        wait for 20ns;
    
        MuxA <= "10001";
        MuxB <= "10001";
        wait for 20ns;
    
        MuxA <= "10010";
        MuxB <= "10010";
        wait for 20ns;
    
        MuxA <= "10011";
        MuxB <= "10011";
        wait for 20ns;
        
        MuxA <= "10100";
        MuxB <= "10100";
        wait for 20ns;
    
        MuxA <= "10101";
        MuxB <= "10101";
        wait for 20ns;
    
        MuxA <= "10110";
        MuxB <= "10110";
        wait for 20ns;
    
        MuxA <= "10111";
        MuxB <= "10111";
        wait for 20ns;
    
        MuxA <= "11000";
        MuxB <= "11000";
        wait for 20ns;
    
        MuxA <= "11001";
        MuxB <= "11001";
        wait for 20ns;
    
        MuxA <= "11010";
        MuxB <= "11010";
        wait for 20ns;
    
        MuxA <= "11011";
        MuxB <= "11011";
        wait for 20ns;
    
        MuxA <= "11100";
        MuxB <= "11100";
        wait for 20ns;
    
        MuxA <= "11101";
        MuxB <= "11101";
        wait for 20ns;
    
        MuxA <= "11110";
        MuxB <= "11110";
        wait for 20ns;
    
        MuxA <= "11111";
        MuxB <= "11111";
        wait for 20ns;
        
        TA <= '1';
        TB <= '1';
        wait for 20ns;
        
    end process;
end Behavioral;
