library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Shifter32 is
    Port(
            DataIn : in STD_LOGIC_VECTOR(31 downto 0);
            S : in STD_LOGIC_VECTOR(1 downto 0);
            DataOut : out STD_LOGIC_VECTOR(31 downto 0));         
end Shifter32;

architecture Behavioral of Shifter32 is

    component MUX3_2_1
       Port(Left, Same, Right : in STD_LOGIC;
       S : in STD_LOGIC_VECTOR(1 downto 0);
       BitOut : out STD_LOGIC);
    end component;

begin
Multi3To1_0 : MUX3_2_1 port map (Left => DataIn(1), Same => DataIn(0), Right => '0', S => S, BitOut => DataOut(0));
Multi3To1_1 : MUX3_2_1 port map (Left => DataIn(2), Same => DataIn(1), Right => DataIn(0), S => S, BitOut => DataOut(1));
Multi3To1_2 : MUX3_2_1 port map (Left => DataIn(3), Same => DataIn(2), Right => DataIn(1), S => S, BitOut => DataOut(2));
Multi3To1_3 : MUX3_2_1 port map (Left => DataIn(4), Same => DataIn(3), Right => DataIn(2), S => S, BitOut => DataOut(3));
Multi3To1_4 : MUX3_2_1 port map (Left => DataIn(5), Same => DataIn(4), Right => DataIn(3), S => S, BitOut => DataOut(4));
Multi3To1_5 : MUX3_2_1 port map (Left => DataIn(6), Same => DataIn(5), Right => DataIn(4), S => S, BitOut => DataOut(5));
Multi3To1_6 : MUX3_2_1 port map (Left => DataIn(7), Same => DataIn(6), Right => DataIn(5), S => S, BitOut => DataOut(6));
Multi3To1_7 : MUX3_2_1 port map (Left => DataIn(8), Same => DataIn(7), Right => DataIn(6), S => S, BitOut => DataOut(7));
Multi3To1_8 : MUX3_2_1 port map (Left => DataIn(9), Same => DataIn(8), Right => DataIn(7), S => S, BitOut => DataOut(8));
Multi3To1_9 : MUX3_2_1 port map (Left => DataIn(10), Same => DataIn(9), Right => DataIn(8), S => S, BitOut => DataOut(9));
Multi3To1_10 : MUX3_2_1 port map (Left => DataIn(11), Same => DataIn(10), Right => DataIn(9), S => S, BitOut => DataOut(10));
Multi3To1_11 : MUX3_2_1 port map (Left => DataIn(12), Same => DataIn(11), Right => DataIn(10), S => S, BitOut => DataOut(11));
Multi3To1_12 : MUX3_2_1 port map (Left => DataIn(13), Same => DataIn(12), Right => DataIn(11), S => S, BitOut => DataOut(12));
Multi3To1_13 : MUX3_2_1 port map (Left => DataIn(14), Same => DataIn(13), Right => DataIn(12), S => S, BitOut => DataOut(13));
Multi3To1_14 : MUX3_2_1 port map (Left => DataIn(15), Same => DataIn(14), Right => DataIn(13), S => S, BitOut => DataOut(14));
Multi3To1_15 : MUX3_2_1 port map (Left => DataIn(16), Same => DataIn(15), Right => DataIn(14), S => S, BitOut => DataOut(15));
Multi3To1_16 : MUX3_2_1 port map (Left => DataIn(17), Same => DataIn(16), Right => DataIn(15), S => S, BitOut => DataOut(16));
Multi3To1_17 : MUX3_2_1 port map (Left => DataIn(18), Same => DataIn(17), Right => DataIn(16), S => S, BitOut => DataOut(17));
Multi3To1_18 : MUX3_2_1 port map (Left => DataIn(19), Same => DataIn(18), Right => DataIn(17), S => S, BitOut => DataOut(18));
Multi3To1_19 : MUX3_2_1 port map (Left => DataIn(20), Same => DataIn(19), Right => DataIn(18), S => S, BitOut => DataOut(19));
Multi3To1_20 : MUX3_2_1 port map (Left => DataIn(21), Same => DataIn(20), Right => DataIn(19), S => S, BitOut => DataOut(20));
Multi3To1_21 : MUX3_2_1 port map (Left => DataIn(22), Same => DataIn(21), Right => DataIn(20), S => S, BitOut => DataOut(21));
Multi3To1_22 : MUX3_2_1 port map (Left => DataIn(23), Same => DataIn(22), Right => DataIn(21), S => S, BitOut => DataOut(22));
Multi3To1_23 : MUX3_2_1 port map (Left => DataIn(24), Same => DataIn(23), Right => DataIn(22), S => S, BitOut => DataOut(23));
Multi3To1_24 : MUX3_2_1 port map (Left => DataIn(25), Same => DataIn(24), Right => DataIn(23), S => S, BitOut => DataOut(24));
Multi3To1_25 : MUX3_2_1 port map (Left => DataIn(26), Same => DataIn(25), Right => DataIn(24), S => S, BitOut => DataOut(25));
Multi3To1_26 : MUX3_2_1 port map (Left => DataIn(27), Same => DataIn(26), Right => DataIn(25), S => S, BitOut => DataOut(26));
Multi3To1_27 : MUX3_2_1 port map (Left => DataIn(28), Same => DataIn(27), Right => DataIn(26), S => S, BitOut => DataOut(27));
Multi3To1_28 : MUX3_2_1 port map (Left => DataIn(29), Same => DataIn(28), Right => DataIn(27), S => S, BitOut => DataOut(28));
Multi3To1_29 : MUX3_2_1 port map (Left => DataIn(30), Same => DataIn(29), Right => DataIn(28), S => S, BitOut => DataOut(29));
Multi3To1_30 : MUX3_2_1 port map (Left => DataIn(31), Same => DataIn(30), Right => DataIn(29), S => S, BitOut => DataOut(30));
Multi3To1_31 : MUX3_2_1 port map (Left => '0', Same => DataIn(31), Right => DataIn(30), S => S, BitOut => DataOut(31));
end Behavioral;