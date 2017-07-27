#pragma once
#include "OutputSignal.hpp"

class VectorOutput: public OutputSignal {
   public:
      VectorOutput( SignalType, std::string, Default, int );
   protected:
      Default defaultValue;
      int size;
};

