#pragma once
#include <list>

#include "Convert.h"
#include "Eval/Nameless.h"
#include "Syntax/Nameless/Absyn.H"
#include "Syntax/Normal/Absyn.H"

namespace Normal {
Expr *evalStep(Expr *expr) {
  auto nameless = Convert::toNameless_(expr);
  auto step = Nameless::evalStep(nameless);
  if (step) {
    auto res = Convert::fromNameless_(step);

    delete step;
    delete nameless;
    return res;
  }
  delete nameless;
  return nullptr;
}
} // namespace Normal

// list with every step of evaluation
std::list<Normal::Expr *> evalSteps(Normal::Expr *expr) {
  auto steps = std::list<Normal::Expr *>();
  auto step = expr;
  while (step) {
    steps.push_back(step);
    step = Normal::evalStep(step);
  }
  return steps;
}

Normal::Expr *eval(Normal::Expr *expr) {
  auto steps = evalSteps(expr);
  Normal::Expr *res = nullptr;
  if (!steps.empty()) {
    res = steps.back();
    steps.pop_back();
    std::for_each(steps.begin(), steps.end(), [](auto step) { delete step; });
  }

  return res;
}
