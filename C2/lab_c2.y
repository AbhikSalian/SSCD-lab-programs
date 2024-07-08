%{
#include "lex.yy.c"
int id=0,dig=0,key=0,op=0,lit=0,par=0,inv=0,head=0;
%}
%token DIGIT ID KEY OP LIT PAR INV HEAD
%%
input:
     DIGIT input {dig++;}
| ID input {id++;}
| KEY input {key++;}
| OP input {op++;}
| LIT input {lit++;}
| PAR input {par++;}
| INV input {inv++;}
| HEAD input {head++;}
| DIGIT {dig++;}
| ID {id++;}
| KEY {key++;}
| OP {op++;}
| LIT {lit++;}
| PAR {par++;}
| INV {inv++;}
| HEAD {head++;}
;
%%
int main(int argc,char **argv)
{
FILE *f1=fopen(argv[1],"r");
if(!f1)
{
printf("File cannot be opened\n");
}
yyin=f1;
do
{
yyparse();
}while(!feof(yyin));
printf("Numbers=%d\nKeywords=%d\nIdentifiers=%d\nOperators=%d\nLiterals=%d\nParenthesis=%d\nHeaders=%d\n",dig,key,id,op,lit,par,head);
return 1;
}
void yyerror()
{
printf("Parse error! Message: ");
exit(0);
}
