library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VZNC is
    Port(V,Z,N,C,FL, Clk : in STD_LOGIC;
         Reset : in STD_LOGIC_VECTOR(3 downto 0);
         NZVC : out STD_LOGIC_VECTOR(3 downto 0));
end VZNC;

architecture Behavioral of VZNC is
component MUX2_1_1
    Port( A, B, S : in STD_LOGIC;
      O : out STD_LOGIC);   
end component;

signal Vt, Zt, Ct, Nt : STD_LOGIC;

begin
MUXV : MUX2_1_1 port map(A => V, B => '0', S => Reset(3), O => Vt);
MUXC : MUX2_1_1 port map(A => C, B => '0', S => Reset(2), O => Ct);
MUXN : MUX2_1_1 port map(A => N, B => '0', S => Reset(1), O => Nt);
MUXZ : MUX2_1_1 port map(A => Z, B => '0', S => Reset(0), O => Zt);
    process(Clk)
    begin
        if(rising_edge(Clk)) then
           if(FL = '1' or not(Reset = "0000") ) then
               if(FL = '1') then
                    NZVC <= N & Z & V & C;
               end if;
               if(Reset(3) = '1') then 
                    NZVC(1) <= '0';
               end if;
              if(Reset(2) = '1') then
                    NZVC(0) <= '0';
               end if;
              if(Reset(1) = '1') then
                     NZVC(3) <= '0';
                end if;
              if(Reset(0) = '1') then
                      NZVC(2) <= '0';
                 end if;
               
          end if;
      end if;
    end process;

end Behavioral;
