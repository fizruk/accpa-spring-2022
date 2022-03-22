package Syntax.normal;
/** BNFC-Generated Composition Visitor
*/

public class ComposVisitor<A> implements
  Syntax.normal.Absyn.Program.Visitor<Syntax.normal.Absyn.Program,A>,
  Syntax.normal.Absyn.Expr.Visitor<Syntax.normal.Absyn.Expr,A>
{
    /* Program */
    public Syntax.normal.Absyn.Program visit(Syntax.normal.Absyn.ProgramExprs p, A arg)
    {
      Syntax.normal.Absyn.ListExpr listexpr_ = new Syntax.normal.Absyn.ListExpr();
      for (Syntax.normal.Absyn.Expr x : p.listexpr_)
      {
        listexpr_.add(x.accept(this,arg));
      }
      return new Syntax.normal.Absyn.ProgramExprs(listexpr_);
    }

    /* Expr */
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.ConstTrue p, A arg)
    {
      return new Syntax.normal.Absyn.ConstTrue();
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.ConstFalse p, A arg)
    {
      return new Syntax.normal.Absyn.ConstFalse();
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.If p, A arg)
    {
      Syntax.normal.Absyn.Expr expr_1 = p.expr_1.accept(this, arg);
      Syntax.normal.Absyn.Expr expr_2 = p.expr_2.accept(this, arg);
      Syntax.normal.Absyn.Expr expr_3 = p.expr_3.accept(this, arg);
      return new Syntax.normal.Absyn.If(expr_1, expr_2, expr_3);
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.ConstZero p, A arg)
    {
      return new Syntax.normal.Absyn.ConstZero();
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.Succ p, A arg)
    {
      Syntax.normal.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.normal.Absyn.Succ(expr_);
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.Pred p, A arg)
    {
      Syntax.normal.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.normal.Absyn.Pred(expr_);
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.IsZero p, A arg)
    {
      Syntax.normal.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.normal.Absyn.IsZero(expr_);
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.Var p, A arg)
    {
      String ident_ = p.ident_;
      return new Syntax.normal.Absyn.Var(ident_);
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.Abstraction p, A arg)
    {
      String ident_ = p.ident_;
      Syntax.normal.Absyn.Expr expr_ = p.expr_.accept(this, arg);
      return new Syntax.normal.Absyn.Abstraction(ident_, expr_);
    }
    public Syntax.normal.Absyn.Expr visit(Syntax.normal.Absyn.Application p, A arg)
    {
      Syntax.normal.Absyn.Expr expr_1 = p.expr_1.accept(this, arg);
      Syntax.normal.Absyn.Expr expr_2 = p.expr_2.accept(this, arg);
      return new Syntax.normal.Absyn.Application(expr_1, expr_2);
    }
}
