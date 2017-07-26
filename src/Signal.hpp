#pragma once
#include <string>
#include <vector>

enum class SignalType { bit, vector, integer };

class Signal {
   public:
      Signal( SignalType, std::string );
      SignalType getType();
      std::string getName();
   protected:
      SignalType type;
      std::string name;
};

