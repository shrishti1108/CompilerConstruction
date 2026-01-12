%{
	
	#include<stdio.h>
	int count = 0;
%}

%% 
[Aa][a-zA-Z]* {count++; }
[a-zA-Z]+					{/*Ignore other words*/}
.|\n						{/*Ignore other characters*/}
%%

int main()
{
	yylex();
	printf("Number of words starting with 'A' or 'a': %d\n", count);
	return 0;
}
int yywrap()
{
	return 1; 
}
