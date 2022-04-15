
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OldRegister32SystemTB is
end OldRegister32SystemTB;

architecture Behavioral of OldRegister32SystemTB is
component OldRegister32System is
    Port( Clk, Src : in STD_LOGIC;
          DestA, MultiS : in STD_LOGIC_VECTOR (4 downto 0);
          InData : in STD_LOGIC_VECTOR (31 downto 0);
          R00, R01, R02, R03, R04, R05, R06, R07, R08, R09 ,R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22 ,R23, R24, R25, R26, R27, R28, R29, R30, R31 : out STD_LOGIC_VECTOR(31 downto 0));
end component;

signal Src : STD_LOGIC;
signal Clk : STD_LOGIC:= '0';
signal DestA, MultiS : STD_LOGIC_VECTOR (4 downto 0);
signal InData : STD_LOGIC_VECTOR (31 downto 0);
signal  R00, R01, R02, R03, R04, R05, R06, R07, R08, R09 ,R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22 ,R23, R24, R25, R26, R27, R28, R29, R30, R31 : STD_LOGIC_VECTOR(31 downto 0);

begin
UUT : OldRegister32System port map (Clk => Clk, Src => Src, DestA => DestA, MultiS => MultiS, InData => InData, R00 => R00, R01 => R01,
            R02 => R02, R03 => R03, R04 => R04, R05 => R05, R06 => R06, R07 => R07, R08 => R08, R09 => R09, R10 => R10,
            R11 => R11,R12 => R12,R13 => R13,R14 => R14,R15 => R15,R16 => R16,R17 => R17,R18 => R18,R19 => R19,R20 => R20,
            R21 => R21,R22 => R22,R23 => R23,R24 => R24,R25 => R25,R26 => R26,R27 => R27, R28 => R28, R29 => R29, R30 => R30, R31 => R31);
    
    Clk <= not CLk after 10ns;  
    RegSys_Run : process
    begin --first set all registers to student num
    InData <= x"19304296";
    Src <= '0';
    DestA <= "00000";
    wait for 20ns;
    InData <= x"19304295";
    DestA <= "00001";
    wait for 20ns;
    InData <= x"19304294";
    DestA <= "00010";
    wait for 20ns;
    InData <= x"19304293";
    DestA <= "00011";
    wait for 20ns;
    InData <= x"19304292";
    DestA <= "00100";
    wait for 20ns;
    InData <= x"19304291";
    DestA <= "00101";
    wait for 20ns;
    InData <= x"19304290";
    DestA <= "00110";
    wait for 20ns;
    InData <= x"1930428F";
    DestA <= "00111";
    wait for 20ns;
    InData <= x"1930428E";
    DestA <= "01000";
    wait for 20ns;
    InData <= x"1930428D";
    DestA <= "01001";
    wait for 20ns;
    InData <= x"1930428C";
    DestA <= "01010";
    wait for 20ns;
    InData <= x"1930428B";
    DestA <= "01011";
    wait for 20ns;
    InData <= x"1930428A";
    DestA <= "01100";
    wait for 20ns;
    InData <= x"19304289";
    DestA <= "01101";
    wait for 20ns;
    InData <= x"19304288";
    DestA <= "01110";
    wait for 20ns;
    InData <= x"19304287";
    DestA <= "01111";
    wait for 20ns;
    InData <= x"19304286";
    DestA <= "10000";
    wait for 20ns;
    InData <= x"19304285";
    DestA <= "10001";
    wait for 20ns;
    InData <= x"19304284";
    DestA <= "10010";
    wait for 20ns;
    InData <= x"19304283";
    DestA <= "10011";
    wait for 20ns;
    InData <= x"19304282";
    DestA <= "10100";
    wait for 20ns;
    InData <= x"19304281";
    DestA <= "10101";
    wait for 20ns;
    InData <= x"19304280";
    DestA <= "10110";
    wait for 20ns; 
    InData <= x"1930427F";
    DestA <= "10111";
    wait for 20ns;
    InData <= x"1930427E";
    DestA <= "11000";
    wait for 20ns;
    InData <= x"1930427D";
    DestA <= "11001";
    wait for 20ns;
    InData <= x"1930427C";
    DestA <= "11010";
    wait for 20ns;
    InData <= x"1930427B";
    DestA <= "11011";
    wait for 20ns;
    InData <= x"1930427A";
    DestA <= "11100";
    wait for 20ns;
    InData <= x"19304279";
    DestA <= "11101";
    wait for 20ns;
    InData <= x"19304278";
    DestA <= "11110";
    wait for 20ns;
    InData <= x"19304277";
    DestA <= "11111";
    MultiS <= "00001";
    wait for 20ns;
    
    --now tranfer stuff from register to register
    Src <= '1';
    DestA <= "00000";
    wait for 20ns; --move r1 to r0
    MultiS <= "00011";
    DestA <= "00010";
    wait for 20ns; --move r3 to r2
    MultiS <= "00101";
    DestA <= "00100";
    wait for 20ns; --move r5 to r4
    MultiS <= "00111";
    DestA <= "00110";
    wait for 20ns; --move r7 to r6
    MultiS <= "01001";
    DestA <= "01000";
    wait for 20ns; --move r9 to r8
    MultiS <= "01011";
    DestA <= "01010";
    wait for 20ns; --move r11 to r10
    MultiS <= "01101";
    DestA <= "01100";
    wait for 20ns; --move r13 to r12
    MultiS <= "01111";
    DestA <= "01110";
    wait for 20ns; --move r15 to r14
    MultiS <= "10001";
    DestA <= "10000";
    wait for 20ns; --move r17 to r16
       MultiS <= "10011";
    DestA <= "10010";
    wait for 20ns; --move r10 to r18
    
    end process;
end Behavioral;
