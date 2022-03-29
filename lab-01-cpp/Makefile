all: Syntax/Normal/TestNormal Syntax/Nameless/TestNameless Interpreter

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
	rm -rf Syntax/Normal
	rm -rf Syntax/Nameless
	rm -rf build
	cd doc/Syntax && (latexmk -c; cd ../..)

Syntax/Normal/TestNormal: Syntax/Normal.cf
	mkdir -p Syntax/Normal/
	cd Syntax/Normal/ && (bnfc -m --cpp ../Normal.cf -l -p Normal; cd ../../)
	cd Syntax/Normal/ && (make; cd ../../)

Syntax/Nameless/TestNameless: Syntax/Nameless.cf
	mkdir -p Syntax/Nameless/
	cd Syntax/Nameless/ && (bnfc -m --cpp ../Nameless.cf -l -p Nameless; cd ../../)
	cd Syntax/Nameless/ && (make; cd ../../)

Interpreter:
	cmake -S. -Bbuild -G Ninja
	cmake --build build/ --target Interpreter --

.PHONY: all clean
