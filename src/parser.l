%{
#include "parser.tab.h"
#define YY_DECL extern "C" int yylex()
%}
%%
[ \t\n];

machine { return MACHINE; }
inputs { return INPUTS; }
outputs { return OUTPUTS; }
states { return STATES; }
transitions { return TRANSITIONS; }
outputLogic { return OUTPUTLOGIC; }
bit { return TYPEBIT; }
integer { return TYPEINTEGER; }
vector { return TYPEVECTOR; }

[1-9][0-9]* { /* Decimal Integer */
   yylval.integer = atoi( yytext );
   return INTEGER; }
0[0-7]+ { /* Octal integer */
   yylval.integer = strtol( yytext, NULL, 0 );
   return INTEGER; }
0[xX][0-9a-fA-F]+ { /* Hexadecimal integer */
   yylval.integer = strtol( yytext, NULL, 0 );
   return INTEGER; }
0[bB][01]+ { /* Binary integer */
   yytext += 2; /* strtol does not recognize the 0b prefix, skip past */
   yylval.integer = strtol( yytext, NULL, 2 );
   return INTEGER; }
0 {
   yylval.integer = 0;
   return INTEGER;
}


[a-zA-Z][a-zA-Z0-9]* {
	// we have to copy because we can't rely on yytext not changing underneath us:
	yylval.str = strdup( yytext );
	return IDENTIFIER;
}


; { return ';'; }
= { return '='; }
\{ { return '{'; }
\} { return '}'; }
\[ { return '['; }
\] { return ']'; }

. {}
%%
