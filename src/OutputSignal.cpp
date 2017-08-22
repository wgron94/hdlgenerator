#include "OutputSignal.hpp"

OutputSignal::OutputSignal( SignalType type, std::string name,
                            Default defaultValue )
   : Signal( type, name ) {
   defaultValue = defaultValue;
}

//std::string OutputSignal::getTypeStrVhdl() {
//   switch( type ) {
//      case SignalType::bit :
//         return "std_logic";
//         break;
//      case SignalType::vector :
//         return "std_logic_vector";
//         break;
//      case SignalType::integer :
//         return "integer";
//         break;
//   }
//}

