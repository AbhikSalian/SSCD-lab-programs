%{ /*LEX program to eliminate comment lines in a C program and copy the resulting program into a separate file.*/
int count=0;
%}
%option noyywrap
%%
"\"".*"\""	ECHO;
"//".*	{count++;}
"/*".*"*/"	{count++;}
%%
int main(int argc,char **argv)
{
FILE *f1,*f2;
if(argc>1)
{
f1=fopen(argv[1],"r");
if(!f1)
{
printf("File cannot be opened\n");
exit(1);
}
yyin=f1;
f2=fopen(argv[2],"w");
if(!f2)
{
printf("File cannot be opened\n");
exit(1);
}
yyout=f2;
yylex();
printf("\nNo. of comment lines : %d\n",count);
}
return 0;
}