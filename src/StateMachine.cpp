#include "StateMachine.hpp"

void StateMachine::setName( std::string name ) {
   name = name;
}

void StateMachine::addInput( Signal input ) {
   inputs.push_back( input );
   printf( "Adding input" );
}
