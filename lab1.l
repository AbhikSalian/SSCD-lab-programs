%{
int ident=0,oper=0,flag=0;
%}
%%
[0-9]+	{printf("%s is an identifier\n",yytext);ident++;}
[+*]	{printf("%s is an operator\n",yytext);oper++;}
.	{flag=1;}
\n	{return 0;}
%%
void main()
{
printf("Enter an arithmetic expression:\n");
yylex();
if(flag==0 && ident==oper+1)
{
printf("Valid expression\n");
printf("The no. of identifiers are %d\n",ident);
printf("The no. of operators are %d\n",oper);
}
else
{
printf("Invalid expression\n");
}
}
