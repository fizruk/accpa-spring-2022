#ifndef SKELETON_HEADER
#define SKELETON_HEADER
/* You might want to change the above name. */

#include "Absyn.H"


class Skeleton : public Visitor
{
public:
  void visitExpr(Expr *p);
  void visitConstTrue(ConstTrue *p);
  void visitConstFalse(ConstFalse *p);
  void visitIf(If *p);
  void visitConstZero(ConstZero *p);
  void visitSucc(Succ *p);
  void visitPred(Pred *p);
  void visitIsZero(IsZero *p);
  void visitFreeVar(FreeVar *p);
  void visitBoundVar(BoundVar *p);
  void visitAbstraction(Abstraction *p);
  void visitApplication(Application *p);

  void visitInteger(Integer x);
  void visitChar(Char x);
  void visitDouble(Double x);
  void visitString(String x);
  void visitIdent(Ident x);

};


#endif
