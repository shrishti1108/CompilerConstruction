%{

	#include <stdio.h>
	#include "y.tab.h"
%}

%%

"for"       { return FOR; }
"("         { return LPARSEN; }
")"         { return RPARSEN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
";"         { return SEMICOLON; }
"="         { return ASSIGN; }
"<"         { return LESS; }
"++"        { return INCREMENT; }

[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }
[0-9]+                  { return NUMBER; }
[ \t\n\r]+              ; // Skip whitespace

.           { printf("Invalid character: %s\n", yytext); }

%%

int yywrap(void)
{
    return 1;
}

