%{
#include "y.tab.h"
extern int yylval;
%}
%%
[ \t]	;
#include[ ]*<[a-z]*[.]h>   {printf("%s -> header\n",yytext);return HEAD;}
[(|)]	{printf("%s -> parenthesis\n",yytext);return PAR;}
"\"".*"\""	{printf("%s -> literal\n",yytext); return LIT;}
[+|-|*|/|=]	{printf("%s -> operator\n",yytext); return OP;}
[0-9]+|[0-9]*[.][0-9]+	{printf("%s -> number\n",yytext); yylval=atoi(yytext);return DIGIT;}
int|char|bool|float|void|for|do|while|if|else|return|void|main|printf|scanf|include|stdio|h	{printf("%s -> keyword\n",yytext); return KEY;}
[a-zA-Z][a-zA-Z0-9_]*	{printf("%s -> identifier\n",yytext); return ID;}
[0-9]+[a-zA-Z]*	{printf("%s -> invalid identifier\n",yytext); return INV;}
.	;
%%
