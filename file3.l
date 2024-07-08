%{
int pcnt=0,ncnt=0,pfcn=0,nfcn=0,zcnt=0;
%}
zero [+]?[0]+|[-][0]+|[+]?[0]\.[0]*|[-][0]\.[0]*
%%
{zero}	{zcnt++;}
[+]?[0]*[1-9][0-9]*	{pcnt++;}
[-][0]*[1-9][0-9]*	{ncnt++;}
[+]?[0-9]*\.[0-9]+	{pfcn++;}
[-][0-9]*\.[0-9]+	{nfcn++;}
\n return 0;
%%
void main()
{
while(1)
{
pcnt=0,ncnt=0,pfcn=0,nfcn=0,zcnt=0;
printf("Enter the nos. separated by spaces\n");
yylex();
printf("No. of +ve integers is %d\n",pcnt);
printf("No. of -ve integers is %d\n",ncnt);
printf("No. of +ve fraction is %d\n",pfcn);
printf("No. of -ve fraction is %d\n",nfcn);
printf("No. of zeroes is %d\n",zcnt);
}
}
