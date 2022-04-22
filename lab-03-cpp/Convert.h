#pragma once

#include <algorithm>
#include <functional>
#include <list>
#include <memory>

#include "Syntax/Nameless/Absyn.H"
#include "Syntax/Normal/Absyn.H"

namespace Convert {
Nameless::Type *toNamelessType(Normal::Type *ty);
Normal::Type *fromNamelessType(Nameless::Type *ty);

std::function<Nameless::Expr *(Normal::Expr *)>
    toNameless(std::shared_ptr<std::list<Normal::Ident>>);

Nameless::Expr *toNameless_(Normal::Expr *expr) {
  auto vars = std::make_shared<std::list<Normal::Ident>>();
  return toNameless(vars)(expr);
}

std::function<Nameless::Expr *(Normal::Expr *)>
toNameless(std::shared_ptr<std::list<Normal::Ident>> vars) {
  std::function<Nameless::Expr *(Normal::Expr *)> go =
      [&vars, &go](Normal::Expr *expr) -> Nameless::Expr * {
    if (dynamic_cast<Normal::ConstTrue *>(expr)) {
      return new Nameless::ConstTrue();
    }
    if (dynamic_cast<Normal::ConstFalse *>(expr)) {
      return new Nameless::ConstFalse();
    }
    if (auto if_expr = dynamic_cast<Normal::If *>(expr)) {
      return new Nameless::If(go(if_expr->expr_1), go(if_expr->expr_2),
                              go(if_expr->expr_3));
    }

    if (dynamic_cast<Normal::ConstZero *>(expr)) {
      return new Nameless::ConstZero();
    }
    if (auto succ = dynamic_cast<Normal::Succ *>(expr)) {
      return new Nameless::Succ(go(succ->expr_));
    }
    if (auto pred = dynamic_cast<Normal::Pred *>(expr)) {
      return new Nameless::Pred(go(pred->expr_));
    }
    if (auto isZero = dynamic_cast<Normal::IsZero *>(expr)) {
      return new Nameless::IsZero(go(isZero->expr_));
    }

    if (auto var = dynamic_cast<Normal::Var *>(expr)) {
      int idx = 0;
      for (auto el : *vars) {
        if (var->ident_ == el) {
          return new Nameless::BoundVar(idx);
        }
        idx++;
      }
      return new Nameless::FreeVar(var->ident_);
    }

    if (auto abstraction = dynamic_cast<Normal::Abstraction *>(expr)) {
      auto newVars = std::make_shared<std::list<Normal::Ident>>(vars->begin(),
                                                                vars->end());
      newVars->push_front(abstraction->ident_);
      return new Nameless::Abstraction(toNamelessType(abstraction->type_),
                                       toNameless(newVars)(abstraction->expr_));
    }
    if (auto application = dynamic_cast<Normal::Application *>(expr)) {
      return new Nameless::Application(go(application->expr_1),
                                       go(application->expr_2));
    }

    if (auto let = dynamic_cast<Normal::Let *>(expr)) {
      auto newVars = std::make_shared<std::list<Normal::Ident>>(vars->begin(),
                                                                vars->end());
      newVars->push_front(let->ident_);
      return new Nameless::Let(go(let->expr_1),
                               toNameless(newVars)(let->expr_2));
    }

    if (auto record = dynamic_cast<Normal::Record *>(expr)) {
      auto toNamelessField = [&](Normal::Binding *binding) {
        return new Nameless::Binding(binding->ident_, go(binding->expr_));
      };
      auto nmls = new Nameless::ListBindingExpr();
      for (auto binding : *(record->listbindingexpr_)) {
        nmls->push_back(
            toNamelessField(dynamic_cast<Normal::Binding *>(binding)));
      }
      return new Nameless::Record(nmls);
    }

    if (auto dot = dynamic_cast<Normal::Dot *>(expr)) {
      return new Nameless::Dot(go(dot->expr_), dot->ident_);
    }

    return nullptr;
  };
  return go;
}

std::function<Normal::Expr *(Nameless::Expr *)>
fromNameless(std::shared_ptr<std::list<Normal::Ident>> used);

int var_start = 1;
Normal::Ident pop_var() { return "x" + std::to_string(var_start++); }

class VarGenerator {
  int _num = 1;

public:
  Normal::Ident pop_var() { return "x" + std::to_string(_num++); }
};

Normal::Expr *fromNameless_(Nameless::Expr *expr) {
  var_start = 1;
  auto used = std::make_shared<std::list<Normal::Ident>>();
  return fromNameless(used)(expr);
}

std::function<Normal::Expr *(Nameless::Expr *)>
fromNameless(std::shared_ptr<std::list<Normal::Ident>> used) {
  std::function<Normal::Expr *(Nameless::Expr *)> go =
      [&used, &go](Nameless::Expr *expr) -> Normal::Expr * {
    if (dynamic_cast<Nameless::ConstTrue *>(expr)) {
      return new Normal::ConstTrue();
    }
    if (dynamic_cast<Nameless::ConstFalse *>(expr)) {
      return new Normal::ConstFalse();
    }
    if (auto if_expr = dynamic_cast<Nameless::If *>(expr)) {
      return new Normal::If(go(if_expr->expr_1), go(if_expr->expr_2),
                            go(if_expr->expr_3));
    }

    if (dynamic_cast<Nameless::ConstZero *>(expr)) {
      return new Normal::ConstZero();
    }
    if (auto succ = dynamic_cast<Nameless::Succ *>(expr)) {
      return new Normal::Succ(go(succ->expr_));
    }
    if (auto pred = dynamic_cast<Nameless::Pred *>(expr)) {
      return new Normal::Pred(go(pred->expr_));
    }
    if (auto isZero = dynamic_cast<Nameless::IsZero *>(expr)) {
      return new Normal::IsZero(go(isZero->expr_));
    }

    if (auto freeVar = dynamic_cast<Nameless::FreeVar *>(expr)) {
      return new Normal::Var(freeVar->ident_);
    }
    if (auto boundVar = dynamic_cast<Nameless::BoundVar *>(expr)) {
      auto it = used->cbegin();
      std::advance(it, boundVar->integer_);
      return new Normal::Var(*it);
    }

    if (auto abstraction = dynamic_cast<Nameless::Abstraction *>(expr)) {
      auto z = pop_var();
      auto newUsed = std::make_shared<std::list<Normal::Ident>>(used->begin(),
                                                                used->end());
      newUsed->push_front(z);

      return new Normal::Abstraction(
          z, fromNamelessType(abstraction->type_),
          (fromNameless(newUsed)(abstraction->expr_)));
    }
    if (auto applicaion = dynamic_cast<Nameless::Application *>(expr)) {
      return new Normal::Application(go(applicaion->expr_1),
                                     go(applicaion->expr_2));
    }

    if (auto let = dynamic_cast<Nameless::Let *>(expr)) {
      auto z = pop_var();
      auto newUsed = std::make_shared<std::list<Normal::Ident>>(used->begin(),
                                                                used->end());
      newUsed->push_front(z);

      return new Normal::Let(z, go(let->expr_1),
                             fromNameless(newUsed)(let->expr_2));
    }

    if (auto record = dynamic_cast<Nameless::Record *>(expr)) {
      auto fromNamelessField = [&](Nameless::Binding *binding) {
        return new Normal::Binding(binding->ident_, go(binding->expr_));
      };
      auto nrml = new Normal::ListBindingExpr();
      for (auto binding : *(record->listbindingexpr_)) {
        nrml->push_back(
            fromNamelessField(dynamic_cast<Nameless::Binding *>(binding)));
      }
      return new Normal::Record(nrml);
    }

    if (auto dot = dynamic_cast<Nameless::Dot *>(expr)) {
      return new Normal::Dot(go(dot->expr_), dot->ident_);
    }

    return nullptr;
  };
  return go;
}

Nameless::Type *toNamelessType(Normal::Type *ty) {
  if (dynamic_cast<Normal::BoolType *>(ty)) {
    return new Nameless::BoolType();
  }
  if (dynamic_cast<Normal::NatType *>(ty)) {
    return new Nameless::NatType();
  }
  if (auto fun_type = dynamic_cast<Normal::FunType *>(ty)) {
    return new Nameless::FunType(toNamelessType(fun_type->type_1),
                                 toNamelessType(fun_type->type_2));
  }
  if (auto record_type = dynamic_cast<Normal::RecordType *>(ty)) {
    auto convertField = [&](Normal::FieldType *field_type) {
      return new Nameless::FieldType(field_type->ident_,
                                     toNamelessType(field_type->type_));
    };
    auto nmls = new Nameless::ListFieldTypeExpr();
    for (auto binding : *(record_type->listfieldtypeexpr_)) {
      nmls->push_back(convertField(dynamic_cast<Normal::FieldType *>(binding)));
    }
    return new Nameless::RecordType(nmls);
  }

  return nullptr;
}

Normal::Type *fromNamelessType(Nameless::Type *ty) {
  if (dynamic_cast<Nameless::BoolType *>(ty)) {
    return new Normal::BoolType();
  }
  if (dynamic_cast<Nameless::NatType *>(ty)) {
    return new Normal::NatType();
  }
  if (auto fun_type = dynamic_cast<Nameless::FunType *>(ty)) {
    return new Normal::FunType(fromNamelessType(fun_type->type_1),
                               fromNamelessType(fun_type->type_2));
  }
  if (auto record_type = dynamic_cast<Nameless::RecordType *>(ty)) {
    auto convertField = [&](Nameless::FieldType *field_type) {
      return new Normal::FieldType(field_type->ident_,
                                     fromNamelessType(field_type->type_));
    };
    auto nmls = new Normal::ListFieldTypeExpr();
    for (auto binding : *(record_type->listfieldtypeexpr_)) {
      nmls->push_back(convertField(dynamic_cast<Nameless::FieldType *>(binding)));
    }
    return new Normal::RecordType(nmls);
  }

  return nullptr;
}

} // namespace Convert
