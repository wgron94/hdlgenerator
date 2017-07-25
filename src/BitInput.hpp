#pragma once

#include "Signal.hpp"

class BitInput: public Signal {
   public:
      BitInput( SignalType type, std::string name )
         : Signal( SignalType type, std::string name );
};
