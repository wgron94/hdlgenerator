#pragma once

#include <fstream>
#include <iostream>
#include <memory>
#include "StateMachine.hpp"

class VhdlWriter {
   public:
      VhdlWriter( std::string, StateMachine & );
      int generate();
   private:
      std::string fileName;
      StateMachine & stateMachine;
      FILE *output;
      std::ofstream outStream;
      int writeEntity();
};
