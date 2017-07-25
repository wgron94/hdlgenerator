#include "VectorInput.hpp"

VectorInput::VectorInput( SignalType type, std::string name, int size )
   : Signal( SignalType type, std::string name ) {
   size = size;
}

VectorInput::getSize() {
   return size;
}
