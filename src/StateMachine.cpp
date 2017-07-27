#include "StateMachine.hpp"

void StateMachine::setName( std::string name ) {
   name = name;
}

void StateMachine::addInput( Signal input ) {
   inputs.push_back( input );
}

void StateMachine::addOutput( OutputSignal output ) {
   outputs.push_back( output );
}
