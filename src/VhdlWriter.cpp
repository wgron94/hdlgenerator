#include "VhdlWriter.hpp"

std::string tab( ) {
   return "   ";
}

std::string tab( int num ) {
   std::string tabStr = "";
   for( int i = 0; i < num; ++i ) {
      tabStr += "   ";
   }
   return tabStr;
}

VhdlWriter::VhdlWriter( std::string fileName, StateMachine &stateMachine_ ) :
stateMachine( stateMachine_ ){
   this->fileName = fileName + ".vhd";
}

int VhdlWriter::generate() {
   std::cout << "The filename is: " << fileName << std::endl;
   /* Open output file for writing */

   outStream.open( fileName.c_str() );
   if( outStream.bad() ) {
      std::cout << "Can't open file" << std::endl;
      return 1;
	}
   
   if( writeEntity( ) ) {
      return 1;
   }
   outStream.close();
   return 0;
}

int VhdlWriter::writeEntity() {
   outStream << "ENTITY " << stateMachine.getName() << " IS" << std::endl; 
   outStream << tab() << "PORT (";
   
   int inputSize = stateMachine.getInputs().size();
   int outputSize = stateMachine.getOutputs().size();

   if( inputSize == 0 && outputSize == 0 ) {
      outStream << " );";
   }
   else {
      outStream << std::endl;
      /* Write list of inputs. No inputs is valid */
      for( auto const& input : stateMachine.getInputs() ) {
         outStream << tab( 2 ) << input->getName() << ": in "
            << input->getTypeStrVhdl() << ";" << std::endl;
      }

      /* Write list of outputs. No outputs is valid */
      for( auto const& output : stateMachine.getOutputs() ) {
         outStream << tab( 2 ) << output->getName() << ": out "
            << output->getTypeStrVhdl() << ";" << std::endl;
      }

      /* Remove last semicolon and add parentheses and semicolon at the end */
      long pos = outStream.tellp();
      outStream.seekp( pos - 2 );
      outStream << " );" << std::endl;
   }

   /* Write END statement */
   outStream << "END " << stateMachine.getName() << std::endl;

   return 0;
}


