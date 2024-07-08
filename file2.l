%{
int v=0,c=0;
%}
%%
[aeiouAEIOU]	{v++;}
[a-zA-Z|aeiouAEIOU]	{c++;}
\n return 0;
%%
void main()
{
printf("\nEnter the string\n");
yylex();
printf("\n No. of vowels : %d\n",v);
printf("\n No. of consonants : %d\n",c);
}
