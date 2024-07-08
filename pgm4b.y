%{
#include "lex.yy.c"
%}
%token LETTER DIGIT
%%
var:LETTER alpha
   ;
alpha:LETTER alpha
     |DIGIT alpha
     |LETTER
     |DIGIT
     ;
%%
main()
{
        printf("enter a string:");
        yyparse();
        printf("valid identifier\n");
}
int yyerror()
{
        printf("invalid identifier\n");
        exit(0);
}
