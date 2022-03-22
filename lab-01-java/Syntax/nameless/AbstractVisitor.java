package Syntax.nameless;

/** BNFC-Generated Abstract Visitor */

public class AbstractVisitor<R,A> implements AllVisitor<R,A> {
    /* Expr */
    public R visit(Syntax.nameless.Absyn.ConstTrue p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.ConstFalse p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.If p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.ConstZero p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.Succ p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.Pred p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.IsZero p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.FreeVar p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.BoundVar p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.Abstraction p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.nameless.Absyn.Application p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(Syntax.nameless.Absyn.Expr p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }

}
