----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:18:58 02/03/2019 
-- Design Name: 
-- Module Name:    main - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
port(
SDI,SCK,SCS	:		in std_logic;
Buzzy			:		out std_logic;
Fi,										--10 MHz input frequency 
GEN			:		in std_logic;  --input Generation Enable
SoundLED,
FOLED,
StatusLED	:		out std_logic; -- Output LED
MORSO_Keying:		out std_logic 
);
end main;


architecture Behavioral of main is

component Keyer is
port(
CLK				  :		in std_logic;	-- CLK period is 1ms  
m11,m12,m13,
m14,m15,m21,
m22,m23,m24,
m25,m31,m32,
m33,m34,m35 	  :		in integer range 0 to 3; --Mors sound options 
keying,FrameStart:		out std_logic:='0'
);
end component;




component Mors_Detector is
port(
CH_Ready		:		in std_logic;
MORS3			:		in integer range 0 to 255:=65;	--Morse First char(default:A)
MORS2			:		in integer range 0 to 255:=66;	--Morse Second char(default:B)
MORS1			:		in integer range 0 to 255:=67;	--Morse Third char(default:C)
m11,m12,m13,
m14,m15,m21,
m22,m23,m24,
m25,m31,m32,
m33,m34,m35	:		out integer range 0 to 3
);
end component;



component SPI_Reciever is
port(
SDI,SCK,SCS	:in 		std_logic;
MORS3			:out 		integer range 0 to 255:=65;
MORS2			:out 		integer range 0 to 255:=66;
MORS1			:out 		integer range 0 to 255:=67;
M1R,M2R,M3R	:out 		std_logic;	--data ready to store in others
Buzzy		   :out 		std_logic
);
end component;


 

signal m11,m12,m13,m14,m15,m21,m22,m23,m24,m25,m31,m32,m33,
m34,m35: integer range 0 to 3 ;
signal MORS3: integer range 0 to 255;
signal MORS2: integer range 0 to 255; 
signal MORS1: integer range 0 to 255;
signal CLK1K:std_logic;
signal sinadd:integer range 0 to 255;
signal PR,MODR,M1R,M2R,M3R,keying,FrameStart,PWMO,FOi: std_logic;
signal LEDCNT0 :integer range 0 to 400000;
signal F1KCNT :integer range 0 to 600000;
begin

--morse code

Mor1:Mors_Detector port map(CH_Ready=>(M1R OR M2R OR M3R),MORS3=>MORS3,MORS2=>MORS2,MORS1=>MORS1,m11=>m11,m12=>m12
,m13=>m13,m14=>m14,m15=>m15,m21=>m21,m22=>m22,m23=>m23,m24=>m24,m25=>m25,m31=>m31,m32=>m32,m33=>m33,
m34=>m34,m35=>m35);

Mor2:Keyer port map(CLK=>CLK1K,m11=>m11,m12=>m12
,m13=>m13,m14=>m14,m15=>m15,m21=>m21,m22=>m22,m23=>m23,m24=>m24,m25=>m25,m31=>m31,m32=>m32,m33=>m33,
m34=>m34,m35=>m35,keying=>keying,FrameStart=>FrameStart);

microrecieve:SPI_Reciever port map(SDI,SCK,SCS,MORS3,MORS2,MORS1,M1R,M2R,M3R,Buzzy);

status_LED:process(Fi)
begin

if(rising_edge(Fi))then

LEDCNT0<=LEDCNT0+1;
if(LEDCNT0>200000)then
StatusLED<='1';

else
	if(LEDCNT0=399999) then
		LEDCNT0<=0;
	end if;
StatusLED<='0';

end if;
end if;
end process;


CLK1K_GEN:process(Fi)
begin

if(rising_edge(Fi))then

F1KCNT<=F1KCNT+1;
if(F1KCNT=4999)then
CLK1K<='1';
end if;
if(F1KCNT=9999)then
F1KCNT<=0;
CLK1K<='0';
end if;
end if;

end process;

end Behavioral;

