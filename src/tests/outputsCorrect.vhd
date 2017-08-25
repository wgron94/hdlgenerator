LIBRARY ieee;
USE iee.std_logic_1164.all;
USE iee.numeric_std.all;

ENTITY outputsTest IS
   PORT (
      outputBit: out std_logic;
      bitTesting: out std_logic;
      outputInteger: out integer;
      outputVector: out std_logic_vector( 2 downto 0 ) );
END outputsTest

