%{/*LEX program to search for a word in a file - take word as constant*/
int flag=0;
char word[]="Joseph";
%}
%%
[a-zA-Z]+	{if(strcmp(yytext,word)==0)
flag=1;
}
%%
int main()
{
FILE *p;
char fname[30];
printf("Enter filename: ");
scanf("%s",fname);
p=fopen(fname,"r");
if(p==NULL)
printf("ERROR: File does not exist\n");
else
{
yyin=p;
yylex();
if(flag==1)
printf("Word %s is found\n",word);
else
printf("Word %s not found\n",word);
}
return 1;
}
