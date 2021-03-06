#include "VectorOutput.hpp"

VectorOutput::VectorOutput( SignalType type, std::string name,
                            Default defaultValue, int size )
   : OutputSignal( type, name, defaultValue ) {
   this->size = size;
}

int VectorOutput::getSize() {
   return size;
}

std::string VectorOutput::getTypeStrVhdl() {
   return "std_logic_vector( " + std::to_string( size - 1 ) + " downto 0 )";
}

