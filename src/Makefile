parser: lex.yy.c parser.tab.c parser.tab.h
	g++ parser.tab.c lex.yy.c -lfl -o parser
   
parser.tab.c parser.tab.h: parser.y
	bison -d --warnings=none parser.y

lex.yy.c: parser.l parser.tab.h
	flex parser.l

