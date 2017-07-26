#include "Signal.hpp"

Signal::Signal( SignalType type, std::string name ) {
   type = type;
   name = name;
}

SignalType Signal::getType() {
   return type;
}

std::string Signal::getName() {
   return name;
}
