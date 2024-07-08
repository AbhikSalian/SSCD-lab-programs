%{/*LEX program to search for a word in a file - Input word*/
#include<string.h>
int flag=0;
char word[20];
%}
%option noyywrap
%%
[a-zA-Z]+	{if(strcmp(yytext,word)==0)
flag=1;
}
%%
int main(int argc,char **argv)
{
FILE *p;
char fname[30];
strcpy(word,argv[1]);
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
printf("Word %s found\n",word);
else
printf("Word %s not found\n",word);
}
return 1;
}
