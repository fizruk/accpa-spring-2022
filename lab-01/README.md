# Lab 1. Untyped expressions, functions and nameless representation

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
