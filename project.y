%{
	#include <stdio.h>
	#include <iostream>
	#include <string>
	#include <cstring>
	#include <vector>
	using namespace std;
	#include "y.tab.h"
	extern FILE *yyin;
	extern int yylex();
	void yyerror(string s);
	string chessBoard[8][8] = {
	{"R", "N", "B", "Q", "K", "B", "N", "R"},
	{"P", "P", "P", "P", "P", "P", "P", "P"},
	{" "," "," "," "," "," "," "," "},
	{" "," "," "," "," "," "," "," "},
	{" "," "," "," "," "," "," "," "},
	{" "," "," "," "," "," "," "," "},
	{"P", "P", "P", "P", "P", "P", "P", "P"},
	{"R", "N", "B", "Q", "K", "B", "N", "R"}};

%}

%union
{
int number;
char * str;
}

%token KING QUEEN ROOK BISHOP KNIGHT CAPTURE MOVE CHECK CHECKMATE CASTLEKS CASTLEQS DOT
%token <str> LETTER NUMBER
%type <str> piece moves place turn threat
%%

statements:
	statement statements
	|
	statement
	;

statement:
	NUMBER DOT turn turn
	{
		cout<<"move "<<$1<<endl;
		cout<<"The white "<<$3<<endl;
		cout<<"The black "<<$4<<endl;

		string white = string($3);
		string black = string($4);

		if(white[15] == 'K')
		{
			chessBoard[0][4] = "R";
			chessBoard[0][7] = "K";
		}
		if(white[15] == 'Q')
		{
			chessBoard[0][4] = "R";
			chessBoard[0][0] = "K";
		}
		if(black[15] == 'Q')
		{
			chessBoard[7][4] = "R";
			chessBoard[7][0] = "K";
		}
		if(black[15] == 'K')
		{
			chessBoard[7][4] = "R";
			chessBoard[7][7] = "K";
		}
	}
	;
turn:
	piece moves
	{
		string combined = string($1) + string($2) + ".";
		$$ = strdup(combined.c_str());

		string first = string($1);
		string second = string($2);
		int lengthFirst = first.length();
		int lengthSecond = second.length();

		char firstLetter = first[lengthFirst-2];
		char firstNumber = first[lengthFirst-1];

		char secondLetter = second[lengthSecond-2];
		char secondNumber = second[lengthSecond-1];

		int temp = firstNumber;
		int num = temp - 48;

		int tempSec = secondNumber;
		int numSc = tempSec - 48;

		string piece;

		if(firstLetter == 'a'){
			piece = chessBoard[num-1][0];
			chessBoard[num-1][0] = " ";
		}
		if(firstLetter == 'b'){
			piece = chessBoard[num-1][1];
			chessBoard[num-1][1] = " ";
		}
		if(firstLetter == 'c'){
			piece = chessBoard[num-1][2];
			chessBoard[num-1][2] = " ";
		}
		if(firstLetter == 'd'){
			piece = chessBoard[num-1][3];
			chessBoard[num-1][3] = " ";
		}
		if(firstLetter == 'e'){
			piece = chessBoard[num-1][4];
			chessBoard[num-1][4] = " ";
		}
		if(firstLetter == 'f'){
			piece = chessBoard[num-1][5];
			chessBoard[num-1][5] = " ";
		}
		if(firstLetter == 'g'){
			piece = chessBoard[num-1][6];
			chessBoard[num-1][6] = " ";
		}
		if(firstLetter == 'h'){
			piece = chessBoard[num-1][7];
			chessBoard[num-1][7] = " ";
		}


		if(secondLetter == 'a'){
			chessBoard[numSc-1][0] = piece;
		}
		if(secondLetter == 'b'){
			chessBoard[numSc-1][1] = piece;
		}
		if(secondLetter == 'c'){
			chessBoard[numSc-1][2] = piece;
		}
		if(secondLetter == 'd'){
			chessBoard[numSc-1][3] = piece;
		}
		if(secondLetter == 'e'){
			chessBoard[numSc-1][4] = piece;
		}
		if(secondLetter == 'f'){
			chessBoard[numSc-1][5] = piece;
		}
		if(secondLetter == 'g'){
			chessBoard[numSc-1][6] = piece;
		}
		if(secondLetter == 'h'){
			chessBoard[numSc-1][7] = piece;
		}
	}
	|
	CASTLEKS
	{
		string combined = "is castling to King's side";
		$$ = strdup(combined.c_str());
	}
	|
	CASTLEQS
	{
		string combined = "is castling to Queen's side";
		$$ = strdup(combined.c_str());
	}
	|
	piece moves threat
	{
		string combined = string($1) + string($2) + "." + string($3);
		$$ = strdup(combined.c_str());

		string first = string($1);
		string second = string($2);
		int lengthFirst = first.length();
		int lengthSecond = second.length();

		char firstLetter = first[lengthFirst-2];
		char firstNumber = first[lengthFirst-1];

		char secondLetter = second[lengthSecond-2];
		char secondNumber = second[lengthSecond-1];

		int temp = firstNumber;
		int num = temp - 48;

		int tempSec = secondNumber;
		int numSc = tempSec - 48;

		string piece;

		if(firstLetter == 'a'){
			piece = chessBoard[num-1][0];
			chessBoard[num-1][0] = " ";
		}
		if(firstLetter == 'b'){
			piece = chessBoard[num-1][1];
			chessBoard[num-1][1] = " ";
		}
		if(firstLetter == 'c'){
			piece = chessBoard[num-1][2];
			chessBoard[num-1][2] = " ";
		}
		if(firstLetter == 'd'){
			piece = chessBoard[num-1][3];
			chessBoard[num-1][3] = " ";
		}
		if(firstLetter == 'e'){
			piece = chessBoard[num-1][4];
			chessBoard[num-1][4] = " ";
		}
		if(firstLetter == 'f'){
			piece = chessBoard[num-1][5];
			chessBoard[num-1][5] = " ";
		}
		if(firstLetter == 'g'){
			piece = chessBoard[num-1][6];
			chessBoard[num-1][6] = " ";
		}
		if(firstLetter == 'h'){
			piece = chessBoard[num-1][7];
			chessBoard[num-1][7] = " ";
		}


		if(secondLetter == 'a'){
			chessBoard[numSc-1][0] = piece;
		}
		if(secondLetter == 'b'){
			chessBoard[numSc-1][1] = piece;
		}
		if(secondLetter == 'c'){
			chessBoard[numSc-1][2] = piece;
		}
		if(secondLetter == 'd'){
			chessBoard[numSc-1][3] = piece;
		}
		if(secondLetter == 'e'){
			chessBoard[numSc-1][4] = piece;
		}
		if(secondLetter == 'f'){
			chessBoard[numSc-1][5] = piece;
		}
		if(secondLetter == 'g'){
			chessBoard[numSc-1][6] = piece;
		}
		if(secondLetter == 'h'){
			chessBoard[numSc-1][7] = piece;
		}
	}
	|
	CASTLEKS threat
	{
		string combined = "is castling to King's side" + string($2);
		$$ = strdup(combined.c_str());
	}
	|
	CASTLEQS threat
	{
		string combined = "is castling to Queen's side" + string($2);
		$$ = strdup(combined.c_str());
	}
	;

threat:
	CHECK
	{
		string combined = " Check.";
		$$ = strdup(combined.c_str());
	}
	|
	CHECKMATE
	{
		string combined = " Checkmate!";
		$$ = strdup(combined.c_str());
	}
	;
piece:
	KING LETTER NUMBER
	{
		string combined = "king on " + string($2) + string($3);
		$$ = strdup(combined.c_str());
	}
	|
	QUEEN LETTER NUMBER
	{
		string combined = "queen on " + string($2) + string($3);
		$$ = strdup(combined.c_str());
	}
	|
	ROOK LETTER NUMBER
	{
		string combined = "rook on " + string($2) + string($3);
		$$ = strdup(combined.c_str());
	}
	|
	BISHOP LETTER NUMBER
	{
		string combined = "bishop on " + string($2) + string($3);
		$$ = strdup(combined.c_str());
	}
	|
	KNIGHT LETTER NUMBER
	{
		string combined = "knight on " + string($2) + string($3);
		$$ = strdup(combined.c_str());
	}
	|
	LETTER NUMBER
	{
		string combined = "pawn on " + string($1) + string($2);
		$$ = strdup(combined.c_str());
	}
	;

place:
	LETTER NUMBER
	{
		string combined = string($1) + string($2);
		$$ = strdup(combined.c_str());
	}
	;

moves:
	MOVE place
	{
		string moves = " moves to " + string($2);
		$$ = strdup(moves.c_str());
	}
	|
	CHECK
	{
		string moves = " check ";
		$$ = strdup(moves.c_str());
	}
	|
	CAPTURE place
	{
		string line = string($2);
		int lengthLine = line.length();

		char letterLine = line[lengthLine-2];
		char numberLine = line[lengthLine-1];

		int temp = numberLine;
		int num = temp - 48;

		string piece;

		if(letterLine == 'a'){
			piece = chessBoard[num-1][0];
		}
		if(letterLine == 'b'){
			piece = chessBoard[num-1][1];
		}
		if(letterLine == 'c'){
			piece = chessBoard[num-1][2];
		}
		if(letterLine == 'd'){
			piece = chessBoard[num-1][3];
		}
		if(letterLine == 'e'){
			piece = chessBoard[num-1][4];
		}
		if(letterLine == 'f'){
			piece = chessBoard[num-1][5];
		}
		if(letterLine == 'g'){
			piece = chessBoard[num-1][6];
		}
		if(letterLine == 'h'){
			piece = chessBoard[num-1][7];
		}


		string captured;

		if(piece == "R"){
			captured = "rook";
		}
		if(piece == "N"){
			captured = "knight";
		}
		if(piece == "B"){
			captured = "bishop";
		}
		if(piece == "Q"){
			captured = "queen";
		}
		if(piece == "K"){
			captured = "king";
		}
		if(piece == "P"){
			captured = "pawn";
		}


		string moves = " takes the " + captured + " on the " + string($2);
		$$ = strdup(moves.c_str());
	}
	;

%%
void yyerror(string s){
	cerr<<"Error: "<<s<<endl;
}
int yywrap(){
	return 1;
}
int main(int argc, char *argv[])
{
    yyin=fopen(argv[1],"r");
    yyparse();
    fclose(yyin);
    return 0;
}
