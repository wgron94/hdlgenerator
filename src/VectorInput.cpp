#include "VectorInput.hpp"

VectorInput::VectorInput( SignalType type, std::string name, int size )
   : Signal( type, name ) {
   size = size;
}

