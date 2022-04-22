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
                    [&printTree](Normal::Expr *typing) {
                      auto result = typecheckAndEval(typing);
                      try {
                        auto expr = std::get<Normal::TypingStmt *>(result);
                        std::cout << printTree.print(expr) << std::endl;
                        delete expr;
                      }
                      catch (const std::bad_variant_access &ex) {
                        std::cout << "ERROR: " << std::get<std::string>(result);
                      }
                      std::cout << "\n";
                    });
    }
    delete prog;
  }

  return 0;
}
