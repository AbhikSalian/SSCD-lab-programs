%{/* lab_c1.y */
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex(void);

%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%%
stmt: exp  { printf("Value of expression = %d \n", $$); }
    ;
exp: exp '+' exp  { $$ = $1 + $3; }
   | exp '-' exp  { $$ = $1 - $3; }
   | exp '*' exp  { $$ = $1 * $3; }
   | exp '/' exp  { if ($3 == 0) {
                       printf("Divide by zero error!\n");
                       yyerror("Divide by zero");
                   } else {
                       $$ = $1 / $3;
                   }
                 }
   | '(' exp ')'  { $$ = $2; }
   | NUMBER       { $$ = $1; }
   ;
%%
int main() {
    printf("Enter expression: ");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    printf("Invalid expression: %s\n", s);
    exit(1);
}
