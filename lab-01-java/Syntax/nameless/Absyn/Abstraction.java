package Syntax.nameless.Absyn; // Java Package generated by the BNF Converter.

public class Abstraction  extends Expr {
  public final Expr expr_;
  public Abstraction(Expr p1) { expr_ = p1; }

  public <R,A> R accept(Syntax.nameless.Absyn.Expr.Visitor<R,A> v, A arg) { return v.visit(this, arg); }

  public boolean equals(java.lang.Object o) {
    if (this == o) return true;
    if (o instanceof Syntax.nameless.Absyn.Abstraction) {
      Syntax.nameless.Absyn.Abstraction x = (Syntax.nameless.Absyn.Abstraction)o;
      return this.expr_.equals(x.expr_);
    }
    return false;
  }

  public int hashCode() {
    return this.expr_.hashCode();
  }


}
