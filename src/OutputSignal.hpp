#pragma once
#include "Signal.hpp"

union Default {
   int i;
   bool b;
};

class OutputSignal: public Signal {
   public:
      OutputSignal( SignalType, std::string, Default );
      //virtual std::string getTypeStrVhdl();
   protected:
      Default defaultValue;
};

