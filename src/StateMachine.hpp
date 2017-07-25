#pragma once

#include "Signal.hpp"
#include <string>

class StateMachine {
   public:
      StateMachine( std::string );
      void addInput( Signal );
   private:
      std::vector<Signal> inputs;
      std::string name;
}

