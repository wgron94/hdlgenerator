#include "VectorOutput.hpp"

VectorOutput::VectorOutput( SignalType type, std::string name,
                            Default defaultValue, int size )
   : OutputSignal( type, name, defaultValue ) {
   size = size;
}

