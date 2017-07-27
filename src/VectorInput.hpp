#pragma once

#include "Signal.hpp"

class VectorInput: public Signal {
   public:
      VectorInput( SignalType type, std::string name, int size ); 
   private:
      int size;
};

