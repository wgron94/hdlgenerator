#include "Signal.hpp"

Signal::Signal( SignalType type, std::string name ) {
   this->type = type;
   this->name = name;
}

SignalType Signal::getType() {
   return type;
}

std::string Signal::getTypeStrVhdl() {
   switch( type ) {
      case SignalType::bit :
         return "std_logic";
         break;
      case SignalType::vector :
         return "std_logic_vector";
         break;
      case SignalType::integer :
         return "integer";
         break;
   }
}

std::string Signal::getName() {
   return name;
}

