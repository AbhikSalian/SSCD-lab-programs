%{
int num;
%}
%%
[0-9]+	{num=atoi(yytext);
if(num%2==0)
{
printf("No. is even");
}
else
{
printf("No. is odd");
}
}
%%
void main()
{
yylex();
}
