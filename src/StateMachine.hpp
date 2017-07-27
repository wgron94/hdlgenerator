#pragma once

#include "Signal.hpp"
#include "OutputSignal.hpp"
#include <string>

class StateMachine {
   public:
      void setName( std::string );
      void addInput( Signal );
      void addOutput( OutputSignal );
   private:
      std::string name;
      std::vector<Signal> inputs;
      std::vector<OutputSignal> outputs;
};

