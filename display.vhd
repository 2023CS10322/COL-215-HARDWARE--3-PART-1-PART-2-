----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2024 21:23:09
-- Design Name: 
-- Module Name: display - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Display_unit is
    Port (
        value: in std_logic_vector(7 downto 0);
        DISP: out STD_LOGIC_VECTOR(6 downto 0)
    );
end Display_unit;

architecture Behavioral of Display_unit is
    component decoder
    Port (
        inp: in std_logic_vector(3 downto 0);
        on_of : in std_logic;
        DISP: out STD_LOGIC_VECTOR(6 downto 0)
    );
end component;

    signal a, b, c, d, on_of: std_logic;

begin
    process(value)
    begin
        if (value = "00110000") then
            a <= '0'; b <= '0'; c <= '0'; d <= '0'; on_of <= '1';
        elsif (value = "00110001") then
            a <= '0'; b <= '0'; c <= '0'; d <= '1'; on_of <= '1';
        elsif (value = "00110010") then
            a <= '0'; b <= '0'; c <= '1'; d <= '0'; on_of <= '1';
        elsif (value = "00110011") then
            a <= '0'; b <= '0'; c <= '1'; d <= '1'; on_of <= '1';
        elsif (value = "00110100") then
            a <= '0'; b <= '1'; c <= '0'; d <= '0'; on_of <= '1';
        elsif (value = "00110101") then
            a <= '0'; b <= '1'; c <= '0'; d <= '1'; on_of <= '1';
        elsif (value = "00110110") then
            a <= '0'; b <= '1'; c <= '1'; d <= '0'; on_of <= '1';
        elsif (value = "00110111") then
            a <= '0'; b <= '1'; c <= '1'; d <= '1'; on_of <= '1';
        elsif (value = "00111000") then
            a <= '1'; b <= '0'; c <= '0'; d <= '0'; on_of <= '1';
        elsif (value = "00111001") then
            a <= '1'; b <= '0'; c <= '0'; d <= '1'; on_of <= '1';
        elsif (value= "01000001" or value = "01100001") then
            a <= '1'; b <= '0'; c <= '1'; d <= '0'; on_of <= '1';
        elsif (value = "01000010" or value = "01100010") then
            a <= '1'; b <= '0'; c <= '1'; d <= '1'; on_of <= '1';
        elsif (value = "01000011" or value = "01100011") then
            a <= '1'; b <= '1'; c <= '0'; d <= '0'; on_of <= '1';
        elsif (value = "01000100" or value = "01100100") then
            a <= '1'; b <= '1'; c <= '0'; d <= '1'; on_of <= '1';
        elsif (value = "01000101" or value = "01100101") then
            a <= '1'; b <= '1'; c <= '1'; d <= '0'; on_of <= '1';
        elsif (value = "01000110" or value = "01100110") then
            a <= '1'; b <= '1'; c <= '1'; d <= '1'; on_of <= '1';
        else
            a <= '1'; b <= '1'; c <= '1'; d <= '1'; on_of <= '0';
        end if;
    end process;

    WUT: decoder Port Map (inp(3)=>a, inp(2)=>b, inp(1) => c, inp(0) => d, on_of => on_of,disp=>disp);
end Behavioral;