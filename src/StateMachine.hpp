#pragma once

#include "Signal.hpp"
#include <string>

class StateMachine {
   public:
      void setName( std::string );
      void addInput( Signal );
   private:
      std::vector<Signal> inputs;
      std::string name;
};

