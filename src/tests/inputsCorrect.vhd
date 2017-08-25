LIBRARY ieee;
USE iee.std_logic_1164.all;
USE iee.numeric_std.all;

ENTITY inputsTest IS
   PORT (
      testBit: in std_logic;
      testVector: in std_logic_vector( 4 downto 0 );
      testHex: in std_logic_vector( 9 downto 0 );
      testBin: in std_logic_vector( 2 downto 0 );
      testOctal: in std_logic_vector( 8 downto 0 );
      testInt: in integer );
END inputsTest

