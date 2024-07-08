%{
#include <stdio.h>
#include <stdlib.h> 
extern int yylex();
extern int yyerror(const char *);

%}

%token FOR INT IDENTIFIER NUMBER

%%

program : statement_list
        ;

statement_list : statement
               | statement_list statement
               ;

statement : for_statement
          | other_statement
          ;

for_statement : FOR '(' expression ';' expression ';' expression ')' '{' statement_list '}' 
              {
                  printf("Found a for statement.\n");
              }
              ;

other_statement : INT IDENTIFIER '=' expression ';'
                {
                    printf("Found an assignment statement.\n");
                }
                ;

expression : IDENTIFIER
           | NUMBER
           | IDENTIFIER '+' expression
           | IDENTIFIER '-' expression
           | IDENTIFIER '*' expression
           | IDENTIFIER '/' expression
           | IDENTIFIER '<' expression
           | IDENTIFIER '=' expression
           | NUMBER '+' expression
           | NUMBER '-' expression
           | NUMBER '*' expression
           | NUMBER '/' expression
           ;

%%

int main() {
    printf("Enter C code:\n");
    yyparse();
    return 0;
}

int yyerror(const char *s) {
    printf("Parse error: %s\n", s);
    return 0;
}
