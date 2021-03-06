/* File generated by the BNF Converter (bnfc 2.9.4). */

#ifndef NAMELESS_ABSYN_HEADER
#define NAMELESS_ABSYN_HEADER

#include<string>
#include<vector>

//C++ Abstract Syntax Interface.
namespace Nameless
{
/********************   TypeDef Section    ********************/

typedef int Integer;
typedef char Char;
typedef double Double;
typedef std::string String;
typedef std::string Ident;




/********************   Forward Declarations    ********************/

class Expr;
class ConstTrue;
class ConstFalse;
class If;
class ConstZero;
class Succ;
class Pred;
class IsZero;
class FreeVar;
class BoundVar;
class Abstraction;
class Application;


/********************   Visitor Interfaces    ********************/
class Visitor
{
public:
  virtual ~Visitor() {}
  virtual void visitExpr(Expr *p) = 0;
  virtual void visitConstTrue(ConstTrue *p) = 0;
  virtual void visitConstFalse(ConstFalse *p) = 0;
  virtual void visitIf(If *p) = 0;
  virtual void visitConstZero(ConstZero *p) = 0;
  virtual void visitSucc(Succ *p) = 0;
  virtual void visitPred(Pred *p) = 0;
  virtual void visitIsZero(IsZero *p) = 0;
  virtual void visitFreeVar(FreeVar *p) = 0;
  virtual void visitBoundVar(BoundVar *p) = 0;
  virtual void visitAbstraction(Abstraction *p) = 0;
  virtual void visitApplication(Application *p) = 0;


  virtual void visitInteger(Integer x) = 0;
  virtual void visitChar(Char x) = 0;
  virtual void visitDouble(Double x) = 0;
  virtual void visitString(String x) = 0;
  virtual void visitIdent(Ident x) = 0;

};


class Visitable
{
 public:
  virtual ~Visitable() {}
  virtual void accept(Visitor *v) = 0;
};


/********************   Abstract Syntax Classes    ********************/

class Expr : public Visitable
{
public:
  virtual Expr *clone() const = 0;
  int line_number, char_number;
};



class ConstTrue : public Expr
{
public:

  ConstTrue(const ConstTrue &);
  ConstTrue &operator=(const ConstTrue &);
  ConstTrue();
  ~ConstTrue();
  virtual void accept(Visitor *v);
  virtual ConstTrue *clone() const;
  void swap(ConstTrue &);
};

class ConstFalse : public Expr
{
public:

  ConstFalse(const ConstFalse &);
  ConstFalse &operator=(const ConstFalse &);
  ConstFalse();
  ~ConstFalse();
  virtual void accept(Visitor *v);
  virtual ConstFalse *clone() const;
  void swap(ConstFalse &);
};

class If : public Expr
{
public:
  Expr *expr_1;
  Expr *expr_2;
  Expr *expr_3;

  If(const If &);
  If &operator=(const If &);
  If(Expr *p1, Expr *p2, Expr *p3);
  ~If();
  virtual void accept(Visitor *v);
  virtual If *clone() const;
  void swap(If &);
};

class ConstZero : public Expr
{
public:

  ConstZero(const ConstZero &);
  ConstZero &operator=(const ConstZero &);
  ConstZero();
  ~ConstZero();
  virtual void accept(Visitor *v);
  virtual ConstZero *clone() const;
  void swap(ConstZero &);
};

class Succ : public Expr
{
public:
  Expr *expr_;

  Succ(const Succ &);
  Succ &operator=(const Succ &);
  Succ(Expr *p1);
  ~Succ();
  virtual void accept(Visitor *v);
  virtual Succ *clone() const;
  void swap(Succ &);
};

class Pred : public Expr
{
public:
  Expr *expr_;

  Pred(const Pred &);
  Pred &operator=(const Pred &);
  Pred(Expr *p1);
  ~Pred();
  virtual void accept(Visitor *v);
  virtual Pred *clone() const;
  void swap(Pred &);
};

class IsZero : public Expr
{
public:
  Expr *expr_;

  IsZero(const IsZero &);
  IsZero &operator=(const IsZero &);
  IsZero(Expr *p1);
  ~IsZero();
  virtual void accept(Visitor *v);
  virtual IsZero *clone() const;
  void swap(IsZero &);
};

class FreeVar : public Expr
{
public:
  Ident ident_;

  FreeVar(const FreeVar &);
  FreeVar &operator=(const FreeVar &);
  FreeVar(Ident p1);
  ~FreeVar();
  virtual void accept(Visitor *v);
  virtual FreeVar *clone() const;
  void swap(FreeVar &);
};

class BoundVar : public Expr
{
public:
  Integer integer_;

  BoundVar(const BoundVar &);
  BoundVar &operator=(const BoundVar &);
  BoundVar(Integer p1);
  ~BoundVar();
  virtual void accept(Visitor *v);
  virtual BoundVar *clone() const;
  void swap(BoundVar &);
};

class Abstraction : public Expr
{
public:
  Expr *expr_;

  Abstraction(const Abstraction &);
  Abstraction &operator=(const Abstraction &);
  Abstraction(Expr *p1);
  ~Abstraction();
  virtual void accept(Visitor *v);
  virtual Abstraction *clone() const;
  void swap(Abstraction &);
};

class Application : public Expr
{
public:
  Expr *expr_1;
  Expr *expr_2;

  Application(const Application &);
  Application &operator=(const Application &);
  Application(Expr *p1, Expr *p2);
  ~Application();
  virtual void accept(Visitor *v);
  virtual Application *clone() const;
  void swap(Application &);
};






}
#endif
