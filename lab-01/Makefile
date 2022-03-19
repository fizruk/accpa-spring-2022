all: Syntax/Normal/Test Syntax/Nameless/Test

clean:
	make --makefile=Syntax/MakefileNormal clean
	make --makefile=Syntax/MakefileNameless clean

Syntax/Normal/Test: Syntax/Normal.cf
	bnfc -d Syntax/Normal.cf -p Syntax --makefile=Syntax/MakefileNormal
	make --makefile=Syntax/MakefileNormal

Syntax/Nameless/Test: Syntax/Nameless.cf
	bnfc -d Syntax/Nameless.cf -p Syntax --makefile=Syntax/MakefileNameless
	make --makefile=Syntax/MakefileNameless

.PHONY: all clean
