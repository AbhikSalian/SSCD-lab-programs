%{ /*YACC program to recognize a valid arithmetic expression that uses operators +,-,*,/ */
#include "lex.yy.c"
%}
%token ID NUM
%%
assign : ID '=' exp
;
exp : exp '+' term
| exp '-' term
| term
;
term : term '*' factor
| term '/' factor
| factor
;
factor : '(' exp ')'
| ID
| NUM
| '-' NUM
| '-' '(' exp ')'
;
%%
int yyerror()
{
printf("Invalid expression\n");
exit(0);
}
main()

{
printf("Enter an expression: ");
yyparse();
printf("Valid expression\n");
}
