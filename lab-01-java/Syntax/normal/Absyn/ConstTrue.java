package Syntax.normal.Absyn; // Java Package generated by the BNF Converter.

public class ConstTrue  extends Expr {
  public ConstTrue() { }

  public <R,A> R accept(Syntax.normal.Absyn.Expr.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof Syntax.normal.Absyn.ConstTrue) {
      return true;
    }
    return false;
  }

  public int hashCode() {
    return 37;
  }


}
