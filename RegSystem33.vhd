library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register32_bitSystem is
    Port( DSelect, MuxA, MuxB : in STD_LOGIC_VECTOR (4 downto 0);
          Clk, LEnable, TD, TA, TB : in STD_LOGIC;
          InData : in STD_LOGIC_VECTOR (31 downto 0);
          DataA, DataB : out STD_LOGIC_VECTOR (31 downto 0);
          RP00,RP01,RP02,RP03,RP04,RP05,RP06,RP07,RP08,RP09,RP10,RP11,RP12,RP13,RP14,RP15,
          RP16,RP17,RP18,RP19,RP20,RP21,RP22,RP23,RP24,RP25,RP26,RP27,RP28,RP29,RP30,RP31,RP32 : out STD_LOGIC_VECTOR(31 downto 0));
end Register32_bitSystem;

architecture Behavioral of Register32_bitSystem is
component Decoder5_32
    Port( DestA : in STD_LOGIC_VECTOR (4 downto 0);
          T : in STD_LOGIC;
          DestChoice : out STD_LOGIC_VECTOR (31 downto 0));
end component; 

component MUX32_5_32
    Port(
      R00, R01, R02, R03, R04, R05, R06, R07, R08, R09 ,R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22 ,R23, R24, R25, R26, R27, R28, R29, R30, R31, R32 : in STD_LOGIC_VECTOR(31 downto 0);
      S : in STD_LOGIC_VECTOR (4 downto 0);
      T : in STD_LOGIC;
      DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;

component Register32_bit
    Port( InData : in STD_LOGIC_VECTOR (31 downto 0);
              Load : in STD_LOGIC;
              Clk : in STD_LOGIC;
              OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;
--signals, who doesnt love signals (me)
signal Load, DestChoice : STD_LOGIC_VECTOR(31 downto 0);
signal Load32 : STD_LOGIC;
signal RO00,RO01,RO02,RO03,RO04,RO05,RO06,RO07,RO08,RO09,RO10,RO11,RO12,RO13,RO14,RO15,
       RO16,RO17,RO18,RO19,RO20,RO21,RO22,RO23,RO24,RO25,RO26,RO27,RO28,RO29,RO30,RO31,RO32 : STD_LOGIC_VECTOR(31 downto 0);

begin --ohhh here we go
Decoder : Decoder5_32 port map (DestA => DSelect, T => TD, DestChoice => DestChoice);
Multi32A : MUX32_5_32 port map(R00 => RO00, R01 => RO01, R02 => RO02,R03 => RO03, R04 => RO04, R05 => RO05, R06 => RO06, R07 => RO07,
                    R08 => RO08, R09 => RO09, R10 => RO10, R11 => RO11, R12 => RO12, R13 => RO13, R14 => RO14, R15 => RO15, R16 => RO16,
                    R17 => RO17, R18 => RO18, R19 => RO19, R20 => RO20, R21 => RO21, R22 => RO22, R23 => RO23, R24 => RO24, R25 => RO25,
                    R26 => RO26, R27 => RO27, R28 => RO28, R29 => RO29, R30 => RO30, R31 => RO31, R32 => RO32, S => MuxA, T => TA, DataOut => DataA);
Multi32B : MUX32_5_32 port map(R00 => RO00, R01 => RO01, R02 => RO02,R03 => RO03, R04 => RO04, R05 => RO05, R06 => RO06, R07 => RO07,
                    R08 => RO08, R09 => RO09, R10 => RO10, R11 => RO11, R12 => RO12, R13 => RO13, R14 => RO14, R15 => RO15, R16 => RO16,
                    R17 => RO17, R18 => RO18, R19 => RO19, R20 => RO20, R21 => RO21, R22 => RO22, R23 => RO23, R24 => RO24, R25 => RO25,
                    R26 => RO26, R27 => RO27, R28 => RO28, R29 => RO29, R30 => RO30, R31 => RO31, R32 => RO32, S => MuxB, T => TB, DataOut => DataB);
                                        
Reg_00 : Register32_bit port map (InData => InData, Load => Load(0), Clk => Clk, OutData => RO00);
Reg_01 : Register32_bit port map (InData => InData, Load => Load(1), Clk => Clk, OutData => RO01);
Reg_02 : Register32_bit port map (InData => InData, Load => Load(2), Clk => Clk, OutData => RO02);
Reg_03 : Register32_bit port map (InData => InData, Load => Load(3), Clk => Clk, OutData => RO03);
Reg_04 : Register32_bit port map (InData => InData, Load => Load(4), Clk => Clk, OutData => RO04);
Reg_05 : Register32_bit port map (InData => InData, Load => Load(5), Clk => Clk, OutData => RO05);
Reg_06 : Register32_bit port map (InData => InData, Load => Load(6), Clk => Clk, OutData => RO06);
Reg_07 : Register32_bit port map (InData => InData, Load => Load(7), Clk => Clk, OutData => RO07);
Reg_08 : Register32_bit port map (InData => InData, Load => Load(8), Clk => Clk, OutData => RO08);
Reg_09 : Register32_bit port map (InData => InData, Load => Load(9), Clk => Clk, OutData => RO09);
Reg_10 : Register32_bit port map (InData => InData, Load => Load(10), Clk => Clk, OutData => RO10);
Reg_11 : Register32_bit port map (InData => InData, Load => Load(11), Clk => Clk, OutData => RO11);
Reg_12 : Register32_bit port map (InData => InData, Load => Load(12), Clk => Clk, OutData => RO12);
Reg_13 : Register32_bit port map (InData => InData, Load => Load(13), Clk => Clk, OutData => RO13);
Reg_14 : Register32_bit port map (InData => InData, Load => Load(14), Clk => Clk, OutData => RO14);
Reg_15 : Register32_bit port map (InData => InData, Load => Load(15), Clk => Clk, OutData => RO15);
Reg_16 : Register32_bit port map (InData => InData, Load => Load(16), Clk => Clk, OutData => RO16);
Reg_17 : Register32_bit port map (InData => InData, Load => Load(17), Clk => Clk, OutData => RO17);
Reg_18 : Register32_bit port map (InData => InData, Load => Load(18), Clk => Clk, OutData => RO18);
Reg_19 : Register32_bit port map (InData => InData, Load => Load(19), Clk => Clk, OutData => RO19);
Reg_20 : Register32_bit port map (InData => InData, Load => Load(20), Clk => Clk, OutData => RO20);
Reg_21 : Register32_bit port map (InData => InData, Load => Load(21), Clk => Clk, OutData => RO21);
Reg_22 : Register32_bit port map (InData => InData, Load => Load(22), Clk => Clk, OutData => RO22);
Reg_23 : Register32_bit port map (InData => InData, Load => Load(23), Clk => Clk, OutData => RO23);
Reg_24 : Register32_bit port map (InData => InData, Load => Load(24), Clk => Clk, OutData => RO24);
Reg_25 : Register32_bit port map (InData => InData, Load => Load(25), Clk => Clk, OutData => RO25);
Reg_26 : Register32_bit port map (InData => InData, Load => Load(26), Clk => Clk, OutData => RO26);
Reg_27 : Register32_bit port map (InData => InData, Load => Load(27), Clk => Clk, OutData => RO27);
Reg_28 : Register32_bit port map (InData => InData, Load => Load(28), Clk => Clk, OutData => RO28);
Reg_29 : Register32_bit port map (InData => InData, Load => Load(29), Clk => Clk, OutData => RO29);
Reg_30 : Register32_bit port map (InData => InData, Load => Load(30), Clk => Clk, OutData => RO30);
Reg_31 : Register32_bit port map (InData => InData, Load => Load(31), Clk => Clk, OutData => RO31);
Reg_32 : Register32_bit port map (InData => InData, Load => Load32, Clk => Clk, OutData => RO32);

Load(0) <= DestChoice(0) and LEnable;
Load(1) <= DestChoice(1) and LEnable;
Load(2) <= DestChoice(2) and LEnable;
Load(3) <= DestChoice(3) and LEnable;
Load(4) <= DestChoice(4) and LEnable;
Load(5) <= DestChoice(5) and LEnable;
Load(6) <= DestChoice(6) and LEnable;
Load(7) <= DestChoice(7) and LEnable;
Load(8) <= DestChoice(8) and LEnable;
Load(9) <= DestChoice(9) and LEnable;
Load(10) <= DestChoice(10) and LEnable;
Load(11) <= DestChoice(11) and LEnable;
Load(12) <= DestChoice(12) and LEnable;
Load(13) <= DestChoice(13) and LEnable;
Load(14) <= DestChoice(14) and LEnable;
Load(15) <= DestChoice(15) and LEnable;
Load(16) <= DestChoice(16) and LEnable;
Load(17) <= DestChoice(17) and LEnable;
Load(18) <= DestChoice(18) and LEnable;
Load(19) <= DestChoice(19) and LEnable;
Load(20) <= DestChoice(20) and LEnable;
Load(21) <= DestChoice(21) and LEnable;
Load(22) <= DestChoice(22) and LEnable;
Load(23) <= DestChoice(23) and LEnable;
Load(24) <= DestChoice(24) and LEnable;
Load(25) <= DestChoice(25) and LEnable;
Load(26) <= DestChoice(26) and LEnable;
Load(27) <= DestChoice(27) and LEnable;
Load(28) <= DestChoice(28) and LEnable;
Load(29) <= DestChoice(29) and LEnable;
Load(30) <= DestChoice(30) and LEnable;
Load(31) <= DestChoice(31) and LEnable;
Load32 <= LEnable and not(DestChoice(0) or DestChoice(1) or DestChoice(2) or DestChoice(3) or DestChoice(4) or DestChoice(5) or 
DestChoice(6) or DestChoice(7) or DestChoice(8) or DestChoice(9) or DestChoice(10) or DestChoice(11) or DestChoice(12) or 
DestChoice(13) or DestChoice(14) or DestChoice(15) or DestChoice(16) or DestChoice(17) or DestChoice(18) or DestChoice(19) or 
DestChoice(20) or DestChoice(21) or DestChoice(22) or DestChoice(23) or DestChoice(24) or DestChoice(25) or DestChoice(26) or 
DestChoice(27) or DestChoice(28) or DestChoice(29) or DestChoice(30) or DestChoice(31));

RP00 <= RO00;
RP01 <= RO01;
RP02 <= RO02;
RP03 <= RO03;
RP04 <= RO04;
RP05 <= RO05;
RP06 <= RO06;
RP07 <= RO07;
RP08 <= RO08;
RP09 <= RO09;
RP10 <= RO10;
RP11 <= RO11;
RP12 <= RO12;
RP13 <= RO13;
RP14 <= RO14;
RP15 <= RO15;
RP16 <= RO16;
RP17 <= RO17;
RP18 <= RO18;
RP19 <= RO19;
RP20 <= RO20;
RP21 <= RO21;
RP22 <= RO22;
RP23 <= RO23;
RP24 <= RO24;
RP25 <= RO25;
RP26 <= RO26;
RP27 <= RO27;
RP28 <= RO28;
RP29 <= RO29;
RP30 <= RO30;
RP31 <= RO31;
RP32 <= RO32;

end Behavioral;