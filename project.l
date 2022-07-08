digit	[0-9]
letter	[a-z]
%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"

%}
%%

"K" return KING;
"Q" return QUEEN;
"R" return ROOK;
"B" return BISHOP;
"N" return KNIGHT;
"x" return CAPTURE;
"-" return MOVE;
"+" return CHECK;
"#" return CHECKMATE;
"O-O" return CASTLEKS;
"O-O-O" return CASTLEQS;
{letter} {
	yylval.str=strdup(yytext);
	return LETTER;
	}
"." return DOT; 
{digit} 	{
	yylval.str=strdup(yytext);
	return NUMBER;
	}
\n
[ \t]+
. {}


%%