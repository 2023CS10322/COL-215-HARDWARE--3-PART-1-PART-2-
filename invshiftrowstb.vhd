----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 10:35:39 AM
-- Design Name: 
-- Module Name: invshiftrowstb - Behavioral
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

entity tb_shift_rows is
end tb_shift_rows;

architecture behavioral of tb_shift_rows is
    -- Signals to connect to DUT
    signal data_in  : STD_LOGIC_VECTOR(31 downto 0);
    signal mux_sel  : STD_LOGIC_VECTOR(1 downto 0);
    signal data_out : STD_LOGIC_VECTOR(31 downto 0);

    -- Component declaration of shift_rows (DUT)
    component shift_rows
        Port (
            data_in  : in  STD_LOGIC_VECTOR(31 downto 0);
            mux_sel  : in  STD_LOGIC_VECTOR(1 downto 0);
            data_out : out STD_LOGIC_VECTOR(31 downto 0)
        );
    end component;

begin
    -- Instantiate the DUT
    DUT: shift_rows
        Port map (
            data_in  => data_in,
            mux_sel  => mux_sel,
            data_out => data_out
        );

    -- Test stimulus process
    stimulus: process
    begin
        -- Test Case 1: No shift (mux_sel = "00")
        data_in <= x"12345678";  -- 32-bit row input
        mux_sel <= "00";         -- No shift
        wait for 10 ns;
        -- Expected output: 0x12345678

        -- Test Case 2: Shift left by 1 byte (mux_sel = "01")
        data_in <= x"12345678";
        mux_sel <= "01";         -- Shift by 1 byte
        wait for 10 ns;
        -- Expected output: 0x34567812

        -- Test Case 3: Shift left by 2 bytes (mux_sel = "10")
        data_in <= x"12345678";
        mux_sel <= "10";         -- Shift by 2 bytes
        wait for 10 ns;
        -- Expected output: 0x56781234

        -- Test Case 4: Shift left by 3 bytes (mux_sel = "11")
        data_in <= x"12345678";
        mux_sel <= "11";         -- Shift by 3 bytes
        wait for 10 ns;
        -- Expected output: 0x78123456

        -- Test Case 5: Random input (no shift)
        data_in <= x"89ABCDEF";  -- New input pattern
        mux_sel <= "00";         -- No shift
        wait for 10 ns;
        -- Expected output: 0x89ABCDEF

        -- Test Case 6: Random input (shift by 1 byte)
        data_in <= x"89ABCDEF";
        mux_sel <= "01";         -- Shift by 1 byte
        wait for 10 ns;
        -- Expected output: 0xABCDEF89

        -- Test Case 7: Random input (shift by 2 bytes)
        data_in <= x"89ABCDEF";
        mux_sel <= "10";         -- Shift by 2 bytes
        wait for 10 ns;
        -- Expected output: 0xCDEF89AB

        -- Test Case 8: Random input (shift by 3 bytes)
        data_in <= x"89ABCDEF";
        mux_sel <= "11";         -- Shift by 3 bytes
        wait for 10 ns;
        -- Expected output: 0xEF89ABCD

        wait;
    end process;
end behavioral;