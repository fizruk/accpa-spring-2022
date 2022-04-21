#pragma once
#include <functional>

#include "../Syntax/Nameless/Absyn.H"
#include "../Syntax/Normal/Absyn.H"

namespace Nameless {
bool isNatValue(Expr *);
std::function<Expr *(Expr *)> substitute(int, Expr *);

bool isValue(Expr *expr) {
  if (dynamic_cast<ConstTrue *>(expr) || dynamic_cast<ConstFalse *>(expr) ||
      dynamic_cast<Abstraction *>(expr)) {
    return true;
  }
  return isNatValue(expr);
}

bool isNatValue(Expr *expr) {
  if (dynamic_cast<ConstZero *>(expr)) {
    return true;
  }
  if (auto succ = dynamic_cast<Succ *>(expr)) {
    return isNatValue(succ->expr_);
  }
  return false;
}

Expr* lookupField(const Ident &l, ListBindingExpr *cases) {
  for (auto binding : *cases) {
    if (auto bind = dynamic_cast<Binding*>(binding)) {
      if (bind->ident_ == l) {
        return bind->expr_->clone();
      }
    }
  }
  return nullptr;
}

Expr *evalStep(Expr *expr) {
  if (!expr) {
    return nullptr;
  }

  if (auto expr_if = dynamic_cast<If *>(expr)) {
    if (dynamic_cast<ConstTrue *>(expr_if->expr_1)) {
      return expr_if->expr_2->clone();
    }
    if (dynamic_cast<ConstFalse *>(expr_if->expr_1)) {
      return expr_if->expr_3->clone();
    }
    if (auto t1_prime = evalStep(expr_if->expr_1)) {
      return new If(t1_prime, expr_if->expr_2->clone(),
                    expr_if->expr_3->clone());
    }
    return nullptr;
  }

  if (auto expr_succ = dynamic_cast<Succ *>(expr)) {
    if (auto t_prime = evalStep(expr_succ->expr_)) {
      return new Succ(t_prime);
    }
    return nullptr;
  }

  if (auto expr_pred = dynamic_cast<Pred *>(expr)) {
    if (auto const_zero = dynamic_cast<ConstZero *>(expr_pred->expr_)) {
      return const_zero->clone();
    }
    if (auto succ = dynamic_cast<Succ *>(expr_pred->expr_)) {
      return succ->expr_->clone();
    }
    if (auto t_prime = evalStep(expr_pred->expr_)) {
      return new Pred(t_prime);
    }
    return nullptr;
  }

  if (auto expr_isZero = dynamic_cast<IsZero *>(expr)) {
    if (dynamic_cast<ConstZero *>(expr_isZero->expr_)) {
      return new ConstTrue();
    }
    if (dynamic_cast<Succ *>(expr_isZero->expr_)) {
      return new ConstFalse();
    }
    if (auto t_prime = evalStep(expr_isZero->expr_)) {
      return new IsZero(t_prime);
    }
    return nullptr;
  }

  if (auto expr_application = dynamic_cast<Application *>(expr)) {
    if (auto abstraction =
            dynamic_cast<Abstraction *>(expr_application->expr_1)) {
      auto body = abstraction->expr_;
      return substitute(0, expr_application->expr_2)(body);
    }
    if (auto t_prime = evalStep(expr_application->expr_1)) {
      return new Application(t_prime, expr_application->expr_2->clone());
    }
    return nullptr;
  }

  if (auto let = dynamic_cast<Let *>(expr)) {
    return substitute(0, let->expr_1)(let->expr_2);
  }

  if (auto dot = dynamic_cast<Dot*>(expr)) {
    if (auto record = dynamic_cast<Record*>(dot->expr_)) {
      return lookupField(dot->ident_, record->listbindingexpr_);
    }

    if(auto t_prime = evalStep(dot->expr_)) {
      return new Dot(t_prime, dot->ident_);
    }

  }

  if (dynamic_cast<Abstraction *>(expr) || dynamic_cast<ConstTrue *>(expr) ||
      dynamic_cast<ConstFalse *>(expr) || dynamic_cast<ConstZero *>(expr) ||
      dynamic_cast<FreeVar *>(expr) || dynamic_cast<BoundVar *>(expr) ||
      dynamic_cast<Record *>(expr)) {
    return nullptr;
  }

  return nullptr;
}

std::function<Expr *(Expr *)> shiftFrom(int k) {
  std::function<Expr *(Expr *)> go = [k, &go](Expr *expr) -> Expr * {
    if (auto n = dynamic_cast<BoundVar *>(expr)) {
      if (n->integer_ >= k) {
        return new BoundVar(n->integer_ + 1);
      }
      return expr->clone();
    }

    if (dynamic_cast<FreeVar *>(expr)) {
      return expr;
    }

    if (auto abstraction = dynamic_cast<Abstraction *>(expr)) {
      return new Abstraction(abstraction->type_,
                             shiftFrom(k + 1)(abstraction->expr_));
    }

    if (auto application = dynamic_cast<Application *>(expr)) {
      return new Application(go(application->expr_1), go(application->expr_2));
    }

    if (auto constTrue = dynamic_cast<ConstTrue *>(expr)) {
      return constTrue->clone();
    }
    if (auto constFalse = dynamic_cast<ConstFalse *>(expr)) {
      return constFalse->clone();
    }
    if (auto if_expr = dynamic_cast<If *>(expr)) {
      return new If(go(if_expr->expr_1), go(if_expr->expr_2),
                    go(if_expr->expr_3));
    }

    if (auto constZero = dynamic_cast<ConstZero *>(expr)) {
      return constZero->clone();
    }
    if (auto succ = dynamic_cast<Succ *>(expr)) {
      return new Succ(go(succ->expr_));
    }
    if (auto pred = dynamic_cast<Pred *>(expr)) {
      return new Pred(go(pred->expr_));
    }
    if (auto isZero = dynamic_cast<IsZero *>(expr)) {
      return new IsZero(go(isZero->expr_));
    }

    if (auto let = dynamic_cast<Let*>(expr)) {
      return new Let(go(let->expr_1), shiftFrom(k+1)(let->expr_2));
    }
    if (auto record = dynamic_cast<Record*>(expr)) {
      auto shiftField = [&](Binding *bind){
        return new Binding(bind->ident_, go(bind->expr_));
      };
      auto nmls = new ListBindingExpr();
      for (auto bind : *(record->listbindingexpr_)) {
        nmls->push_back(dynamic_cast<Binding*>(bind));
      }

      return new Record(nmls);
    }
    if (auto dot = dynamic_cast<Dot*>(expr)) {
      return new Dot(go(dot->expr_), dot->ident_);
    }

    return nullptr;
  };
  return go;
}

std::function<Expr *(Expr *)> shift() { return shiftFrom(0); }

std::function<Expr *(Expr *)> substitute(int n, Expr *s) {
  std::function<Expr *(Expr *)> go = [n, s, &go](Expr *expr) -> Expr * {
    if (auto m = dynamic_cast<BoundVar *>(expr)) {
      if (n == m->integer_) {
        return s->clone();
      }
      return expr->clone();
    }

    if (auto freeVar = dynamic_cast<FreeVar *>(expr)) {
      return expr->clone();
    }

    if (auto abstraction = dynamic_cast<Abstraction *>(expr)) {
      return new Abstraction(abstraction->type_,
                             substitute(n + 1, shift()(s))(abstraction->expr_));
    }

    if (auto application = dynamic_cast<Application *>(expr)) {
      return new Application(go(application->expr_1), go(application->expr_2));
    }

    if (auto constTrue = dynamic_cast<ConstTrue *>(expr)) {
      return constTrue->clone();
    }
    if (auto constFalse = dynamic_cast<ConstFalse *>(expr)) {
      return constFalse->clone();
    }
    if (auto expr_if = dynamic_cast<If *>(expr)) {
      return new If(go(expr_if->expr_1), go(expr_if->expr_2),
                    go(expr_if->expr_3));
    }

    if (auto constZero = dynamic_cast<ConstZero *>(expr)) {
      return constZero->clone();
    }
    if (auto succ = dynamic_cast<Succ *>(expr)) {
      return new Succ(go(succ->expr_));
    }
    if (auto pred = dynamic_cast<Pred *>(expr)) {
      return new Pred(go(pred->expr_));
    }
    if (auto isZero = dynamic_cast<IsZero *>(expr)) {
      return new IsZero(go(isZero->expr_));
    }

      if (auto let = dynamic_cast<Let*>(expr)) {
      return new Let(go(let->expr_1), substitute(n+1, shift()(s))(let->expr_2));
    }
    if (auto record = dynamic_cast<Record*>(expr)) {
      auto shiftField = [&](Binding *bind){
        return new Binding(bind->ident_, go(bind->expr_));
      };
      auto nmls = new ListBindingExpr();
      for (auto bind : *(record->listbindingexpr_)) {
        nmls->push_back(dynamic_cast<Binding*>(bind));
      }

      return new Record(nmls);
    }
    if (auto dot = dynamic_cast<Dot*>(expr)) {
      return new Dot(go(dot->expr_), dot->ident_);
    }

    return nullptr;
  };
  return go;
}

} // namespace Nameless
