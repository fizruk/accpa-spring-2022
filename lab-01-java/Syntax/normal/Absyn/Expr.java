package Syntax.normal.Absyn; // Java Package generated by the BNF Converter.

public abstract class Expr implements java.io.Serializable {
  public abstract <R,A> R accept(Expr.Visitor<R,A> v, A arg);
  public interface Visitor <R,A> {
    public R visit(Syntax.normal.Absyn.ConstTrue p, A arg);
    public R visit(Syntax.normal.Absyn.ConstFalse p, A arg);
    public R visit(Syntax.normal.Absyn.If p, A arg);
    public R visit(Syntax.normal.Absyn.ConstZero p, A arg);
    public R visit(Syntax.normal.Absyn.Succ p, A arg);
    public R visit(Syntax.normal.Absyn.Pred p, A arg);
    public R visit(Syntax.normal.Absyn.IsZero p, A arg);
    public R visit(Syntax.normal.Absyn.Var p, A arg);
    public R visit(Syntax.normal.Absyn.Abstraction p, A arg);
    public R visit(Syntax.normal.Absyn.Application p, A arg);

  }

}
