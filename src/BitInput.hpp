#pragma once

#include "Signal.hpp"

class BitInput: public Signal {
   public:
      BitInput( SignalType, std::string );
};
