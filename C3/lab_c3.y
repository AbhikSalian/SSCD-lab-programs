%{ /*YACC program*/
#include "lex.yy.c"
int n, acnt=0, bcnt=0;
%}
%token A B
%%
s : s1 s2 { if(acnt==n && bcnt==1)
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
printf("Enter the string (a should be %d, ending with b): ", n);
yyparse();
}
int yyerror()
{
printf("Invalid\n");
exit(0);
}
