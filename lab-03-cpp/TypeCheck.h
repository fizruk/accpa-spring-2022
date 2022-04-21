#pragma once

#include <map>
#include <sstream>
#include <typeinfo>
#include <utility>

#include "Syntax/Normal/Absyn.H"
#include "Syntax/Normal/Printer.H"

namespace TypeCheck {
typedef std::map<Normal::Ident, Normal::Type *> Context;

std::string expectedField(Normal::TypingStmt *expr, Normal::Ident ident) {
  if (!expr) {
    return std::string();
  }
  auto printer = Normal::PrintAbsyn();
  auto ss = std::stringstream();
  ss << "expected field\n  " << ident << "\nwhich is missing in the type\n"
     << printer.print(expr->type_) << "\nof the expression\n  "
     << printer.print(expr->expr_);
  return ss.str();
}

std::string expectedFunType(Normal::Expr *expr, Normal::Type *actual) {
  if (!expr || !actual) {
    return std::string();
  }
  auto printer = Normal::PrintAbsyn();
  auto ss = std::stringstream();
  ss << "expected function type"
     << "\nbut actual type is\n  " << printer.print(actual)
     << "\nfor the expression\n  " << printer.print(expr) << "\n";
  return ss.str();
}

std::string expectedRecordType(Normal::Expr *expr, Normal::Type *actual) {
  if (!expr || !actual) {
    return std::string();
  }
  auto printer = Normal::PrintAbsyn();
  auto ss = std::stringstream();
  ss << "expected record type\nbut actual type is\n  " << printer.print(actual)
     << "\nfor the expression\n  " << printer.print(expr) << "\n";
  return ss.str();
}

std::string typeMismatch(Normal::TypingStmt *expr, Normal::Type *actual) {
  if (!expr || !actual) {
    return std::string();
  }
  auto printer = Normal::PrintAbsyn();
  auto ss = std::stringstream();
  ss << "expected type\n  " << printer.print(expr->type_)
     << "\nbut actual type is\n  " << printer.print(actual)
     << "\nfor the expression\n  " << printer.print(expr->expr_) << "\n";
  return ss.str();
}

std::string undefinedVar(Normal::Expr *expr) {
  auto printer = Normal::PrintAbsyn();
  auto ss = std::stringstream();
  ss << "undefined variable with unknown type\n  " << printer.print(expr)
     << "\n";
  return ss.str();
}

std::variant<std::string, Normal::Type *> typeOf(const Context &,
                                                 Normal::Expr *);

bool compareTypes(Normal::Type *type1, Normal::Type *type2) {
  // auto printer = Normal::PrintAbsyn();
  // std::cout << "TYPE 1:\n"
  //           << printer.print(type1) << "\n"
  //           << "TYPE 2:\n"
  //           << printer.print(type2) << "\n";
  if (auto rt1 = dynamic_cast<Normal::RecordType *>(type1)) {
    if (auto rt2 = dynamic_cast<Normal::RecordType *>(type2)) {
      if (rt1->listfieldtypeexpr_->size() != rt2->listfieldtypeexpr_->size()) {
        return false;
      }
      for (int i = 0; i < rt1->listfieldtypeexpr_->size(); ++i) {
        auto t1 =
            dynamic_cast<Normal::FieldType *>(rt1->listfieldtypeexpr_->at(i));
        auto t2 =
            dynamic_cast<Normal::FieldType *>(rt2->listfieldtypeexpr_->at(i));
        if (!t1 || !t2) {
          return false;
        }
        if (typeid(*(t1->type_)) != typeid(*(t2->type_))) {
          return false;
        }
      }
      return true;
    }

    return false;
  }
  auto res = typeid(*type1) == typeid(*type2);
  return res;
}

std::variant<std::string, Normal::TypingStmt *>
typecheck(const Context &context, Normal::TypingStmt *typing) {
  auto actualType = typeOf(context, typing->expr_);
  try {
    if (compareTypes(std::get<Normal::Type *>(actualType), typing->type_)) {
      return typing->clone();
    }
    return typeMismatch(typing, std::get<Normal::Type *>(actualType));
  }
  catch (const std::bad_variant_access &ex) {
    return std::get<std::string>(actualType);
  }
  return {};
}

Normal::Type *lookupFieldType(const Normal::Ident &ident,
                              Normal::ListFieldTypeExpr *fields) {
  for (auto type_expr : *fields) {
    if (auto type = dynamic_cast<Normal::FieldType *>(type_expr)) {
      if (type->ident_ == ident) {
        return type->type_;
      }
    }
  }
  return nullptr;
}

std::variant<std::string, Normal::Type *> typeOf(const Context &context,
                                                 Normal::Expr *expr) {
  if (dynamic_cast<Normal::ConstTrue *>(expr)) {
    return new Normal::BoolType();
  }
  if (dynamic_cast<Normal::ConstFalse *>(expr)) {
    return new Normal::BoolType();
  }
  if (auto if_expr = dynamic_cast<Normal::If *>(expr)) {
    std::variant<std::string, Normal::TypingStmt *> check_result;
    try {
      check_result =
          typecheck(context, new Normal::TypingStmt(if_expr->expr_1->clone(),
                                                    new Normal::BoolType()));
      std::get<Normal::TypingStmt *>(check_result);
      auto tmp = typeOf(context, if_expr->expr_2);
      Normal::Type *typeOfThen = std::get<Normal::Type *>(tmp);

      check_result =
          typecheck(context, new Normal::TypingStmt(if_expr->expr_3->clone(),
                                                    (typeOfThen)));
      std::get<Normal::TypingStmt *>(check_result);
      return typeOfThen->clone();
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(check_result);
    }
    return {};
  }

  if (dynamic_cast<Normal::ConstZero *>(expr)) {
    return new Normal::NatType();
  }
  if (auto succ = dynamic_cast<Normal::Succ *>(expr)) {
    std::variant<std::string, Normal::TypingStmt *> check_result;
    try {
      check_result =
          typecheck(context, new Normal::TypingStmt(succ->expr_->clone(),
                                                    new Normal::NatType()));
      std::get<Normal::TypingStmt *>(check_result);
      return new Normal::NatType();
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(check_result);
    }
    return {};
  }
  if (auto pred = dynamic_cast<Normal::Pred *>(expr)) {
    std::variant<std::string, Normal::TypingStmt *> check_result;
    try {
      check_result =
          typecheck(context, new Normal::TypingStmt(pred->expr_->clone(),
                                                    new Normal::NatType()));
      std::get<Normal::TypingStmt *>(check_result);
      return new Normal::NatType();
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(check_result);
    }
    return {};
  }
  if (auto zero = dynamic_cast<Normal::IsZero *>(expr)) {
    std::variant<std::string, Normal::TypingStmt *> check_result;
    try {
      check_result =
          typecheck(context, new Normal::TypingStmt(zero->expr_->clone(),
                                                    new Normal::NatType()));
      std::get<Normal::TypingStmt *>(check_result);
      return new Normal::BoolType();
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(check_result);
    }
    return {};
  }

  if (auto var = dynamic_cast<Normal::Var *>(expr)) {
    auto it = context.find(var->ident_);
    if (it == context.end()) {
      return undefinedVar(expr);
    }

    return it->second;
  }

  if (auto app = dynamic_cast<Normal::Application *>(expr)) {
    auto typeOfFun = typeOf(context, app->expr_1);

    try {
      if (auto fun_type = dynamic_cast<Normal::FunType *>(
              std::get<Normal::Type *>(typeOfFun))) {
        auto check_result = typecheck(
            context, new Normal::TypingStmt(app->expr_2->clone(),
                                            fun_type->type_1->clone()));
        try {
          std::get<Normal::TypingStmt *>(check_result);
        }
        catch (const std::bad_variant_access &ex) {
          return std::get<std::string>(check_result);
        }
        return fun_type->type_2->clone();
      }
      else {
        return expectedFunType(app->expr_1,
                               std::get<Normal::Type *>(typeOfFun));
      }
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(typeOfFun);
    }
  }

  if (auto abstr = dynamic_cast<Normal::Abstraction *>(expr)) {
    auto newContext = context;
    newContext[abstr->ident_] = abstr->type_;
    auto typeOfBody = typeOf(newContext, abstr->expr_);
    try {
      return new Normal::FunType(abstr->type_->clone(),
                                 std::get<Normal::Type *>(typeOfBody)->clone());
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(typeOfBody);
    }
  }

  if (auto let = dynamic_cast<Normal::Let *>(expr)) {
    auto typeOfX = typeOf(context, let->expr_1);
    try {
      auto newContext = context;
      newContext[let->ident_] = std::get<Normal::Type *>(typeOfX);
      auto typeOfResult = typeOf(newContext, let->expr_2);
      return typeOfResult;
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(typeOfX);
    }
    return {};
  }
  if (auto record = dynamic_cast<Normal::Record *>(expr)) {
    auto nrml = new Normal::ListFieldTypeExpr();
    for (auto b : *(record->listbindingexpr_)) {
      if (auto binding = dynamic_cast<Normal::Binding *>(b)) {
        auto ty = typeOf(context, binding->expr_);
        try {
          nrml->push_back(new Normal::FieldType(binding->ident_,
                                                std::get<Normal::Type *>(ty)));
        }
        catch (const std::bad_variant_access &ex) {
          return std::get<std::string>(ty);
        }
      }
    }
    return new Normal::RecordType(nrml);
  }

  if (auto dot = dynamic_cast<Normal::Dot *>(expr)) {
    auto tyo = typeOf(context, dot->expr_);
    try {
      auto ty = std::get<Normal::Type *>(tyo);
      if (auto record_type = dynamic_cast<Normal::RecordType *>(ty)) {
        if (auto typeOfX =
                lookupFieldType(dot->ident_, record_type->listfieldtypeexpr_)) {
          return typeOfX;
        }
        return expectedField(new Normal::TypingStmt(dot->expr_->clone(), ty),
                             dot->ident_);
      }
      return expectedRecordType(dot->expr_, ty);
    }
    catch (const std::bad_variant_access &ex) {
      return std::get<std::string>(tyo);
    }
  }

  return {};
}

} // namespace TypeCheck