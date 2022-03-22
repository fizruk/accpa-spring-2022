package Syntax.normal;

/*** BNFC-Generated Visitor Design Pattern Skeleton. ***/

/* This implements the common visitor design pattern.
   Tests show it to be slightly less efficient than the
   instanceof method, but easier to use.
   Replace the R and A parameters with the desired return
   and context types.*/

public class VisitSkel
{
  public class ProgramVisitor<R,A> implements Syntax.normal.Absyn.Program.Visitor<R,A>
  {
    public R visit(Syntax.normal.Absyn.ProgramExprs p, A arg)
    { /* Code for ProgramExprs goes here */
      for (Syntax.normal.Absyn.Expr x: p.listexpr_) {
        x.accept(new ExprVisitor<R,A>(), arg);
      }
      return null;
    }
  }
  public class ExprVisitor<R,A> implements Syntax.normal.Absyn.Expr.Visitor<R,A>
  {
    public R visit(Syntax.normal.Absyn.ConstTrue p, A arg)
    { /* Code for ConstTrue goes here */
      return null;
    }
    public R visit(Syntax.normal.Absyn.ConstFalse p, A arg)
    { /* Code for ConstFalse goes here */
      return null;
    }
    public R visit(Syntax.normal.Absyn.If p, A arg)
    { /* Code for If goes here */
      p.expr_1.accept(new ExprVisitor<R,A>(), arg);
      p.expr_2.accept(new ExprVisitor<R,A>(), arg);
      p.expr_3.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.normal.Absyn.ConstZero p, A arg)
    { /* Code for ConstZero goes here */
      return null;
    }
    public R visit(Syntax.normal.Absyn.Succ p, A arg)
    { /* Code for Succ goes here */
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.normal.Absyn.Pred p, A arg)
    { /* Code for Pred goes here */
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.normal.Absyn.IsZero p, A arg)
    { /* Code for IsZero goes here */
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.normal.Absyn.Var p, A arg)
    { /* Code for Var goes here */
      //p.ident_;
      return null;
    }
    public R visit(Syntax.normal.Absyn.Abstraction p, A arg)
    { /* Code for Abstraction goes here */
      //p.ident_;
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.normal.Absyn.Application p, A arg)
    { /* Code for Application goes here */
      p.expr_1.accept(new ExprVisitor<R,A>(), arg);
      p.expr_2.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
  }
}
