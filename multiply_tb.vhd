----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.10.2024 17:37:55
-- Design Name: 
-- Module Name: multiply_tb - Behavioral
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


entity testbench is
end testbench;

architecture behavioral of testbench is

    -- Component declaration for the tested entity
    component gf_multiply_constants
        Port (
            input_byte : in  STD_LOGIC_VECTOR(7 downto 0);
            mult_09    : out STD_LOGIC_VECTOR(7 downto 0);
            mult_0b    : out STD_LOGIC_VECTOR(7 downto 0);
            mult_0d    : out STD_LOGIC_VECTOR(7 downto 0);
            mult_0e    : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    -- Testbench signals to connect to the DUT (Device Under Test)
    signal input_byte : STD_LOGIC_VECTOR(7 downto 0);
    signal mult_09    : STD_LOGIC_VECTOR(7 downto 0);
    signal mult_0b    : STD_LOGIC_VECTOR(7 downto 0);
    signal mult_0d    : STD_LOGIC_VECTOR(7 downto 0);
    signal mult_0e    : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: gf_multiply_constants
        Port map (
            input_byte => input_byte,
            mult_09    => mult_09,
            mult_0b    => mult_0b,
            mult_0d    => mult_0d,
            mult_0e    => mult_0e
        );

    -- Test process
    process
    begin
        -- Test case 1: Input byte = 0x57
        input_byte <= x"57";
        wait for 100 ns;

        -- Test case 2: Input byte = 0x83
        input_byte <= x"83";
        wait for 100 ns;

        -- Test case 3: Input byte = 0x1F
        input_byte <= x"1F";
        wait for 100 ns;

        -- Test case 4: Input byte = 0xFF
        input_byte <= x"FF";
        wait for 100 ns;

        -- Test case 5: Input byte = 0x00 (edge case)
        input_byte <= x"00";
        wait for 100 ns;

        -- Test case 6: Input byte = 0xA3
        input_byte <= x"A3";
        wait for 100 ns;

        -- Simulation end
        wait;
    end process;

end behavioral;
