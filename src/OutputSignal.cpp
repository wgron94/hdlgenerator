#include "OutputSignal.hpp"

OutputSignal::OutputSignal( SignalType type, std::string name,
                            Default defaultValue )
   : Signal( type, name ) {
   defaultValue = defaultValue;
}

