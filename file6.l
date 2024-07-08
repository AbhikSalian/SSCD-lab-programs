%{
int tcnt=0,wcnt=0,scnt=0,lcnt=0;
%}
%%
[ ]     (scnt++;}
[\n]    {lcnt++;}
[^\t\n]+        {wcnt++;}
[\t]    {tcnt++;}
%%
int main()
{
FILE *p;
char fname[30];
printf("Enter filename:");
scanf("%s",fname);
p=fopen(fname,"r");
if(p==NULL)
printf("ERROR: File does not exist\n");
else
{
yyin=p;
yylex();
printf("\nNo. of tabs: %d",tcnt);
printf("\nNo. of words: %d",wcnt);
printf("\nNo. of spaces: %d",scnt);
printf("\nNo. of lines: %d\n",lcnt);
}
return 0;
}
