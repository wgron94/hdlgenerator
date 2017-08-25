parser: lex.yy.c parser.tab.c parser.tab.h StateMachine.o Signal.o \
        VectorInput.o OutputSignal.o VectorOutput.o VhdlWriter.o
	g++ parser.tab.c lex.yy.c StateMachine.o Signal.o VectorInput.o \
	OutputSignal.o VectorOutput.o VhdlWriter.o -lfl \
	-o parser -std=c++11
   
parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.c: parser.l parser.tab.h
	flex parser.l

StateMachine.o: StateMachine.cpp StateMachine.hpp
	g++ -c StateMachine.cpp -std=c++11

Signal.o: Signal.cpp Signal.hpp
	g++ -c Signal.cpp -std=c++11

VectorInput.o: VectorInput.cpp VectorInput.hpp
	g++ -c VectorInput.cpp -std=c++11

OutputSignal.o: OutputSignal.cpp OutputSignal.hpp
	g++ -c OutputSignal.cpp -std=c++11

VectorOutput.o: VectorOutput.cpp VectorOutput.hpp
	g++ -c VectorOutput.cpp -std=c++11

VhdlWriter.o: VhdlWriter.cpp VhdlWriter.hpp
	g++ -c VhdlWriter.cpp -std=c++11

check:
	./tests/inputs.sh
	./tests/outputs.sh
	./tests/inout.sh


