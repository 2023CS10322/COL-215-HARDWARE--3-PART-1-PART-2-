----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2024 17:36:52
-- Design Name: 
-- Module Name: multiply - Behavioral
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

entity gf_multiply_constants is
    Port (
        input_byte : in  STD_LOGIC_VECTOR(7 downto 0);
        mult_09 : out STD_LOGIC_VECTOR(7 downto 0);
        mult_0b : out STD_LOGIC_VECTOR(7 downto 0);
        mult_0d : out STD_LOGIC_VECTOR(7 downto 0);
        mult_0e : out STD_LOGIC_VECTOR(7 downto 0)
    );
end gf_multiply_constants;

architecture behavioral of gf_multiply_constants is
    signal x_term   : STD_LOGIC_VECTOR(7 downto 0);
    signal x2_term  : STD_LOGIC_VECTOR(7 downto 0);
    signal x3_term  : STD_LOGIC_VECTOR(7 downto 0);

begin
    -- Calculate x_term (input_byte * 02 in GF(2^8))
    process(input_byte)
        variable shifted : STD_LOGIC_VECTOR(7 downto 0);
    begin
        shifted := input_byte(6 downto 0) & '0';
        if input_byte(7) = '1' then
            x_term <= shifted xor x"1B";
        else
            x_term <= shifted;
        end if;
    end process;

    -- Calculate x2_term (x_term * 02 in GF(2^8))
    process(x_term)
        variable shifted : STD_LOGIC_VECTOR(7 downto 0);
    begin
        shifted := x_term(6 downto 0) & '0';
        if x_term(7) = '1' then
            x2_term <= shifted xor x"1B";
        else
            x2_term <= shifted;
        end if;
    end process;

    -- Calculate x3_term (x2_term * 02 in GF(2^8))
    process(x2_term)
        variable shifted : STD_LOGIC_VECTOR(7 downto 0);
    begin
        shifted := x2_term(6 downto 0) & '0';
        if x2_term(7) = '1' then
            x3_term <= shifted xor x"1B";
        else
            x3_term <= shifted;
        end if;
    end process;

    -- Calculate multiplications with constants in GF(2^8)
    mult_09 <= x3_term xor input_byte;                   -- input_byte * 09
    mult_0b <= x3_term xor x_term xor input_byte;        -- input_byte * 0b
    mult_0d <= x3_term xor x2_term xor input_byte;       -- input_byte * 0d
    mult_0e <= x3_term xor x2_term xor x_term;           -- input_byte * 0e

end behavioral;
