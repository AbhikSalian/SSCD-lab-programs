%{
%}
%%
[0-9]*\.[0-9]+	{printf("%s is a floating point number\n",yytext);}
.|[0-9]*\.[0-9]+  {printf("%s is not a floating point number\n",yytext);}
%%
void main()
{
yylex();
}
