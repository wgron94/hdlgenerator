#include "VectorInput.hpp"

VectorInput::VectorInput( SignalType type, std::string name, int size )
   : Signal( type, name ) {
   this->size = size;
}

int VectorInput::getSize() {
   return size;
}

std::string VectorInput::getTypeStrVhdl() {
   return "std_logic_vector( " + std::to_string( size - 1 ) + " downto 0 )";
}

