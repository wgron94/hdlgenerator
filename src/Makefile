parser: lex.yy.c parser.tab.c parser.tab.h StateMachine.o Signal.o BitInput.o \
        VectorInput.o IntegerInput.o
	g++ parser.tab.c lex.yy.c StateMachine.o Signal.o BitInput.o VectorInput.o \
	IntegerInput.o -lfl -o parser
   
parser.tab.c parser.tab.h: parser.y
	bison -d --warnings=none parser.y

lex.yy.c: parser.l parser.tab.h
	flex parser.l

StateMachine.o: StateMachine.cpp StateMachine.hpp
	g++ -c StateMachine.cpp -std=c++11

Signal.o: Signal.cpp Signal.hpp
	g++ -c Signal.cpp -std=c++11

BitInput.o: BitInput.cpp BitInput.hpp
	g++ -c BitInput.cpp -std=c++11

VectorInput.o: VectorInput.cpp VectorInput.hpp
	g++ -c VectorInput.cpp -std=c++11

IntegerInput.o: IntegerInput.cpp IntegerInput.hpp
	g++ -c IntegerInput.cpp -std=c++11

