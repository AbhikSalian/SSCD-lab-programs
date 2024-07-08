%{ /*Lexpgm*/
#include "y.tab.h"
%}
%%
[a-zA-Z]+ return ID;
[0-9]+ return NUM;
\n return(0);
. return(yytext[0]);
%%
