----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 12:57:48 PM
-- Design Name: 
-- Module Name: x_tb - Behavioral
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

-- Testbench entity for AES XOR
entity tb_aes_xor_8bit is
end tb_aes_xor_8bit;

architecture behavioral of tb_aes_xor_8bit is
    -- Signal declarations for inputs and output
    signal a : STD_LOGIC_VECTOR(7 downto 0);
    signal b : STD_LOGIC_VECTOR(7 downto 0);
    signal result : STD_LOGIC_VECTOR(7 downto 0);

    -- Component declaration
    component aes_xor_8bit
        Port (
            a : in  STD_LOGIC_VECTOR(7 downto 0);
            b : in  STD_LOGIC_VECTOR(7 downto 0);
            result : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

begin
    -- Instantiate the DUT (Design Under Test)
    DUT: aes_xor_8bit
        Port map (
            a => a,
            b => b,
            result => result
        );

    -- Stimulus process: Apply test cases
    stimulus: process
    begin
        -- Test Case 1: Random 8-bit inputs
        a <= x"57";  -- 01010111 in binary
        b <= x"A9";  -- 10101001 in binary
        wait for 10 ns;
        -- Expected result: 01010111 xor 10101001 = 11111110 (0xFE)

        -- Test Case 2: XOR of all 1's and all 0's
        a <= x"FF";  -- All bits 1
        b <= x"00";  -- All bits 0
        wait for 10 ns;
        -- Expected result: 0xFF xor 0x00 = 0xFF

        -- Test Case 3: Alternating bits
        a <= x"55";  -- 01010101 in binary
        b <= x"AA";  -- 10101010 in binary
        wait for 10 ns;
        -- Expected result: 0x55 xor 0xAA = 0xFF

        -- Test Case 4: XOR of all 1's and itself (identity test)
        a <= x"FF";  -- All bits 1
        b <= x"FF";  -- All bits 1
        wait for 10 ns;
        -- Expected result: 0xFF xor 0xFF = 0x00

        -- Test Case 5: XOR of zero and random value
        a <= x"00";  -- All bits 0
        b <= x"6A";  -- 01101010 in binary
        wait for 10 ns;
        -- Expected result: 0x00 xor 0x6A = 0x6A

        -- Test Case 6: Random pattern 1
        a <= x"3C";  -- 00111100 in binary
        b <= x"9A";  -- 10011010 in binary
        wait for 10 ns;
        -- Expected result: 0x3C xor 0x9A = 0xA6

        -- Test Case 7: Random pattern 2
        a <= x"0F";  -- 00001111 in binary
        b <= x"F0";  -- 11110000 in binary
        wait for 10 ns;
        -- Expected result: 0x0F xor 0xF0 = 0xFF

        -- Test Case 8: Alternating high and low nibbles
        a <= x"F0";  -- 11110000 in binary
        b <= x"0F";  -- 00001111 in binary
        wait for 10 ns;
        -- Expected result: 0xF0 xor 0x0F = 0xFF

        -- Test Case 9: Random pattern 3
        a <= x"77";  -- 01110111 in binary
        b <= x"22";  -- 00100010 in binary
        wait for 10 ns;
        -- Expected result: 0x77 xor 0x22 = 0x55

        -- Test Case 10: XOR of two identical random numbers
        a <= x"6B";  -- 01101011 in binary
        b <= x"6B";  -- 01101011 in binary
        wait for 10 ns;
        -- Expected result: 0x6B xor 0x6B = 0x00

        wait;
    end process;

end behavioral;
