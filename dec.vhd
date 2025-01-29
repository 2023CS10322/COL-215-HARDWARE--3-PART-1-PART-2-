----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2024 23:34:21
-- Design Name: 
-- Module Name: dec - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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

entity display is
    Port (
        inp : in std_logic_vector(3 downto 0);
        on_of: in std_logic;
        DISP: out std_logic_vector(6 downto 0)  -- 7-segment display output
    );
end display;

architecture Behavioral of display is
begin
    process(inp, on_of)
    begin
        if on_of = '0' then
            DISP <= "0111111";  -- All segments off
        else
            case inp is
                when "0000" => DISP <= "1000000";  -- '0'
                when "0001" => DISP <= "1111001";  -- '1'
                when "0010" => DISP <= "0100100";  -- '2'
                when "0011" => DISP <= "0110000";  -- '3'
                when "0100" => DISP <= "0011001";  -- '4'
                when "0101" => DISP <= "0010010";  -- '5'
                when "0110" => DISP <= "0000010";  -- '6'
                when "0111" => DISP <= "1111000";  -- '7'
                when "1000" => DISP <= "0000000";  -- '8'
                when "1001" => DISP <= "0010000";  -- '9'
                when "1010" => DISP <= "0001000";  -- 'A'
                when "1011" => DISP <= "0000011";  -- 'b'
                when "1100" => DISP <= "1000110";  -- 'C'
                when "1101" => DISP <= "0100001";  -- 'd'
                when "1110" => DISP <= "0000110";  -- 'E'
                when "1111" => DISP <= "0001110";  -- 'F'
                when others => DISP <= "1111111";  -- All segments off
            end case;
        end if;
    end process;
end Behavioral;
