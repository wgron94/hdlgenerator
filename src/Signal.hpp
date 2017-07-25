#pragma once
#include <string>

enum class SignalType { bit, vector, integer };

class Signal {
   public:
      Signal( SignalType, std::string );
      SignalType getType();
      std::string getName();
   protected:
      SignalType type;
      std::string name;
}

