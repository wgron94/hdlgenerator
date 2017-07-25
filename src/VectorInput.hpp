#pragma once

#include "Signal.hpp"

class VectorInput: public Signal {
   public:
      VectorInput( SignalType type, std::string name, int size )
         : Signal( SignalType type, std::string name );
      int getSize();
   private:
      int size;
};

