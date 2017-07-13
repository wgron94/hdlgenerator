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
bit|vector|integer { 
   yylval.str = strdup( yytext );
   return TYPE; }
[a-zA-Z0-9]+ {
	// we have to copy because we can't rely on yytext not changing underneath us:
	yylval.str = strdup( yytext );
	return IDENTIFIER;
}
\{ { return '{'; }
\} { return '}'; }
; { return ';'; }
.;
%%
