----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 01:16:33 PM
-- Design Name: 
-- Module Name: invsub - Behavioral
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

-- Entity for processing 1 byte (8-bit input)
entity inv_subbytes_8bit is
    Port (
        clk       : in std_logic;                      -- Clock signal
        rst       : in std_logic;                      -- Reset signal
        state_in  : in std_logic_vector(7 downto 0);   -- 8-bit input state (1 byte)
        state_out : out std_logic_vector(7 downto 0)   -- 8-bit output state after InvSubBytes
    );
end inv_subbytes_8bit;

architecture Behavioral of inv_subbytes_8bit is
    -- Signal for substituted output byte
    signal byte_out : std_logic_vector(7 downto 0);

    -- Enable signal for reading from ROM
    signal enable_rom : std_logic := '1';              -- Always enabled

    -- Instantiate the InvS-box ROM component
    component bram_access
        Port (
            clk  : in std_logic;
            rst  : in std_logic;
            ena  : in std_logic;                       -- Enable signal
            addr : in std_logic_vector(7 downto 0);    -- Address for accessing BRAM (input byte)
            dout : out std_logic_vector(7 downto 0)    -- Data read from BRAM (InvS-box output)
        );
    end component;

begin
    -- Instantiate the InvS-box ROM for the input byte
    sbox_rom: bram_access
        port map (
            clk  => clk,
            rst  => rst,
            ena  => enable_rom,                        -- Enable always active
            addr => state_in,                          -- Use input byte as address for InvS-box lookup
            dout => byte_out                           -- Output substituted byte
        );

    -- Output the substituted byte
    state_out <= byte_out;

end Behavioral;
