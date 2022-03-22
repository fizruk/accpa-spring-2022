package Syntax.nameless;
/** BNFC-Generated Composition Visitor
*/

public class ComposVisitor<A> implements
  Syntax.nameless.Absyn.Expr.Visitor<Syntax.nameless.Absyn.Expr,A>
{
    /* Expr */
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.ConstTrue p, A arg)
    {
      return new Syntax.nameless.Absyn.ConstTrue();
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.ConstFalse p, A arg)
    {
      return new Syntax.nameless.Absyn.ConstFalse();
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.If p, A arg)
    {
      Syntax.nameless.Absyn.Expr expr_1 = p.expr_1.accept(this, arg);
      Syntax.nameless.Absyn.Expr expr_2 = p.expr_2.accept(this, arg);
      Syntax.nameless.Absyn.Expr expr_3 = p.expr_3.accept(this, arg);
      return new Syntax.nameless.Absyn.If(expr_1, expr_2, expr_3);
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.ConstZero p, A arg)
    {
      return new Syntax.nameless.Absyn.ConstZero();
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.Succ p, A arg)
    {
      Syntax.nameless.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.nameless.Absyn.Succ(expr_);
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.Pred p, A arg)
    {
      Syntax.nameless.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.nameless.Absyn.Pred(expr_);
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.IsZero p, A arg)
    {
      Syntax.nameless.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.nameless.Absyn.IsZero(expr_);
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.FreeVar p, A arg)
    {
      String ident_ = p.ident_;
      return new Syntax.nameless.Absyn.FreeVar(ident_);
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.BoundVar p, A arg)
    {
      Integer integer_ = p.integer_;
      return new Syntax.nameless.Absyn.BoundVar(integer_);
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.Abstraction p, A arg)
    {
      Syntax.nameless.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.nameless.Absyn.Abstraction(expr_);
    }
    public Syntax.nameless.Absyn.Expr visit(Syntax.nameless.Absyn.Application p, A arg)
    {
      Syntax.nameless.Absyn.Expr expr_1 = p.expr_1.accept(this, arg);
      Syntax.nameless.Absyn.Expr expr_2 = p.expr_2.accept(this, arg);
      return new Syntax.nameless.Absyn.Application(expr_1, expr_2);
    }
}
