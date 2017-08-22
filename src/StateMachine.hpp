#pragma once

#include <string>
#include <vector>
#include <memory>
#include "Signal.hpp"
#include "OutputSignal.hpp"

class StateMachine {
   public:
      void setName( std::string );
      std::string getName();
      void addInput( std::unique_ptr<Signal> );
      void addOutput( std::unique_ptr<OutputSignal> );
      const std::vector<std::unique_ptr<Signal>> & getInputs();
      const std::vector<std::unique_ptr<OutputSignal>> & getOutputs();
   private:
      std::string name;
      std::vector<std::unique_ptr<Signal>> inputs;
      std::vector<std::unique_ptr<OutputSignal>> outputs;
};

