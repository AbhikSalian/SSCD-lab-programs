%{
int ident=0;
%}
%%
[_a-zA-Z][_a-zA-Z0-9]*	{printf("%s\n",yytext);ident++;}
[^\n]+	{;}
\n	{;}
%%
void main()
{
FILE *p;
char fname[30];
printf("Enter filename: ");
scanf("%s",fname);
p=fopen(fname,"r");
if(p==NULL)
printf("ERROR: file does not exist\n");
else
{
yyin=p;
yylex();
printf("\nNo. of identifiers = %d\n",ident);
}
}
