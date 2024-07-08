%{
int tcnt=0,wcnt=0,scnt=0,ccnt=0,lcnt=0;
%}
%%
[ ]	{scnt++;}
[\n]	{lcnt++;}
[^\t\n ]+	{wcnt++;ccnt=ccnt+yyleng;}
[\t]	{tcnt++;}
%%
void main()
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
printf("\nNo. of characters: %d\n",ccnt);
}
}
