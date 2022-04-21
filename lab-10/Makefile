all: Syntax/Normal/Test Syntax/Nameless/Test

pdf:	doc/Syntax/Normal.pdf doc/Syntax/Nameless.pdf

doc/Syntax/Normal.pdf: doc/Syntax/Normal.tex
	latexmk -output-directory=doc/Syntax/ -pdflatex doc/Syntax/Normal.tex
doc/Syntax/Nameless.pdf: doc/Syntax/Nameless.tex
	latexmk -output-directory=doc/Syntax/ -pdflatex doc/Syntax/Nameless.tex

doc/Syntax/Normal.tex: Syntax/Normal.cf
	bnfc --latex Syntax/Normal.cf -o doc/Syntax/
doc/Syntax/Nameless.tex: Syntax/Nameless.cf
	bnfc --latex Syntax/Nameless.cf -o doc/Syntax/

clean:
	make --makefile=Syntax/MakefileNormal clean
	make --makefile=Syntax/MakefileNameless clean
	cd doc/Syntax && (latexmk -c; cd ../..)

Syntax/Normal/Test: Syntax/Normal.cf
	bnfc -d Syntax/Normal.cf -p Syntax --makefile=Syntax/MakefileNormal
	make --makefile=Syntax/MakefileNormal

Syntax/Nameless/Test: Syntax/Nameless.cf
	bnfc -d Syntax/Nameless.cf -p Syntax --makefile=Syntax/MakefileNameless
	make --makefile=Syntax/MakefileNameless

.PHONY: all clean
