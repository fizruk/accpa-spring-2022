# Lab 2 (in C++). Simply typed expressions and functions

_Note: the code in this lab is an extension of [Lab 1](../lab-01-cpp/)._
_This is a C++ version of materials demonstrated in [Lab 2](../lab-02/)._

In this lab, we discuss implementation of an interpreter for simply typed expressions with functions, relying on intermediate nameless representation to deal with possible name conflicts when evaluating.

Supported types:
- `Bool` — type of booleans;
- `Nat` — type of natural numbers;
- `A -> B` — type of functions from `A` to `B` (where `A` and `B` are both types).

The language is **total**: all well-typed programs terminate.
The language employs **call-by-name** evaluation strategy.

## Project structure

Syntax for normal and nameless representation of terms is defined using a labelled BNF in files `Syntax/Normal.cf` and `Syntax/Nameless.cf` correspondingly. BNF converter tool is used to generate parser, abstract syntax, and pretty printer automatically.

File `Convert.h` describes conversion between normal and nameless representations.

File `Eval/Nameless.h` defines evaluation of nameless terms. This implementation together with necessary conversions is used to define evaluation of normal terms in `Eval.h` file.

File `TypeCheck.h` defines typechecking for normal terms.

Finally, `interpreter.cpp` is the main file, that performs parsing of the standard input, typechecking and evaluating every expression, and pretty-printing the result.

## How to use

The interpreter reads standard input, parses a series of expressions separated by a semicolon (`;`), typechecks and evaluates each expression and prints out the results.

```sh
echo "(fun (x : Nat) { return (pred x) })(succ (succ 0))" | ./build/interpreter
```
```
succ 0 : Nat
```

Some example programs are available in the `examples/` directory:

```sh
cat examples/full.example | ./build/interpreter
```

## How to build

### Prerequisites

This lab uses C++ programming language, [Bison](https://www.gnu.org/software/bison/) parser generator, and [BNF Converter tool](http://bnfc.digitalgrammars.com) for demo implementation.

You also need CMake version 3.13 or higher to be able to compile.

To install BNF converter tool, follow instructions on their [official website](http://bnfc.digitalgrammars.com). For example, you can use the Stack tool:

```sh
stack install BNFC
```

To use BNF converter with the С++ implementation, you will also need to install Bison (version 3 or higher). Follow instructions on the official site.

### Building the interpreter

You probably want to clean up previous build files first:

```sh
make clean
```

To run BNF converter, generate source files, run `bison`, and compile, simply run:

```sh
make
```

This should generate `Syntax/Normal/TestNormal` and `Syntax/Nameless/TestNameless` files that you can now use to test parsing of the source code in the target language.

### Generating the PDF with syntax description

Run BNF converter with `--latex` option and use `pdflatex` or `latexmk` to compile a PDF.
Assuming you have `latexmk` and `pdflatex` installed, you can simply run

```sh
make pdf
```

This will generate PDF files `doc/Syntax/Normal.pdf` and `doc/Syntax/Nameless.pdf`.
