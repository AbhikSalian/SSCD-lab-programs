%{
#include "for.tab.h"  
#include <stdlib.h>  

extern int yylval;  
%}

%%

"for"       { return FOR; }
"int"       { return INT; }
"("         { return '('; }
")"         { return ')'; }
";"         { return ';'; }
"="         { return '='; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"{"         { return '{'; }
"}"         { return '}'; }
"<"         { return '<'; }
[0-9]+      { yylval = atoi(yytext); return NUMBER; } // Capture numeric literals
[a-zA-Z][a-zA-Z0-9]* { yylval = yytext[0]; return IDENTIFIER; } // Capture identifiers

[ \t\n]     ;  // Ignore whitespace and newline characters

.           { fprintf(stderr, "Unexpected character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}