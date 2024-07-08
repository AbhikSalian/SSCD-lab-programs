%{ /*YACC program*/
#include "lex.yy.c"
int n, acnt=0, bcnt=0;
%}
%token A B
%%
s : s1 s2 { if(acnt==n && bcnt==2*n)
{ printf("Valid string\n");
exit(0);
}
else
{ printf("Invalid string\n");
exit(0);
}
}
;
s1: A s1 { acnt++; }
|
;
s2: B s2 { bcnt++; }
|
;
%%
main(int argc, char **argv)
{
n=atoi(argv[1]);
if(n==0)
{
printf("n should be more than or equal to 1\n");
exit(0);
}
printf("Enter the string (a should be %d, followed by %d b): ", n,n*2);
yyparse();
}
int yyerror()
{
printf("Invalid\n");
exit(0);
}
