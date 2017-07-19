/* Test parsing a bit of language
 * Based of the GNU Bison mfcalc example and the
 * example at http://aquamentus.com/flex_bison.html */

%{
   #include <stdio.h>  /* For printf, etc. */
   // stuff from flex that bison needs to know about:
   extern "C" int yylex();
   extern "C" int yyparse();
   extern "C" FILE *yyin;
   void yyerror(const char *);
%}

%union {
   char* machine;
   char* inputs;
   char* outputs;
   char* states;
   char* transitions;
   char* outputLogic;
   char* typeBit;
   char* typeInteger;
   char* typeVector;
   char* str;
   int integer;
}

%token <machine> MACHINE /* Machine keyword  */
%token <inputs> INPUTS /* Inputs keyword  */
%token <outputs> OUTPUTS /* Outputs keyword  */
%token <states> STATES /* States keyword  */
%token <transitions> TRANSITIONS /* Transitions keyword  */
%token <outputLogic> OUTPUTLOGIC /* OutputLogic keyword  */
%token <typeBit> TYPEBIT /* Input/output type bit */
%token <typeInteger> TYPEINTEGER /* Input/output type integer */
%token <typeVector> TYPEVECTOR /* Input/output type vector */
%token <str> IDENTIFIER /* Any expression */
%token <integer> INTEGER /* Matches any integer */

%% /* The grammar follows.  */
complete_machine:
   MACHINE IDENTIFIER '{' components '}' { printf( "Found a machine!\n The name is: %s\n", $2 ); }
   ;

components: /* Need one of each component - inputs, outputs, states,
             * transistions and output logic */
   inputs outputs states transitions outputLogic
   ;

/* Grammer for inputs{...} block */
inputs:
   INPUTS '{' inputList '}'
   ;

inputList:
   %empty
   | inputList inputEntry
   ;

inputEntry:
   TYPEBIT IDENTIFIER ';' { printf("Input entry: TYPE: bit ID: %s", $2); }
   | TYPEINTEGER IDENTIFIER ';' { printf("Input entry: TYPE: integer ID: %s", $2); }
   | TYPEVECTOR '[' INTEGER ']'  IDENTIFIER ';'
      {
         printf("Input entry: TYPE: vector SIZE: %d ID: %s", $3, $5);
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
   TYPEBIT IDENTIFIER '=' INTEGER ';' 
      {
         printf( "Output: TYPE: bit ID: %s VALUE: %d", $2, $4 );
      }
   | TYPEINTEGER IDENTIFIER '=' INTEGER ';' 
      {
         printf( "Output: TYPE: integer ID: %s VALUE: %d", $2, $4 );
      }
   | TYPEVECTOR '[' INTEGER ']' IDENTIFIER '=' INTEGER ';' 
      {
         printf( "Output: TYPE: vector SIZE: %d ID: %s VALUE: %d", $3, $5, $7 );
      }
   ;

/* Grammer for states{...} block */
states:
   STATES '{' stateList '}'
   ;

stateList:
   %empty
   | stateList IDENTIFIER
   ;

/* Grammer for transitions{...} block */
transitions:
   TRANSITIONS '{' transitionsList '}'
   ;

transitionsList:
   %empty
   | transitionsList IDENTIFIER
   ;


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
void
yyerror (char const *s)
{
  fprintf (stderr, "%s\n", s);
}

int main (int argc, char const* argv[]){
   // open a file handle to a particular file:
	FILE *input = fopen("test.sm", "r");
	// make sure it is valid:
	if( !input ) {
		printf( "Can't open file!\n" );
		return -1;
	}
	// set flex to read from it instead of defaulting to STDIN:
	yyin = input;
   return yyparse( );
}
