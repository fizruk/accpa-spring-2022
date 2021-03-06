/* File generated by the BNF Converter (bnfc 2.9.4). */

#ifndef NAMELESS_PRINTER_HEADER
#define NAMELESS_PRINTER_HEADER

#include "Absyn.H"
#include <stdio.h>
#include <stddef.h>
#include <string.h>
#include <stdlib.h>

namespace Nameless
{
/* Certain applications may improve performance by changing the buffer size */
#define NAMELESS_BUFFER_INITIAL 2000
/* You may wish to change _L_PAREN or _R_PAREN */
#define NAMELESS__L_PAREN '('
#define NAMELESS__R_PAREN ')'

class PrintAbsyn : public Visitor
{
 protected:
  int _n_, _i_;
  /* The following are simple heuristics for rendering terminals */
  /* You may wish to change them */
  void render(Char c);
  void render(String s);
  void render(const char *s);
  void indent(void);
  void backup(void);
  void onEmptyLine(void);
  void removeTrailingSpaces(void);
  void removeTrailingWhitespace(void);
 public:
  PrintAbsyn(void);
  ~PrintAbsyn(void);
  char *print(Visitable *v);

  void visitProgram(Program *p); /* abstract class */
  void visitProgramExprs(ProgramExprs *p);
  void visitListExpr(ListExpr *p);
  void iterListExpr(ListExpr::const_iterator i, ListExpr::const_iterator j);
  void visitExpr(Expr *p); /* abstract class */
  void visitIf(If *p);
  void visitLet(Let *p);
  void visitAbstraction(Abstraction *p);
  void visitRecord(Record *p);
  void visitApplication(Application *p);
  void visitSucc(Succ *p);
  void visitDot(Dot *p);
  void visitPred(Pred *p);
  void visitIsZero(IsZero *p);
  void visitConstTrue(ConstTrue *p);
  void visitConstFalse(ConstFalse *p);
  void visitConstZero(ConstZero *p);
  void visitFreeVar(FreeVar *p);
  void visitBoundVar(BoundVar *p);
  void visitBindingExpr(BindingExpr *p); /* abstract class */
  void visitBinding(Binding *p);
  void visitListBindingExpr(ListBindingExpr *p);
  void iterListBindingExpr(ListBindingExpr::const_iterator i, ListBindingExpr::const_iterator j);
  void visitType(Type *p); /* abstract class */
  void visitFunType(FunType *p);
  void visitRecordType(RecordType *p);
  void visitBoolType(BoolType *p);
  void visitNatType(NatType *p);
  void visitFieldTypeExpr(FieldTypeExpr *p); /* abstract class */
  void visitFieldType(FieldType *p);
  void visitListFieldTypeExpr(ListFieldTypeExpr *p);
  void iterListFieldTypeExpr(ListFieldTypeExpr::const_iterator i, ListFieldTypeExpr::const_iterator j);
  void visitTyping(Typing *p); /* abstract class */
  void visitTypingStmt(TypingStmt *p);

  void visitInteger(Integer i);
  void visitDouble(Double d);
  void visitChar(Char c);
  void visitString(String s);
  void visitIdent(String s);
 protected:
  char *buf_;
  size_t cur_, buf_size;

  void inline bufAppend(const char *s)
  {
    size_t end = cur_ + strlen(s);
    if (end >= buf_size) {
      do buf_size *= 2; /* Double the buffer size */
      while (end >= buf_size);
      resizeBuffer();
    }
    strcpy(&buf_[cur_], s);
    cur_ = end;
  }

  void inline bufAppend(const char c)
  {
    if (cur_ + 1 >= buf_size)
    {
      buf_size *= 2; /* Double the buffer size */
      resizeBuffer();
    }
    buf_[cur_] = c;
    buf_[++cur_] = 0;
  }

  void inline bufAppend(String str)
  {
    const char *s = str.c_str();
    bufAppend(s);
  }
  void inline bufReset(void)
  {
    if (buf_) delete[] buf_;
    buf_size = NAMELESS_BUFFER_INITIAL;
    buf_ = new char[buf_size];
    memset(buf_, 0, buf_size);
    cur_ = 0;
  }

  void inline resizeBuffer(void)
  {
    char *temp = new char[buf_size];
    if (buf_)
    {
      strcpy(temp, buf_);
      delete[] buf_;
    }
    buf_ = temp;
  }
};



class ShowAbsyn : public Visitor
{
 public:
  ShowAbsyn(void);
  ~ShowAbsyn(void);
  char *show(Visitable *v);

  void visitProgram(Program *p); /* abstract class */
  void visitProgramExprs(ProgramExprs *p);
  void visitListExpr(ListExpr *p);
  void iterListExpr(ListExpr::const_iterator i, ListExpr::const_iterator j);
  void visitExpr(Expr *p); /* abstract class */
  void visitIf(If *p);
  void visitLet(Let *p);
  void visitAbstraction(Abstraction *p);
  void visitRecord(Record *p);
  void visitApplication(Application *p);
  void visitSucc(Succ *p);
  void visitDot(Dot *p);
  void visitPred(Pred *p);
  void visitIsZero(IsZero *p);
  void visitConstTrue(ConstTrue *p);
  void visitConstFalse(ConstFalse *p);
  void visitConstZero(ConstZero *p);
  void visitFreeVar(FreeVar *p);
  void visitBoundVar(BoundVar *p);
  void visitBindingExpr(BindingExpr *p); /* abstract class */
  void visitBinding(Binding *p);
  void visitListBindingExpr(ListBindingExpr *p);
  void iterListBindingExpr(ListBindingExpr::const_iterator i, ListBindingExpr::const_iterator j);
  void visitType(Type *p); /* abstract class */
  void visitFunType(FunType *p);
  void visitRecordType(RecordType *p);
  void visitBoolType(BoolType *p);
  void visitNatType(NatType *p);
  void visitFieldTypeExpr(FieldTypeExpr *p); /* abstract class */
  void visitFieldType(FieldType *p);
  void visitListFieldTypeExpr(ListFieldTypeExpr *p);
  void iterListFieldTypeExpr(ListFieldTypeExpr::const_iterator i, ListFieldTypeExpr::const_iterator j);
  void visitTyping(Typing *p); /* abstract class */
  void visitTypingStmt(TypingStmt *p);

  void visitInteger(Integer i);
  void visitDouble(Double d);
  void visitChar(Char c);
  void visitString(String s);
  void visitIdent(String s);
 protected:
  char *buf_;
  size_t cur_, buf_size;

  void inline bufAppend(const char *s)
  {
    size_t end = cur_ + strlen(s);
    if (end >= buf_size) {
      do buf_size *= 2; /* Double the buffer size */
      while (end >= buf_size);
      resizeBuffer();
    }
    strcpy(&buf_[cur_], s);
    cur_ = end;
  }

  void inline bufAppend(const char c)
  {
    if (cur_ + 1 >= buf_size)
    {
      buf_size *= 2; /* Double the buffer size */
      resizeBuffer();
    }
    buf_[cur_] = c;
    buf_[++cur_] = 0;
  }

  void inline bufAppend(String str)
  {
    const char *s = str.c_str();
    bufAppend(s);
  }
  void inline bufReset(void)
  {
    if (buf_) delete[] buf_;
    buf_size = NAMELESS_BUFFER_INITIAL;
    buf_ = new char[buf_size];
    memset(buf_, 0, buf_size);
    cur_ = 0;
  }

  void inline resizeBuffer(void)
  {
    char *temp = new char[buf_size];
    if (buf_)
    {
      strcpy(temp, buf_);
      delete[] buf_;
    }
    buf_ = temp;
  }
};


}

#endif

