#include "StateMachine.hpp"

StateMachine::StateMachine( std::string name ) {
   name = name;
}

void StateMachine::addInput( Signal input ) {
   inputs.push_back( input );
}
