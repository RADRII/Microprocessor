library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity OldRegister32System is
    Port( Clk, Src : in STD_LOGIC;
          DestA, MultiS : in STD_LOGIC_VECTOR (4 downto 0);
          InData : in STD_LOGIC_VECTOR (31 downto 0);
          R00, R01, R02, R03, R04, R05, R06, R07, R08, R09 ,R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22 ,R23, R24, R25, R26, R27, R28, R29, R30, R31 : out STD_LOGIC_VECTOR(31 downto 0));
end OldRegister32System;

architecture Behavioral of OldRegister32System is
component OldDecoder5To32
    Port( DestA : in STD_LOGIC_VECTOR (4 downto 0);
          DestChoice : out STD_LOGIC_VECTOR (31 downto 0));
end component; 

component Multiplexer2To32
    Port( S : in STD_LOGIC;
          InData, RData : in STD_LOGIC_VECTOR (31 downto 0);
          DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;
      
component OldMultiplexer32To32 
    Port(
      R00, R01, R02, R03, R04, R05, R06, R07, R08, R09 ,R10, R11, R12, R13, R14, R15, R16, R17, R18, R19, R20, R21, R22 ,R23, R24, R25, R26, R27, R28, R29, R30, R31 : in STD_LOGIC_VECTOR(31 downto 0);
      S : in STD_LOGIC_VECTOR (4 downto 0);
      DataOut : out STD_LOGIC_VECTOR (31 downto 0));
end component;
          
component Register32
    Port( InData : in STD_LOGIC_VECTOR (31 downto 0);
              Load : in STD_LOGIC;
              Clk : in STD_LOGIC;
              OutData : out STD_LOGIC_VECTOR (31 downto 0));
end component;
--god help me
signal MultiToMulti, MultiToReg, enable : STD_LOGIC_VECTOR(31 downto 0);
signal RO00,RO01,RO02,RO03,RO04,RO05,RO06,RO07,RO08,RO09,RO10,RO11,RO12,RO13,RO14,RO15,
       RO16,RO17,RO18,RO19,RO20,RO21,RO22,RO23,RO24,RO25,RO26,RO27,RO28,RO29,RO30,RO31 : STD_LOGIC_VECTOR(31 downto 0);

begin
Decoder : OldDecoder5To32 port map (DestA => DestA, DestChoice => enable);
Multi2 : Multiplexer2To32 port map (S => Src, InData => InData, RData => MultiToMulti, DataOut => MultiToReg);
Multi32 : OldMultiplexer32To32 port map(R00 => RO00, R01 => RO01, R02 => RO02,R03 => RO03, R04 => RO04, R05 => RO05, R06 => RO06, R07 => RO07,
                    R08 => RO08, R09 => RO09, R10 => RO10, R11 => RO11, R12 => RO12, R13 => RO13, R14 => RO14, R15 => RO15, R16 => RO16,
                    R17 => RO17, R18 => RO18, R19 => RO19, R20 => RO20, R21 => RO21, R22 => RO22, R23 => RO23, R24 => RO24, R25 => RO25,
                    R26 => RO26, R27 => RO27, R28 => RO28, R29 => RO29, R30 => RO30, R31 => RO31, S => MultiS, DataOut => MultiToMulti);
Reg_00 : Register32 port map (InData => MultiToReg, Load => enable(0), Clk => Clk, OutData => RO00);
Reg_01 : Register32 port map (InData => MultiToReg, Load => enable(1), Clk => Clk, OutData => RO01);
Reg_02 : Register32 port map (InData => MultiToReg, Load => enable(2), Clk => Clk, OutData => RO02);
Reg_03 : Register32 port map (InData => MultiToReg, Load => enable(3), Clk => Clk, OutData => RO03);
Reg_04 : Register32 port map (InData => MultiToReg, Load => enable(4), Clk => Clk, OutData => RO04);
Reg_05 : Register32 port map (InData => MultiToReg, Load => enable(5), Clk => Clk, OutData => RO05);
Reg_06 : Register32 port map (InData => MultiToReg, Load => enable(6), Clk => Clk, OutData => RO06);
Reg_07 : Register32 port map (InData => MultiToReg, Load => enable(7), Clk => Clk, OutData => RO07);
Reg_08 : Register32 port map (InData => MultiToReg, Load => enable(8), Clk => Clk, OutData => RO08);
Reg_09 : Register32 port map (InData => MultiToReg, Load => enable(9), Clk => Clk, OutData => RO09);
Reg_10 : Register32 port map (InData => MultiToReg, Load => enable(10), Clk => Clk, OutData => RO10);
Reg_11 : Register32 port map (InData => MultiToReg, Load => enable(11), Clk => Clk, OutData => RO11);
Reg_12 : Register32 port map (InData => MultiToReg, Load => enable(12), Clk => Clk, OutData => RO12);
Reg_13 : Register32 port map (InData => MultiToReg, Load => enable(13), Clk => Clk, OutData => RO13);
Reg_14 : Register32 port map (InData => MultiToReg, Load => enable(14), Clk => Clk, OutData => RO14);
Reg_15 : Register32 port map (InData => MultiToReg, Load => enable(15), Clk => Clk, OutData => RO15);
Reg_16 : Register32 port map (InData => MultiToReg, Load => enable(16), Clk => Clk, OutData => RO16);
Reg_17 : Register32 port map (InData => MultiToReg, Load => enable(17), Clk => Clk, OutData => RO17);
Reg_18 : Register32 port map (InData => MultiToReg, Load => enable(18), Clk => Clk, OutData => RO18);
Reg_19 : Register32 port map (InData => MultiToReg, Load => enable(19), Clk => Clk, OutData => RO19);
Reg_20 : Register32 port map (InData => MultiToReg, Load => enable(20), Clk => Clk, OutData => RO20);
Reg_21 : Register32 port map (InData => MultiToReg, Load => enable(21), Clk => Clk, OutData => RO21);
Reg_22 : Register32 port map (InData => MultiToReg, Load => enable(22), Clk => Clk, OutData => RO22);
Reg_23 : Register32 port map (InData => MultiToReg, Load => enable(23), Clk => Clk, OutData => RO23);
Reg_24 : Register32 port map (InData => MultiToReg, Load => enable(24), Clk => Clk, OutData => RO24);
Reg_25 : Register32 port map (InData => MultiToReg, Load => enable(25), Clk => Clk, OutData => RO25);
Reg_26 : Register32 port map (InData => MultiToReg, Load => enable(26), Clk => Clk, OutData => RO26);
Reg_27 : Register32 port map (InData => MultiToReg, Load => enable(27), Clk => Clk, OutData => RO27);
Reg_28 : Register32 port map (InData => MultiToReg, Load => enable(28), Clk => Clk, OutData => RO28);
Reg_29 : Register32 port map (InData => MultiToReg, Load => enable(29), Clk => Clk, OutData => RO29);
Reg_30 : Register32 port map (InData => MultiToReg, Load => enable(30), Clk => Clk, OutData => RO30);
Reg_31 : Register32 port map (InData => MultiToReg, Load => enable(31), Clk => Clk, OutData => RO31);

R00 <= RO00;
R01 <= RO01;
R02 <= RO02;
R03 <= RO03;
R04 <= RO04;
R05 <= RO05;
R06 <= RO06;
R07 <= RO07;
R08 <= RO08;
R09 <= RO09;
R10 <= RO10;
R11 <= RO11;
R12 <= RO12;
R13 <= RO13;
R14 <= RO14;
R15 <= RO15;
R16 <= RO16;
R17 <= RO17;
R18 <= RO18;
R19 <= RO19;
R20 <= RO20;
R21 <= RO21;
R22 <= RO22;
R23 <= RO23;
R24 <= RO24;
R25 <= RO25;
R26 <= RO26;
R27 <= RO27;
R28 <= RO28;
R29 <= RO29;
R30 <= RO30;
R31 <= RO31;

end Behavioral;
