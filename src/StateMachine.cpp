#include "StateMachine.hpp"

void StateMachine::setName( std::string name ) {
   this->name = name;
}

std::string StateMachine::getName() {
   return name;
}

void StateMachine::addInput( std::unique_ptr<Signal> input ) {
   inputs.push_back( std::move( input ) );
}

void StateMachine::addOutput( std::unique_ptr<OutputSignal> output ) {
   outputs.push_back( std::move( output ) );
}

const std::vector<std::unique_ptr<Signal>> & StateMachine::getInputs( ) {
   return inputs;
}

const std::vector<std::unique_ptr<OutputSignal>> & StateMachine::getOutputs( ) {
   return outputs;
}

