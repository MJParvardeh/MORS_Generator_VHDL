----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:27:09 03/04/2019 
-- Design Name: 
-- Module Name:    SPI_Reciever - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI_Reciever is

port(
SDI,SCK,SCS	:	in std_logic;
MORS3			:	out integer range 0 to 255:=65;
MORS2			:	out integer range 0 to 255:=66;
MORS1			:	out integer range 0 to 255:=67;
M1R,M2R,M3R	:	out std_logic;	--data ready to store in others
Buzzy			:	out std_logic
);


end SPI_Reciever;


architecture Behavioral of SPI_Reciever is

signal d16: std_logic_vector(15 downto 0);
signal d11:std_logic_vector(11 downto 0);
signal d4:std_logic_vector(4 downto 0);
signal d3:std_logic_vector(2 downto 0);
signal d8:std_logic_vector(7 downto 0);
signal M1,M2,M3: integer range 0 to 255;

signal cnt:integer range 0 to 15;


begin
	process(SCK,SCS)
		variable data:std_logic_vector(15 downto 0);
		variable Tgl:std_logic;
		begin
		if(SCS='0')then
				if(rising_edge(SCK))then 
				data(0):=SDI;

				cnt<=cnt+1;
					  if(cnt=15)then
							Buzzy<='0';            
							cnt<=0;
							case(data(15 downto 13))is
								when "001"=>
									MORS1<=conv_integer(data(7 downto 0));
									M1R<='1';
								when "010"=>
									MORS2<=conv_integer(data(7 downto 0));
									M2R<='1';
								when "011"=>
									MORS3<=conv_integer(data(7 downto 0));
									M3R<='1';
								when others=>
									data:="0000000000000000";
									M1R<='0';
									M2R<='0';
									M3R<='0';
							end case;
					  else
							M1R<='0';
							M2R<='0';
							M3R<='0';
							Buzzy<='1';
							data:=data(14 downto 0)&'0' ;
					  end if;
				end if;
		else
		M1R<='0';
		M2R<='0';
		M3R<='0';
		cnt<=0;
		data:="0000000000000000";
		end if;
	end process;
end Behavioral;

