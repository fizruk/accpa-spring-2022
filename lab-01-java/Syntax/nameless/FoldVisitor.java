package Syntax.nameless;

/** BNFC-Generated Fold Visitor */
public abstract class FoldVisitor<R,A> implements AllVisitor<R,A> {
    public abstract R leaf(A arg);
    public abstract R combine(R x, R y, A arg);

/* Expr */
    public R visit(Syntax.nameless.Absyn.ConstTrue p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.ConstFalse p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.If p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_1.accept(this, arg), r, arg);
      r = combine(p.expr_2.accept(this, arg), r, arg);
      r = combine(p.expr_3.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.ConstZero p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.Succ p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.Pred p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.IsZero p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.FreeVar p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.BoundVar p, A arg) {
      R r = leaf(arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.Abstraction p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_.accept(this, arg), r, arg);
      return r;
    }
    public R visit(Syntax.nameless.Absyn.Application p, A arg) {
      R r = leaf(arg);
      r = combine(p.expr_1.accept(this, arg), r, arg);
      r = combine(p.expr_2.accept(this, arg), r, arg);
      return r;
    }


}
