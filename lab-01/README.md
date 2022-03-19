# Lab 1. Untyped expressions, functions and nameless representation

In this lab, we discuss implementation of an interpreter for simple untyped expressions with functions, relying on intermediate nameless representation to deal with possible name conflicts.

[![Description of the syntax.](images/normal-bnf.png)](doc/Syntax/Normal.pdf)

The language employs **call-by-name** evaluation strategy.

## Project structure

Syntax for normal and nameless representation of terms is defined using a labelled BNF in files `Syntax/Normal.cf` and `Syntax/Nameless.cf` correspondingly. BNF converter tool is used to generate parser, abstract syntax, and pretty printer automatically.

Module `Convert.hs` describes conversion between normal and nameless representations.

Module `Eval/Nameless.hs` defines evaluation of nameless terms. This implementation together with necessary conversions is used to define evaluation of normal terms in `Eval.hs` module.

Finally, `interpreter.hs` is the main module, that performs parsing of the standard input, evaluating every expression, and pretty-printing the result.

## How to use

The interpreter reads standard input, parses a series of expressions separated by a semicolon (`;`), evaluates each expression and prints out the results.

```sh
echo "(fun (x) { return (pred x) })(succ (succ 0))" | ./interpreter
```
```
succ 0
```

Some example programs are available in the `examples/` directory:

```sh
cat examples/full.example | ./interpreter
```
```
0
succ succ 0
succ succ succ succ succ succ succ succ 0
succ succ succ succ succ succ succ 0
succ succ succ succ succ succ succ succ succ succ succ succ 0
succ succ succ succ succ succ 0
```

## How to build

### Prerequisites

This lab uses Haskell programming language and [BNF Converter tool](http://bnfc.digitalgrammars.com) for demo implementation.
To install Haskell, follow instructions on the [Haskell Downloads page](https://www.haskell.org/downloads/). The demonstration is performed using [the Stack tool](https://docs.haskellstack.org), but other installation methods are possible.

To install BNF converter tool, follow instructions on their [official website](http://bnfc.digitalgrammars.com). For example, you can use the Stack tool:

```sh
stack install BNFC
```

To use BNF converter with the Haskell implementation, you will also need to install Alex and Happy (lexer and parser generator tools for Haskell, analogous to YACC and Bison). Using Stack you can install them as follows:

```sh
stack install alex happy
```

### Building the interpreter

First, to run BNF converter and generate Haskell files for the syntax, run:

```sh
make
```

Now, build the interpreter with GHC:

```sh
stack ghc interpreter.hs
```

This should generate an executable `./interpreter` that you can now use to interpret untyped expressions with functions.

### Generating the PDF with syntax description

Run BNF converter with `--latex` option and use `pdflatex` or `latexmk` to compile a PDF.
Assuming you have `latexmk` and `pdflatex` installed, you can simply run

```sh
make pdf
```

This will generate PDF files `doc/Syntax/Normal.pdf` and `doc/Syntax/Nameless.pdf`.
