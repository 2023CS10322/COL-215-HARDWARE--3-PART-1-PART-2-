----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 12:55:35 PM
-- Design Name: 
-- Module Name: x - Behavioral
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

-- Entity for XOR operation
entity aes_xor_8bit is
    Port (
        a : in  STD_LOGIC_VECTOR(7 downto 0);  -- First 8-bit input
        b : in  STD_LOGIC_VECTOR(7 downto 0);  -- Second 8-bit input
        result : out STD_LOGIC_VECTOR(7 downto 0) -- XOR result
    );
end aes_xor_8bit;

architecture behavioral of aes_xor_8bit is
begin
    -- XOR operation
    result <= a xor b;

end behavioral;