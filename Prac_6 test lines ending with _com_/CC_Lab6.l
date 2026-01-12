%{

	#include<stdio.h>
	int line_number = 0;
%}

%%
^.*com$ {
line_number++;
printf("Line %d ends with 'com': %s", line_number, yytext);
}
^.+$ {line_number++;}
\n	{/*ignore newlines*/}
%%

int main() {
	yylex();
	return 0;
}
int yywrap(){
	return 1;
}



