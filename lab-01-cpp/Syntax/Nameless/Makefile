CC=g++ -g
CCFLAGS=--ansi -W -Wall -Wno-unused-parameter -Wno-unused-function -Wno-unneeded-internal-declaration

FLEX=flex
FLEX_OPTS=-PNameless

BISON=bison
BISON_OPTS=-t -pNameless

OBJS=Absyn.o Buffer.o Lexer.o Parser.o Printer.o

.PHONY : clean distclean

all : TestNameless

clean :
	rm -f *.o TestNameless Nameless.aux Nameless.log Nameless.pdf Nameless.dvi Nameless.ps Nameless

distclean : clean
	rm -f Absyn.C Absyn.H Buffer.C Buffer.H Test.C Parser.C Parser.H ParserError.H Nameless.y Lexer.C Nameless.l Skeleton.C Skeleton.H Printer.C Printer.H Makefile Nameless.tex

TestNameless : ${OBJS} Test.o
	@echo "Linking TestNameless..."
	${CC} ${OBJS} Test.o -o TestNameless

Absyn.o : Absyn.C Absyn.H
	${CC} ${CCFLAGS} -c Absyn.C

Buffer.o : Buffer.C Buffer.H
	${CC} ${CCFLAGS} -c Buffer.C

Lexer.C : Nameless.l
	${FLEX} -oLexer.C Nameless.l

Parser.C : Nameless.y
	${BISON} Nameless.y -o Parser.C

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
