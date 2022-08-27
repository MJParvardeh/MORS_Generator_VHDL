----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:59:51 10/04/2017 
-- Design Name: 
-- Module Name:    Keyer - Behavioral 
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

entity Keyer is

port(

CLK:in std_logic;

-- in CLK period is 1ms  from UP

m11,m12,m13,m14,
m15,m21,m22,m23,
m24,m25,m31,m32,
m33,m34,m35			:		in integer range 0 to 3;
keying,FrameStart : 		out std_logic:='0'

);

end Keyer;



architecture Behavioral of Keyer is

signal cnt1			:		integer range 0 to 755; 
signal timercnt	:		integer range 0 to 9999;
signal chcnt		:		integer range 0 to 3;

type state is (
reset,s11,s12,s13,
s14,s15,s16,s17,
s18,s19,s21,s22,
s23,s24,s25,s31,
s32,s33,s34,s35
);

signal current		:		state:=reset;
signal ch3dis		:		std_logic;
signal send			:		std_logic;

begin

timer	:	process(CLK)

begin
	if(rising_edge(CLK))then
		timercnt<=timercnt+1;
		if(timercnt=0)then
			send<='0';
		elsif(timercnt=9998)then
			timercnt<=0; 
			send<='1';
		end if;
	end if;
end process;


mors	:	process(CLK,send)

begin
	if(rising_edge(CLK))then
		case current is
			when reset=>
				cnt1<=0;
				if(send='1')then
					FrameStart<='1';
					current<=s11;
				else
					current<=reset;
				end if;
			when s11=>
				if(m11=1)then
					if(cnt1<125)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s11;
					elsif(cnt1<250)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s11;
					else
						current<=s12;
						cnt1<=0;
					end if;

				elsif(m11=3)then
					if(cnt1<375)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s11;
					elsif(cnt1<500)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s11;
					else
						cnt1<=0;
						current<=s12;
					end if;
				else
					current<=s12;
					cnt1<=0;
				end if;

			when s12=>
				if(m12=1)then
					if(cnt1<125)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s12;
					elsif(cnt1<250)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s12;
					else
						current<=s13;
						cnt1<=0;
					end if;
				elsif(m12=3)then
					if(cnt1<375)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s12;
					elsif(cnt1<500)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s12;
					else
						current<=s13;
						cnt1<=0;
					end if;
				else
					current<=s13;
					cnt1<=0;
				end if;
			when s13=>
				if(m13=1)then
					if(cnt1<125)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s13;
					elsif(cnt1<250)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s13;
					else
						current<=s14;
						cnt1<=0;
					end if;
				elsif(m13=3)then
					if(cnt1<375)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s13;
					elsif(cnt1<500)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s13;
					else
						current<=s14;
						cnt1<=0;
					end if;
				else
					current<=s14;
					cnt1<=0;
				end if;
			when s14=>
				if(m14=1)then
					if(cnt1<125)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s14;
					elsif(cnt1<250)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s14;
					else
						current<=s15;
						cnt1<=0;
					end if;
				elsif(m14=3)then
					if(cnt1<375)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s14;
					elsif(cnt1<500)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s14;
					else
						current<=s15;
						cnt1<=0;
					end if;
				else
					current<=s15;
					cnt1<=0;
				end if;
			when s15=>
				if(m15=1)then
					if(cnt1<125)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s15;
					elsif(cnt1<500)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s15;
					else
						current<=s21;
						cnt1<=0;
					end if;
				elsif(m15=0)then
					if(cnt1<247)then
						cnt1<=cnt1+1;
						current<=s15;
					else
						cnt1<=0;
						current<=s21;
					end if;
				elsif(m15=3)then
					if(cnt1<375)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s15;
					elsif(cnt1<749)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s15;
					else
						current<=s21;
						cnt1<=0;
					end if;
				else
					current<=s21;
					cnt1<=0;
				end if;
			when s21=>
				if(m21=1)then
					if(cnt1<125)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s21;
					elsif(cnt1<250)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s21;
					else
						current<=s22;
						cnt1<=0;
					end if;
				elsif(m21=3)then
					if(cnt1<375)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s21;
					elsif(cnt1<500)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s21;
					else
						current<=s22;
						cnt1<=0;
					end if;
				else
					current<=s22;
					cnt1<=0;
				end if;
			when s22=>
				if(m22=1)then
					if(cnt1<125)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s22;
					elsif(cnt1<250)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s22;
					else
						current<=s23;
						cnt1<=0;
					end if;				
				elsif(m22=3)then		
					if(cnt1<375)then
						cnt1<=cnt1+1;
						keying<='1';
						current<=s22;
					elsif(cnt1<500)then
						cnt1<=cnt1+1;
						keying<='0';
						current<=s22;
					else
						current<=s23;
						cnt1<=0;
					end if;		
				else
					current<=s23;
					cnt1<=0;
				end if;
		when s23=>
			if(m23=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s23;
				elsif(cnt1<250)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s23;
				else
					current<=s24;
					cnt1<=0;
				end if;
			elsif(m23=3)then
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s23;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s23;
				else
					current<=s24;
					cnt1<=0;
				end if;
			else
				current<=s24;
				cnt1<=0;
			end if;

		when s24=>
			if(m24=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s24;
				elsif(cnt1<250)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s24;
				else
					current<=s25;
					cnt1<=0;
				end if;
			elsif(m24=3)then
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s24;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s24;
				else
					current<=s25;
					cnt1<=0;
				end if;
			else
				current<=s25;
				cnt1<=0;
			end if;
		
		when s25=>
			if(m25=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s25;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s25;
				else
					current<=s31;
					cnt1<=0;
				end if;
			elsif(m25=0)then
				if(cnt1<247)then
					cnt1<=cnt1+1;
					current<=s25;
				else
					cnt1<=0;
					current<=s31;
				end if;
			elsif(m25=3)then
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s25;
				elsif(cnt1<750)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s25;
				else
					current<=s31;
					cnt1<=0;
				end if;
			else
				current<=s31;
				cnt1<=0;
			end if;
			
		when s31=>
			if(m31=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s31;
				elsif(cnt1<250)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s31;
				else
					current<=s32;
					cnt1<=0;
				end if;
			elsif(m31=3)then
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s31;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s31;
				else
					current<=s32;
					cnt1<=0;
				end if;
			else
				current<=s32;
				cnt1<=0;
			end if;
			
		when s32=>
			if(m32=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s32;
				elsif(cnt1<250)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s32;
				else
					current<=s33;
					cnt1<=0;
				end if;
			elsif(m32=3)then
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s32;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s32;
				else
					current<=s33;
					cnt1<=0;
				end if;
			else
				current<=s33;
				cnt1<=0;
			end if;
			
		when s33=>
			if(m33=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s33;
				elsif(cnt1<250)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s33;
				else
					current<=s34;
					cnt1<=0;
				end if;
			elsif(m33=3)then
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s33;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s33;
				else
					current<=s34;
					cnt1<=0;
				end if;
			else
				current<=s34;
				cnt1<=0;
			end if;
			
		when s34=>
			if(m34=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s34;
				elsif(cnt1<250)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s34;
				else
					current<=s35;
					cnt1<=0;
				end if;
			elsif(m34=3)then
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s34;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s34;
				else
					current<=s35;
					cnt1<=0;
				end if;
			else
				current<=s35;
				cnt1<=0;
			end if;
		
		when s35=>
			if(m35=1)then
				if(cnt1<125)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s35;
				elsif(cnt1<500)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s35;
				else
					current<=reset;
					FrameStart<='0';
				end if;
			elsif(m35=0)then
				if(cnt1<247)then
					cnt1<=cnt1+1;
					current<=s35;
				else
					cnt1<=0;
					current<=reset;
					FrameStart<='0';
				end if;	
			elsif(m35=3)then	
				if(cnt1<375)then
					cnt1<=cnt1+1;
					keying<='1';
					current<=s35;
				elsif(cnt1<750)then
					cnt1<=cnt1+1;
					keying<='0';
					current<=s35;
				else
					current<=reset;
					FrameStart<='0';
				end if;
			else
				current<=reset;
				FrameStart<='0';	
			end if;

		when others=>
		
		end case;	 
	end if;
end process;


end Behavioral;

