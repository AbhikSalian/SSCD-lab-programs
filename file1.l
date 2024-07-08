%{
%}
%%
[\t]+	;
go|play	{printf("%s is a verb\n",yytext);}
[a-zA-Z0-9]+	{printf("%s is not a verb\n",yytext);}
.|\n	{ECHO;}
%%
int main()
{
yylex();
return 0;
}
