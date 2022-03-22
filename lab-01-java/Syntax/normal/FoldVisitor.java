package Syntax.normal;

/** BNFC-Generated Fold Visitor */
public abstract class FoldVisitor<R,A> implements AllVisitor<R,A> {
    public abstract R leaf(A arg);
    public abstract R combine(R x, R y, A arg);

/* Program */
    public R visit(Syntax.normal.Absyn.ProgramExprs p, A arg) {
      R r = leaf(arg);
      for (Syntax.normal.Absyn.Expr x : p.listexpr_)
      {
        r = combine(x.accept(this, arg), r, arg);
      }
      return r;
    }

/* Expr */
    public R visit(Syntax.normal.Absyn.ConstTrue p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.ConstFalse p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.If p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_1.accept(this, arg), r, arg);
      r = combine(p.expr_2.accept(this, arg), r, arg);
      r = combine(p.expr_3.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.ConstZero p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.Succ p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.Pred p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.IsZero p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.Var p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.Abstraction p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.normal.Absyn.Application p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_1.accept(this, arg), r, arg);
      r = combine(p.expr_2.accept(this, arg), r, arg);
      return r;
    }


}
