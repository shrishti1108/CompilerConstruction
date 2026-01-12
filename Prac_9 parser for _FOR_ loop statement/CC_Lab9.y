%{

	#include <stdio.h>
	#include <stdlib.h>

	void yyerror(const char *s);
	int yylex(void);
%}

%token FOR LPARSEN RPARSEN LBRACE RBRACE SEMICOLON ASSIGN LESS INCREMENT IDENTIFIER NUMBER 

%%

program:
	for_loop
	;

for_loop:
	FOR LPARSEN initialization SEMICOLON condition SEMICOLON update RPARSEN LBRACE body RBRACE
	{
		printf("Valid FOR loop structure\n");
	}
	;

initialization:
	IDENTIFIER ASSIGN NUMBER
	;

condition:
	IDENTIFIER LESS NUMBER
	;

update:
	IDENTIFIER INCREMENT
	;

body:
	/* Empty body for simplicity */
	;

%%

void yyerror(const char *s)
{
	fprintf(stderr, "Error: %s\n", s);
}

int main(void)
{
	printf("Enter your input:\n");
	yyparse();
	return 0;
}

