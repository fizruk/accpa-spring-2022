package Syntax.nameless;

/*** BNFC-Generated Visitor Design Pattern Skeleton. ***/

/* This implements the common visitor design pattern.
   Tests show it to be slightly less efficient than the
   instanceof method, but easier to use.
   Replace the R and A parameters with the desired return
   and context types.*/

public class VisitSkel
{
  public class ExprVisitor<R,A> implements Syntax.nameless.Absyn.Expr.Visitor<R,A>
  {
    public R visit(Syntax.nameless.Absyn.ConstTrue p, A arg)
    { /* Code for ConstTrue goes here */
      return null;
    }
    public R visit(Syntax.nameless.Absyn.ConstFalse p, A arg)
    { /* Code for ConstFalse goes here */
      return null;
    }
    public R visit(Syntax.nameless.Absyn.If p, A arg)
    { /* Code for If goes here */
      p.expr_1.accept(new ExprVisitor<R,A>(), arg);
      p.expr_2.accept(new ExprVisitor<R,A>(), arg);
      p.expr_3.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.nameless.Absyn.ConstZero p, A arg)
    { /* Code for ConstZero goes here */
      return null;
    }
    public R visit(Syntax.nameless.Absyn.Succ p, A arg)
    { /* Code for Succ goes here */
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.nameless.Absyn.Pred p, A arg)
    { /* Code for Pred goes here */
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.nameless.Absyn.IsZero p, A arg)
    { /* Code for IsZero goes here */
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.nameless.Absyn.FreeVar p, A arg)
    { /* Code for FreeVar goes here */
      //p.ident_;
      return null;
    }
    public R visit(Syntax.nameless.Absyn.BoundVar p, A arg)
    { /* Code for BoundVar goes here */
      //p.integer_;
      return null;
    }
    public R visit(Syntax.nameless.Absyn.Abstraction p, A arg)
    { /* Code for Abstraction goes here */
      p.expr_.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
    public R visit(Syntax.nameless.Absyn.Application p, A arg)
    { /* Code for Application goes here */
      p.expr_1.accept(new ExprVisitor<R,A>(), arg);
      p.expr_2.accept(new ExprVisitor<R,A>(), arg);
      return null;
    }
  }
}
