#pragma once
#include "OutputSignal.hpp"

class VectorOutput: public OutputSignal {
   public:
      VectorOutput( SignalType, std::string, Default, int );
      int getSize();
      std::string getTypeStrVhdl();
   private:
      Default defaultValue;
      int size;
};

