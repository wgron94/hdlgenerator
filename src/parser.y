/* Test parsing a bit of language
 * Based of the GNU Bison mfcalc example and the
 * example at http://aquamentus.com/flex_bison.html */

%{
   #include <stdio.h>  /* For printf, etc. */
   #include <iostream>
   #include "StateMachine.hpp"
   #include "Signal.hpp"
   #include "VectorInput.hpp"
   #include "OutputSignal.hpp"
   #include "VectorOutput.hpp"
   #include "VhdlWriter.hpp"

   // stuff from flex that bison needs to know about:
   extern "C" int yylex();
   extern "C" int yyparse();
   extern "C" FILE *yyin;
   void yyerror(const char *);
   //std::unique_ptr<StateMachine> stateMachine( new StateMachine() );
   //StateMachine *stateMachine = new StateMachine( );
   StateMachine stateMachine;
%}

%union {
   char* machine;
   char* inputs;
   char* outputs;
   char* states;
   char* state;
   char* transitions;
   char* outputLogic;
   char* typeBit;
   char* typeInteger;
   char* typeVector;
   char* names;
   char* launch;
   char* clock;
   char* resetMode;
   char* reset;
   char* _if;
   char* _else;
   char* str;
   int integer;
}

/* Keywords */
%token <machine> MACHINE /* Machine keyword  */
%token <inputs> INPUTS /* Inputs keyword  */
%token <outputs> OUTPUTS /* Outputs keyword  */
%token <states> STATES /* States keyword  */
%token <state> STATE /* State keyword */
%token <transitions> TRANSITIONS /* Transitions keyword  */
%token <outputLogic> OUTPUTLOGIC /* OutputLogic keyword  */
%token <typeBit> TYPEBIT /* Input/output type bit */
%token <typeInteger> TYPEINTEGER /* Input/output type integer */
%token <typeVector> TYPEVECTOR /* Input/output type vector */
%token <names> NAMES /* Names keyword */
%token <launch> LAUNCH /* Launch keyword */
%token <clock> CLOCK /* Clock keyword */
%token <resetMode> RESETMODE /* Either async or sync */
%token <reset> RESET /* Reset keyword */
%token <_if> IF /* If keyword */
%token <_else> ELSE /* Else keyword */

/* Operators */
%left '|'
%left '^'
%left '&'
%left '-' '+'
%left '*' '/' '%'
%right '~'
%precedence NEG


/* Misc */
%token <str> IDENTIFIER /* Any valid name */
%token <integer> INTEGER /* Any integer in decimal, binary, octal or hex */

%% /* The grammar follows.  */
complete_machine:
   MACHINE IDENTIFIER '{' components '}' {
      std::string name( $2 );
      stateMachine.setName( name );
   }
   ;

components: /* Need one of each component - inputs, outputs, states,
             * transistions and output logic */
   inputs outputs states transitions outputLogic
   ;

/* Grammer for inputs{...} block */
inputs:
   INPUTS '{' inputList '}' { }
   ;

inputList:
   %empty
   | inputList inputEntry
   ;

inputEntry:
   TYPEBIT IDENTIFIER ';' {
      stateMachine.addInput( std::unique_ptr<Signal>( new Signal(
         SignalType::bit, $2 ) ) );
   }
   | TYPEINTEGER IDENTIFIER ';' {
      stateMachine.addInput( std::unique_ptr<Signal>( new Signal(
         SignalType::integer, $2 ) ) );
   }
   | TYPEVECTOR '[' INTEGER ']'  IDENTIFIER ';' {
      stateMachine.addInput( std::unique_ptr<Signal>( new VectorInput(
         SignalType::vector, $5, $3 ) ) );
   }
   ;

/* Grammer for outputs{...} block */
outputs:
   OUTPUTS '{' outputList '}'
   ;

outputList:
   %empty
   | outputList outputEntry
   ;

outputEntry:
   TYPEBIT IDENTIFIER '=' INTEGER ';' {
      Default defaultValue;
      defaultValue.b = $4 ? true : false;
      stateMachine.addOutput( std::unique_ptr<OutputSignal>( new OutputSignal(
         SignalType::bit, $2, defaultValue ) ) );
   }
   | TYPEINTEGER IDENTIFIER '=' INTEGER ';' {
      Default defaultValue;
      defaultValue.i = $4;
      stateMachine.addOutput( std::unique_ptr<OutputSignal>( new OutputSignal(
         SignalType::integer, $2, defaultValue ) ) );
   }
   | TYPEVECTOR '[' INTEGER ']' IDENTIFIER '=' INTEGER ';' {
      Default defaultValue;
      defaultValue.i = $7;
      stateMachine.addOutput( std::unique_ptr<OutputSignal>( new VectorOutput(
         SignalType::vector, $5, defaultValue, $3 ) ) );
   }
   ;

/* Grammer for states{...} block */
states:
   STATES '{' stateList '}'
   ;

stateList:
   %empty
   | stateNames launchState clockName resetState

stateNames:
   NAMES '=' listOfIdentifiers ';' { }
   ;

launchState:
   LAUNCH '=' IDENTIFIER ';' { }
   ;

clockName:
   CLOCK '=' IDENTIFIER ';' { }
   ;

resetState:
   RESETMODE RESET '=' IDENTIFIER ';' { }
   ;

listOfIdentifiers:
   IDENTIFIER { }
   | listOfIdentifiers ',' IDENTIFIER { }

/* Grammer for transitions{...} block */
transitions:
   TRANSITIONS '{' transitionsList '}'
   ;

transitionsList:
   %empty

/* Comment out for now
transitionsList:
   stateBlock
   | transitionsList stateBlock
   ;

stateBlock:
   IDENTIFIER ':' STATE '=' IDENTIFIER ';'
   | IDENTIFIER ':' ifBlock

ifBlock:
   IF '(' expr ')' '{' action '}'
   | IF '(' expr ')' '{' action '}' ELSE '{' action '}'
   | ifBlock IF '(' expr ')' '{' action '}'
   | ifBlock  IF '(' expr ')' '{' action '}' ELSE '{' action '}'

expr:
   IDENTIFIER
   | INTEGER
   | expr '+' expr
   | expr '-' expr
   | expr '&' expr
   | expr '|' expr
   | expr '^' expr

*/


/* Grammer for outputLogic{...} block */
outputLogic:
   OUTPUTLOGIC '{' outputLogicList '}'
   ;

outputLogicList:
   %empty
   | outputLogicList IDENTIFIER
   ;

/* End of grammar.  */
%%

/* Called by yyparse on error.  */
void yyerror( char const *s ) {
  fprintf( stderr, "%s\n", s );
}

int main( int argc, char const* argv[] ) {
   if( argc != 2 ) {
      std::cout << "No file name specified" << std::endl;
      return 1; 
   }
   // open a file handle to a particular file:
	FILE *input = fopen( argv[1], "r" );
	// make sure it is valid:
	if( !input ) {
      std::cout << "Can't open file" << std::endl;
		return 1;
	}
	// set flex to read from it instead of defaulting to STDIN:
	yyin = input;
   std::string fileName = argv[1];
   std::string fileNameNoExtension = fileName.substr( 0,
      fileName.find_last_of( "." ) );
   if( !yyparse( ) ) {
      VhdlWriter writer( fileNameNoExtension, stateMachine ); 
      writer.generate();
   }
   else{ printf( " yyparse failed " ); }
   fclose( input );
   return 0;
}

