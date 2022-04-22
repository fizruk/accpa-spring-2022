cmake_minimum_required(VERSION 3.10.0)
project(Interpreter VERSION 0.1.0)

set (SNTX_Normal
  Syntax/Normal/Absyn.H
  Syntax/Normal/Absyn.C
  Syntax/Normal/Parser.H
  Syntax/Normal/Parser.C
  Syntax/Normal/ParserError.H
  Syntax/Normal/Printer.H
  Syntax/Normal/Printer.C
  Syntax/Normal/Buffer.H
  Syntax/Normal/Buffer.C
  Syntax/Normal/Bison.H
  Syntax/Normal/Lexer.C
)

set (SNTX_Nameless
  Syntax/Nameless/Absyn.H
  Syntax/Nameless/Absyn.C
  Syntax/Nameless/Parser.H
  Syntax/Nameless/Parser.C
  Syntax/Nameless/ParserError.H
  Syntax/Nameless/Printer.H
  Syntax/Nameless/Printer.C
  Syntax/Nameless/Lexer.C
  # Only one copy is needed
  # Syntax/Nameless/Buffer.H
  # Syntax/Nameless/Buffer.C
  # Syntax/Normal/Bison.H
)

set (SRCS
  Interpreter.cpp
  Convert.h
  Eval.h
  Eval/Nameless.h
  TypeCheck.h
)

add_executable(Interpreter ${SNTX_Normal} ${SNTX_Nameless} ${SRCS})
set_property(TARGET Interpreter PROPERTY CXX_STANDARD 17)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
