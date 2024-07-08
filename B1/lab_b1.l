%{
/* Lex program to recognize a valid arithmetic expression using + and * and count the number of
identifiers and operators in the expression */
#include <stdio.h>
#include <stdlib.h>

int id = 0, op = 0, flag = 0;
%}
%option noyywrap

%%
[0-9]+ { id++; printf("%s is an identifier\n", yytext); }
[+*]   { op++; printf("%s is an operator\n", yytext); }
.      { flag = 1; }
\n     { return 0; }
%%
int main ()
{
    printf("Please enter a valid arithmetic expression\n");
    yylex();
    if (flag == 0 && id == op + 1)
    {
        printf("Valid arithmetic expression.\n");
        printf("The number of identifiers are %d\n", id);
        printf("The number of operators are %d\n", op);
    }
    else
    {
        printf("Invalid arithmetic expression!\n");
    }
    return 0;
}
