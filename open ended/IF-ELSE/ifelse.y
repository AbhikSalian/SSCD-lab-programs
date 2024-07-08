%{
#include <stdio.h>
#include <stdlib.h>
extern int yylex();
extern int yyerror(const char *);

%}

%token IF ELSE INT IDENTIFIER NUMBER EQUAL NEQUAL

%%

program : statement_list
        ;

statement_list : statement
               | statement_list statement
               ;

statement : if_statement
          | other_statement
          ;

if_statement : IF '(' expression ')' '{' statement_list '}' 
             {
                 printf("Found an if statement.\n");
             }
             | IF '(' expression ')' '{' statement_list '}' ELSE '{' statement_list '}' 
             {
                 printf("Found an if-else statement.\n");
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
           | IDENTIFIER '>' expression
           | IDENTIFIER EQUAL expression
           | IDENTIFIER NEQUAL expression
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
