#include <iostream>

#include "Eval.h"
#include "Syntax/Nameless/Absyn.H"
#include "Syntax/Nameless/Printer.H"
#include "Syntax/Normal/Absyn.H"
#include "Syntax/Normal/Parser.H"
#include "Syntax/Normal/ParserError.H"
#include "Syntax/Normal/Printer.H"

int main() {
  auto input = stdin;
  input = fopen("../examples/full2.example", "r");
  Normal::Program *prog = nullptr;
  try {
    prog = Normal::pProgram(input);
  }
  catch (Normal::parse_error &ex) {
    std::cerr << "Parse error on line " << ex.getLine() << "\n";
  }

  if (prog) {
    if (auto exprs = dynamic_cast<Normal::ProgramExprs *>(prog)) {
      auto printTree = Normal::PrintAbsyn();
      std::for_each(exprs->listexpr_->begin(), exprs->listexpr_->end(),
                    [&printTree](Normal::Expr *expr) {
                      if (auto result = eval(expr)) {
                        std::cout << printTree.print(result) << std::endl;
                        delete result;
                      }
                    });
    }
    delete prog;
  }

  return 0;
}
