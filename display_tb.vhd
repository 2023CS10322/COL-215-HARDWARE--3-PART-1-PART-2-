----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.10.2024 21:25:44
-- Design Name: 
-- Module Name: display_tb - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity tb_Display_unit is
-- Test bench has no ports
end tb_Display_unit;

architecture Behavioral of tb_Display_unit is

    -- Component declaration for Display_unit
    component Display_unit
        Port (
            value: in std_logic_vector(7 downto 0);  -- 8-bit input (ASCII values)
            DISP: out std_logic_vector(6 downto 0)   -- 7-segment display output
        );
    end component;

    -- Test signals
    signal value_tb: std_logic_vector(7 downto 0);  -- Testbench input signal
    signal DISP_tb: std_logic_vector(6 downto 0);   -- Testbench output signal

begin

    -- Instantiate the Display_unit for testing
    DUT: Display_unit
        port map (
            value => value_tb,
            DISP => DISP_tb
        );

    -- Test process
    process
    begin
        -- Test ASCII '0' to '9'
        value_tb <= "00110000";  -- '0'
        wait for 10 ns;
        value_tb <= "00110001";  -- '1'
        wait for 10 ns;
        value_tb <= "00110010";  -- '2'
        wait for 10 ns;
        value_tb <= "00110011";  -- '3'
        wait for 10 ns;
        value_tb <= "00110100";  -- '4'
        wait for 10 ns;
        value_tb <= "00110101";  -- '5'
        wait for 10 ns;
        value_tb <= "00110110";  -- '6'
        wait for 10 ns;
        value_tb <= "00110111";  -- '7'
        wait for 10 ns;
        value_tb <= "00111000";  -- '8'
        wait for 10 ns;
        value_tb <= "00111001";  -- '9'
        wait for 10 ns;

        -- Test ASCII 'A' to 'F'
        value_tb <= "01000001";  -- 'A'
        wait for 10 ns;
        value_tb <= "01000010";  -- 'B'
        wait for 10 ns;
        value_tb <= "01000011";  -- 'C'
        wait for 10 ns;
        value_tb <= "01000100";  -- 'D'
        wait for 10 ns;
        value_tb <= "01000101";  -- 'E'
        wait for 10 ns;
        value_tb <= "01000110";  -- 'F'
        wait for 10 ns;

        -- Test ASCII 'a' to 'f' (lowercase handling)
        value_tb <= "01100001";  -- 'a'
        wait for 10 ns;
        value_tb <= "01100010";  -- 'b'
        wait for 10 ns;
        value_tb <= "01100011";  -- 'c'
        wait for 10 ns;
        value_tb <= "01100100";  -- 'd'
        wait for 10 ns;
        value_tb <= "01100101";  -- 'e'
        wait for 10 ns;
        value_tb <= "01100110";  -- 'f'
        wait for 10 ns;

        -- Invalid ASCII value: expect all segments off
        value_tb <= "01111111";  -- Invalid character
        wait for 10 ns;

        -- End simulation
        wait;
    end process;

end Behavioral;
