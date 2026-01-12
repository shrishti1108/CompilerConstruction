%{
	
	#include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    void yyerror(char *s);
    int yylex(void);
    int yyparse(void);
    int temp = 0;

    char* newTemp() {
        char* t = malloc(10);
        sprintf(t, "t%d", temp++);
        return t;
    }

    void yyerror(char *s) {
        fprintf(stderr, "Syntax Error: %s\n", s);
    }

    int main(void) {
        printf("Three-Address Code:)\n");
        printf("Enter expression (press Ctrl+D when done):\n");
        yyparse();
        return 0;
    }
%}

%union {
    int num;
    char *code;
}

%token <num> NUMBER
%type <code> expr

%left '+' '-'
%left '*' '/'

%%

program:
    expr { printf("Final result stored in: %s\n", $1); }
    ;

expr:
    NUMBER {
        char *t = newTemp();
        printf("%s = %d\n", t, $1);
        $$ = t;
    }
    | expr '+' expr {
        char *t = newTemp();
        printf("%s = %s + %s\n", t, $1, $3);
        free($1);
        free($3);
        $$ = t;
    }
    | expr '-' expr {
        char *t = newTemp();
        printf("%s = %s - %s\n", t, $1, $3);
        free($1);
        free($3);
        $$ = t;
    }
    | expr '*' expr {
        char *t = newTemp();
        printf("%s = %s * %s\n", t, $1, $3);
        free($1);
        free($3);
        $$ = t;
    }
    | expr '/' expr {
        char *t = newTemp();
        printf("%s = %s / %s\n", t, $1, $3);
        free($1);
        free($3);
        $$ = t;
    }
    | '(' expr ')' {
        $$ = $2;
    }
    ;
%%
