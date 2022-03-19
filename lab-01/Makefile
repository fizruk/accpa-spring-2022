all: Syntax/Normal/Test Syntax/Nameless/Test

pdf:	Syntax/Normal.pdf Syntax/Nameless.pdf

Syntax/Normal.pdf: Syntax/Normal.tex
	latexmk -output-directory=Syntax/ -pdflatex Syntax/Normal.tex
Syntax/Nameless.pdf: Syntax/Nameless.tex
	latexmk -output-directory=Syntax/ -pdflatex Syntax/Nameless.tex

Syntax/Normal.tex: Syntax/Normal.cf
	bnfc --latex Syntax/Normal.cf -o Syntax/
Syntax/Nameless.tex: Syntax/Nameless.cf
	bnfc --latex Syntax/Nameless.cf -o Syntax/

clean:
	make --makefile=Syntax/MakefileNormal clean
	make --makefile=Syntax/MakefileNameless clean
	cd Syntax && (latexmk -c; cd ..)

Syntax/Normal/Test: Syntax/Normal.cf
	bnfc -d Syntax/Normal.cf -p Syntax --makefile=Syntax/MakefileNormal
	make --makefile=Syntax/MakefileNormal

Syntax/Nameless/Test: Syntax/Nameless.cf
	bnfc -d Syntax/Nameless.cf -p Syntax --makefile=Syntax/MakefileNameless
	make --makefile=Syntax/MakefileNameless

.PHONY: all clean
