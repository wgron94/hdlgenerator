#pragma once

#include "Signal.hpp"

class IntegerInput: public Signal {
   public:
      IntegerInput( SignalType type, std::string name )
         : Signal( SignalType type, std::string name );

};

