CC=g++ -g
CCFLAGS=--ansi -W -Wall -Wno-unused-parameter -Wno-unused-function -Wno-unneeded-internal-declaration

FLEX=flex
FLEX_OPTS=-PNormal

BISON=bison
BISON_OPTS=-t -pNormal

OBJS=Absyn.o Buffer.o Lexer.o Parser.o Printer.o

.PHONY : clean distclean

all : TestNormal

clean :
	rm -f *.o TestNormal Normal.aux Normal.log Normal.pdf Normal.dvi Normal.ps Normal

distclean : clean
	rm -f Absyn.C Absyn.H Buffer.C Buffer.H Test.C Parser.C Parser.H ParserError.H Normal.y Lexer.C Normal.l Skeleton.C Skeleton.H Printer.C Printer.H Makefile Normal.tex

TestNormal : ${OBJS} Test.o
	@echo "Linking TestNormal..."
	${CC} ${OBJS} Test.o -o TestNormal

Absyn.o : Absyn.C Absyn.H
	${CC} ${CCFLAGS} -c Absyn.C

Buffer.o : Buffer.C Buffer.H
	${CC} ${CCFLAGS} -c Buffer.C

Lexer.C : Normal.l
	${FLEX} -oLexer.C Normal.l

Parser.C : Normal.y
	${BISON} Normal.y -o Parser.C

Lexer.o : Lexer.C Parser.H
	${CC} ${CCFLAGS} -c Lexer.C

Parser.o : Parser.C Absyn.H
	${CC} ${CCFLAGS} -c Parser.C

Printer.o : Printer.C Printer.H Absyn.H
	${CC} ${CCFLAGS} -c Printer.C

Skeleton.o : Skeleton.C Skeleton.H Absyn.H
	${CC} ${CCFLAGS} -Wno-unused-parameter -c Skeleton.C

Test.o : Test.C Parser.H Printer.H Absyn.H
	${CC} ${CCFLAGS} -c Test.C
