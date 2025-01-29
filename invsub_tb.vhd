----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/25/2024 01:17:14 PM
-- Design Name: 
-- Module Name: invsub_tb - Behavioral
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

entity tb_inv_subbytes_8bit is
-- Testbench has no ports
end tb_inv_subbytes_8bit;

architecture Behavioral of tb_inv_subbytes_8bit is
    -- Component Declaration for the Unit Under Test (UUT)
    component inv_subbytes_8bit
        Port (
            clk       : in std_logic;
            rst       : in std_logic;
            state_in  : in std_logic_vector(7 downto 0);
            state_out : out std_logic_vector(7 downto 0)
        );
    end component;

    -- Signals for UUT connections
    signal clk_tb       : std_logic := '0';
    signal rst_tb       : std_logic := '0';
    signal state_in_tb  : std_logic_vector(7 downto 0) := (others => '0');
    signal state_out_tb : std_logic_vector(7 downto 0);

    -- Clock period definition
    constant clk_period : time := 10 ns;

begin
    -- Instantiate the Unit Under Test (UUT)
    uut: inv_subbytes_8bit
        Port map (
            clk       => clk_tb,
            rst       => rst_tb,
            state_in  => state_in_tb,
            state_out => state_out_tb
        );

    -- Clock process definitions
    clk_process :process
    begin
        clk_tb <= '0';
        wait for clk_period/2;
        clk_tb <= '1';
        wait for clk_period/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- Reset the system
        rst_tb <= '1';
        wait for clk_period;
        rst_tb <= '0';
        wait for clk_period;

        -- Test case 1: Apply first input
        state_in_tb <= "00000001";  -- Input byte
        wait for clk_period;

        -- Test case 2: Apply second input
        state_in_tb <= "00000010";  -- Input byte
        wait for clk_period;

        -- Test case 3: Apply third input
        state_in_tb <= "11111111";  -- Input byte
        wait for clk_period;

        -- Test case 4: Apply fourth input
        state_in_tb <= "10101010";  -- Input byte
        wait for clk_period;

        -- Add more test cases as necessary
        wait;
    end process;

end Behavioral;