----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 10:35:15 AM
-- Design Name: 
-- Module Name: invshiftrows - Behavioral
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

entity shift_rows is
    Port (
        data_in  : in  STD_LOGIC_VECTOR(31 downto 0);  -- Input 1 row at a time (32 bits)
        mux_sel  : in  STD_LOGIC_VECTOR(1 downto 0);   -- Selection for the row shift (which row's operation)
        data_out : out STD_LOGIC_VECTOR(31 downto 0)   -- Output the shifted row
    );
end shift_rows;

architecture behavioral of shift_rows is
    -- Intermediate signals for shifted values
    signal row_shifted : STD_LOGIC_VECTOR(31 downto 0);  -- Shifted row signal
begin
    -- Perform shifts based on mux_sel
    with mux_sel select
        row_shifted <= data_in                           when "00",  -- No shift (row 0)
                        data_in(7 downto 0)& data_in(31 downto 8) when "01",  -- Shift left by 1 byte (row 1)
                        data_in(15 downto 0)&data_in(31 downto 16)  when "10",  -- Shift left by 2 bytes (row 2)
                       data_in(23 downto 0) & data_in(31 downto 24)   when "11",  -- Shift left by 3 bytes (row 3)
                       (others => '0')                              when others; -- Default case (shouldn't occur)

    -- Output the shifted row
    data_out <= row_shifted;
end behavioral;