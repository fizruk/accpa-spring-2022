package Syntax.normal;

/** BNFC-Generated Abstract Visitor */

public class AbstractVisitor<R,A> implements AllVisitor<R,A> {
    /* Program */
    public R visit(Syntax.normal.Absyn.ProgramExprs p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(Syntax.normal.Absyn.Program p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }
    /* Expr */
    public R visit(Syntax.normal.Absyn.ConstTrue p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.ConstFalse p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.If p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.ConstZero p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.Succ p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.Pred p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.IsZero p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.Var p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.Abstraction p, A arg) { return visitDefault(p, arg); }
    public R visit(Syntax.normal.Absyn.Application p, A arg) { return visitDefault(p, arg); }
    public R visitDefault(Syntax.normal.Absyn.Expr p, A arg) {
      throw new IllegalArgumentException(this.getClass().getName() + ": " + p);
    }

}
