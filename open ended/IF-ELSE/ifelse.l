%{
#include "ifelse.tab.h" 
#include <stdlib.h> 

extern int yylval;  
%}

%%

"if"        { return IF; }
"else"      { return ELSE; }
"int"       { return INT; }
"("         { return '('; }
")"         { return ')'; }
"{"         { return '{'; }
"}"         { return '}'; }
";"         { return ';'; }
"="         { return '='; }
"=="        { return EQUAL; }
"!="        { return NEQUAL; }
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"<"         { return '<'; }
">"         { return '>'; }
[0-9]+      { yylval = atoi(yytext); return NUMBER; } // Capture numeric literals
[a-zA-Z][a-zA-Z0-9]* { yylval = yytext[0]; return IDENTIFIER; } // Capture identifiers

[ \t\n]     ;  // Ignore whitespace and newline characters

.           { fprintf(stderr, "Unexpected character: %s\n", yytext); }
%%

int yywrap() {
    return 1;
}
