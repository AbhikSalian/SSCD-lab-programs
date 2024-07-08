%{/* lab_c1.l */
#include "lab_c1.tab.h"
#include <stdlib.h>
#include <stdio.h>

void yyerror(const char *s);
%}
%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
[\+\-\*\/()] { return yytext[0]; }
\n          { return 0; }
.           { yyerror("Unexpected character"); }
%%
int yywrap() {
    return 1;
}
