----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:20 10/10/2017 
-- Design Name: 
-- Module Name:    Mors_Detector - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mors_Detector is
port(

CH_Ready:in std_logic;

MORS3:in integer range 0 to 255	:=65;

MORS2:in integer range 0 to 255	:=66;
 
MORS1:in integer range 0 to 255	:=67;

m11,m12,m13,m14,m15,m21,m22,
m23,m24,m25,m31,m32,m33,m34,m35	:out integer range 0 to 3

);
end Mors_Detector;

architecture Behavioral of Mors_Detector is

begin
		
	process(CH_Ready)
		
	begin
		
		if(rising_edge(CH_Ready))then
		
			if(MORS1=65)then--A
				
				m11<=1;
				
				m12<=3;
				
				m13<=0;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=66)then--B
				
				m11<=3;
				
				m12<=1;
				
				m13<=1;
				
				m14<=1;
				
				m15<=0;
				
			elsif(MORS1=67)then--C
				
				m11<=3;
				
				m12<=1;
				
				m13<=3;
				
				m14<=1;
				
				m15<=0;
				
			elsif(MORS1=68)then--D
				
				m11<=3;
				
				m12<=1;
				
				m13<=1;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=69)then--E
				m11<=1;
				
				m12<=0;
				
				m13<=0;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=70)then--F
				m11<=1;
				
				m12<=1;
				
				m13<=3;
				
				m14<=1;
				
				m15<=0;
				
			elsif(MORS1=71)then--G
				m11<=3;
				
				m12<=3;
				
				m13<=1;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=72)then--H
				m11<=1;
				
				m12<=1;
				
				m13<=1;
				
				m14<=1;
				
				m15<=0;
				
			elsif(MORS1=73)then--I
				
				m11<=1;
				
				m12<=1;
				
				m13<=0;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=74)then--j
				
				m11<=1;
				
				m12<=3;
				
				m13<=3;
				
				m14<=3;
				
				m15<=0;
				
			elsif(MORS1=75)then--K
				
				m11<=3;
				
				m12<=1;
				
				m13<=1;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=76)then--L
				
				m11<=1;
				
				m12<=3;
				
				m13<=1;
				
				m14<=1;
				
				m15<=0;
				
			elsif(MORS1=77)then--M
				
				m11<=3;
				
				m12<=3;
				
				m13<=0;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=78)then--N
				
				m11<=3;
				
				m12<=1;
				
				m13<=0;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=79)then--O
				
				m11<=3;
				
				m12<=3;
				
				m13<=3;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=80)then--P
				
				m11<=1;
				
				m12<=3;
				
				m13<=3;
				
				m14<=1;
				
				m15<=0;
				
			elsif(MORS1=81)then--Q
				
				m11<=3;
				
				m12<=3;
				
				m13<=1;
				
				m14<=3;
				
				m15<=0;
				
			elsif(MORS1=82)then--R
				
				m11<=1;
				
				m12<=3;
				
				m13<=1;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=83)then--S
				
				m11<=1;
				
				m12<=1;
				
				m13<=1;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=84)then--T
				
				m11<=3;
				
				m12<=0;
				
				m13<=0;
				
				m14<=0;
				
				m15<=0;
						
			elsif(MORS1=85)then--U
				
				m11<=1;
				
				m12<=1;
				
				m13<=3;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=86)then--V
				
				m11<=1;
				
				m12<=1;
				
				m13<=1;
				
				m14<=3;
				
				m15<=0;
				
			elsif(MORS1=87)then--W
				
				m11<=1;
				
				m12<=3;
				
				m13<=3;
				
				m14<=0;
				
				m15<=0;
				
			elsif(MORS1=88)then--X
				
				m11<=3;
				
				m12<=1;
				
				m13<=1;
				
				m14<=3;
				
				m15<=0;
				
			elsif(MORS1=89)then--Y
				
				m11<=3;
				
				m12<=1;
				
				m13<=3;
				
				m14<=3;
				
				m15<=0;
				
			elsif(MORS1=90)then--Z
				
				m11<=3;
				
				m12<=3;
				
				m13<=1;
				
				m14<=1;
				
				m15<=0;
				
			elsif(MORS1=48)then--0
				
				m11<=3;
				m12<=3;
				
				m13<=3;
				
				m14<=3;
				
				m15<=3;
						
			elsif(MORS1=49)then--1
				
				m11<=1;
				
				m12<=3;
				
				m13<=3;
				
				m14<=3;
				
				m15<=3;
				
			elsif(MORS1=50)then--2
				
				m11<=1;
				
				m12<=1;
				
				m13<=3;
				
				m14<=3;
				
				m15<=3;
				
			elsif(MORS1=51)then--3
				
				m11<=1;
				
				m12<=1;
				
				m13<=1;
				
				m14<=3;
				
				m15<=3;
				
			elsif(MORS1=52)then--4
				
				m11<=1;
				
				m12<=1;
				
				m13<=1;
				
				m14<=1;
				
				m15<=3;
				
			elsif(MORS1=53)then--5
				m11<=1;
				
				m12<=1;
				
				m13<=1;
				
				m14<=1;
				
				m15<=1;
				
			elsif(MORS1=54)then--6
				
				m11<=3;
				
				m12<=1;
				
				m13<=1;
				
				m14<=1;
				
				m15<=1;
				
			elsif(MORS1=55)then--7
				
				m11<=3;
				
				m12<=3;
				
				m13<=1;
				
				m14<=1;
				
				m15<=1;
				
			elsif(MORS1=56)then--8
				
				m11<=3;
				
				m12<=3;
				
				m13<=3;
				
				m14<=1;
				
				m15<=1;
				
			elsif(MORS1=57)then--9
				
				m11<=3;
				
				m12<=3;
				
				m13<=3;
				
				m14<=3;
				
				m15<=1;
				
			else
				m11<=0;
				
				m12<=0;
				
				m13<=0;
				
				m14<=0;
				
				m15<=0;
				
			end if;
				
				
				--mors2
				
			if(MORS2=65)then--A
				
				m21<=1;
				
				m22<=3;
				
				m23<=0;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=66)then--B
				
				m21<=3;
				
				m22<=1;
				
				m23<=1;
				
				m24<=1;
				
				m25<=0;
				
			elsif(MORS2=67)then--C
				
				m21<=3;
				
				m22<=1;
				
				m23<=3;
				
				m24<=1;
				
				m25<=0;
				
			elsif(MORS2=68)then--D
				
				m21<=3;
				
				m22<=1;
				
				m23<=1;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=69)then--E
				m21<=1;
				
				m22<=0;
				
				m23<=0;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=70)then--F
				m21<=1;
				
				m22<=1;
				
				m23<=3;
				
				m24<=1;
				
				m25<=0;
				
			elsif(MORS2=71)then--G
				m21<=3;
				
				m22<=3;
				
				m23<=1;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=72)then--H
				m21<=1;
				
				m22<=1;
				
				m23<=1;
				
				m24<=1;
				
				m25<=0;
				
			elsif(MORS2=73)then--I
				
				m21<=1;
				
				m22<=1;
				
				m23<=0;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=74)then--j
				
				m21<=1;
				
				m22<=3;
				
				m23<=3;
				
				m24<=3;
				
				m25<=0;
				
			elsif(MORS2=75)then--K
				
				m21<=3;
				
				m22<=1;
				
				m23<=1;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=76)then--L
				
				m21<=1;
				
				m22<=3;
				
				m23<=1;
				
				m24<=1;
				
				m25<=0;
				
			elsif(MORS2=77)then--M
				
				m21<=3;
				
				m22<=3;
				
				m23<=0;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=78)then--N
				
				m21<=3;
				
				m22<=1;
				
				m23<=0;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=79)then--O
				
				m21<=3;
				
				m22<=3;
				
				m23<=3;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=80)then--P
				
				m21<=1;
				
				m22<=3;
				
				m23<=3;
				
				m24<=1;
				
				m25<=0;
				
			elsif(MORS2=81)then--Q
				
				m21<=3;
				
				m22<=3;
				
				m23<=1;
				
				m24<=3;
				
				m25<=0;
				
			elsif(MORS2=82)then--R
				
				m21<=1;
				
				m22<=3;
				
				m23<=1;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=83)then--S
				
				m21<=1;
				
				m22<=1;
				
				m23<=1;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=84)then--T
				
				m21<=3;
				
				m22<=0;
				
				m23<=0;
				
				m24<=0;
				
				m25<=0;
								
			elsif(MORS2=85)then--U
				
				m21<=1;
				
				m22<=1;
				
				m23<=3;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=86)then--V
				
				m21<=1;
				
				m22<=1;
				
				m23<=1;
				
				m24<=3;
				
				m25<=0;
				
			elsif(MORS2=87)then--W
				
				m21<=1;
				
				m22<=3;
				
				m23<=3;
				
				m24<=0;
				
				m25<=0;
				
			elsif(MORS2=88)then--X
				
				m21<=3;
				
				m22<=1;
				
				m23<=1;
				
				m24<=3;
				
				m25<=0;
				
			elsif(MORS2=89)then--Y
				
				m21<=3;
				
				m22<=1;
				
				m23<=3;
				
				m24<=3;
				
				m25<=0;
				
			elsif(MORS2=90)then--Z
				
				m21<=3;
				
				m22<=3;
				
				m23<=1;
				
				m24<=1;
				
				m25<=0;
				
			elsif(MORS2=48)then--0
				
				m21<=3;
				m22<=3;
				
				m23<=3;
				
				m24<=3;
				
				m25<=3;
						
			elsif(MORS2=49)then--1
				
				m21<=1;
				
				m22<=3;
				
				m23<=3;
				
				m24<=3;
				
				m25<=3;
				
			elsif(MORS2=50)then--2
				
				m21<=1;
				
				m22<=1;
				
				m23<=3;
				
				m24<=3;
				
				m25<=3;
				
			elsif(MORS2=51)then--3
				
				m21<=1;
				
				m22<=1;
				
				m23<=1;
				
				m24<=3;
				
				m25<=3;
				
			elsif(MORS2=52)then--4
				
				m21<=1;
				
				m22<=1;
				
				m23<=1;
				
				m24<=1;
				
				m25<=3;
				
			elsif(MORS2=53)then--5
				m21<=1;
				
				m22<=1;
				
				m23<=1;
				
				m24<=1;
				
				m25<=1;
				
			elsif(MORS2=54)then--6
				
				m21<=3;
				
				m22<=1;
				
				m23<=1;
				
				m24<=1;
				
				m25<=1;
				
			elsif(MORS2=55)then--7
				
				m21<=3;
				
				m22<=3;
				
				m23<=1;
				
				m24<=1;
				
				m25<=1;
				
			elsif(MORS2=56)then--8
				
				m21<=3;
				
				m22<=3;
				
				m23<=3;
				
				m24<=1;
				
				m25<=1;
				
			elsif(MORS2=57)then--9
				
				m21<=3;
				
				m22<=3;
				
				m23<=3;
				
				m24<=3;
				
				m25<=1;
				
			else
				m21<=0;
				
				m22<=0;
				
				m23<=0;
				
				m24<=0;
				
				m25<=0;
				
			end if;
				
				
				
				
				--mors 3
			if(MORS3=65)then--A
				
				m31<=1;
				
				m32<=3;
				
				m33<=0;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=66)then--B
				
				m31<=3;
				
				m32<=1;
				
				m33<=1;
				
				m34<=1;
				
				m35<=0;
				
			elsif(MORS3=67)then--C
				
				m31<=3;
				
				m32<=1;
				
				m33<=3;
				
				m34<=1;
				
				m35<=0;
				
			elsif(MORS3=68)then--D
				
				m31<=3;
				
				m32<=1;
				
				m33<=1;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=69)then--E
			
				m31<=1;
				
				m32<=0;
				
				m33<=0;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=70)then--F
				
				m31<=1;
				
				m32<=1;
				
				m33<=3;
				
				m34<=1;
				
				m35<=0;
				
			elsif(MORS3=71)then--G
			
				m31<=3;
				
				m32<=3;
				
				m33<=1;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=72)then--H
				
				m31<=1;
				
				m32<=1;
				
				m33<=1;
				
				m34<=1;
				
				m35<=0;
				
			elsif(MORS3=73)then--I
				
				m31<=1;
				
				m32<=1;
				
				m33<=0;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=74)then--j
				
				m31<=1;
				
				m32<=3;
				
				m33<=3;
				
				m34<=3;
				
				m35<=0;
				
			elsif(MORS3=75)then--K
				
				m31<=3;
				
				m32<=1;
				
				m33<=1;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=76)then--L
				
				m31<=1;
				
				m32<=3;
				
				m33<=1;
				
				m34<=1;
				
				m35<=0;
				
			elsif(MORS3=77)then--M
				
				m31<=3;
				
				m32<=3;
				
				m33<=0;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=78)then--N
				
				m31<=3;
				
				m32<=1;
				
				m33<=0;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=79)then--O
				
				m31<=3;
				
				m32<=3;
				
				m33<=3;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=80)then--P
				
				m31<=1;
				
				m32<=3;
				
				m33<=3;
				
				m34<=1;
				
				m35<=0;
				
			elsif(MORS3=81)then--Q
				
				m31<=3;
				
				m32<=3;
				
				m33<=1;
				
				m34<=3;
				
				m35<=0;
				
			elsif(MORS3=82)then--R
				
				m31<=1;
				
				m32<=3;
				
				m33<=1;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=83)then--S
				
				m31<=1;
				
				m32<=1;
				
				m33<=1;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=84)then--T
				
				m31<=3;
				
				m32<=0;
				
				m33<=0;
				
				m34<=0;
				
				m35<=0;	
				
			elsif(MORS3=85)then--U
				
				m31<=1;
				
				m32<=1;
				
				m33<=3;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=86)then--V
				
				m31<=1;
				
				m32<=1;
				
				m33<=1;
				
				m34<=3;
				
				m35<=0;
				
			elsif(MORS3=87)then--W
				
				m31<=1;
				
				m32<=3;
				
				m33<=3;
				
				m34<=0;
				
				m35<=0;
				
			elsif(MORS3=88)then--X
				
				m31<=3;
				
				m32<=1;
				
				m33<=1;
				
				m34<=3;
				
				m35<=0;
				
			elsif(MORS3=89)then--Y
				
				m31<=3;
				
				m32<=1;
				
				m33<=3;
				
				m34<=3;
				
				m35<=0;
				
			elsif(MORS3=90)then--Z
				
				m31<=3;
				
				m32<=3;
				
				m33<=1;
				
				m34<=1;
				
				m35<=0;
				
			elsif(MORS3=48)then--0
				
				m31<=3;
				
				m32<=3;
				
				m33<=3;
				
				m34<=3;
				
				m35<=3;
								
			elsif(MORS3=49)then--1
				
				m31<=1;
				
				m32<=3;
				
				m33<=3;
				
				m34<=3;
				
				m35<=3;
				
			elsif(MORS3=50)then--2
				
				m31<=1;
				
				m32<=1;
				
				m33<=3;
				
				m34<=3;
				
				m35<=3;
				
			elsif(MORS3=51)then--3
				
				m31<=1;
				
				m32<=1;
				
				m33<=1;
				
				m34<=3;
				
				m35<=3;
				
			elsif(MORS3=52)then--4
				
				m31<=1;
				
				m32<=1;
				
				m33<=1;
				
				m34<=1;
				
				m35<=3;
				
			elsif(MORS3=53)then--5
			
				m31<=1;
				
				m32<=1;
				
				m33<=1;
				
				m34<=1;
				
				m35<=1;
				
			elsif(MORS3=54)then--6
				
				m31<=3;
				
				m32<=1;
				
				m33<=1;
				
				m34<=1;
				
				m35<=1;
				
			elsif(MORS3=55)then--7
				
				m31<=3;
				
				m32<=3;
				
				m33<=1;
				
				m34<=1;
				
				m35<=1;
				
			elsif(MORS3=56)then--8
				
				m31<=3;
				
				m32<=3;
				
				m33<=3;
				
				m34<=1;
				
				m35<=1;
				
			elsif(MORS3=57)then--9
				
				m31<=3;
				
				m32<=3;
				
				m33<=3;
				
				m34<=3;
				
				m35<=1;
				
			else
				m31<=0;
				
				m32<=0;
				
				m33<=0;
				
				m34<=0;
				
				m35<=0;
				
			end if;
		
		
		end if;
		
	end process;
		

end Behavioral;

