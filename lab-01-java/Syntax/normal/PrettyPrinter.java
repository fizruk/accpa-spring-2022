package Syntax.normal;

public class PrettyPrinter
{
  //For certain applications increasing the initial size of the buffer may improve performance.
  private static final int INITIAL_BUFFER_SIZE = 128;
  private static final int INDENT_WIDTH = 2;
  //You may wish to change the parentheses used in precedence.
  private static final String _L_PAREN = new String("(");
  private static final String _R_PAREN = new String(")");
  //You may wish to change render
  private static void render(String s)
  {
    if (s.equals("{"))
    {
       buf_.append("\n");
       indent();
       buf_.append(s);
       _n_ = _n_ + INDENT_WIDTH;
       buf_.append("\n");
       indent();
    }
    else if (s.equals("(") || s.equals("["))
       buf_.append(s);
    else if (s.equals(")") || s.equals("]"))
    {
       backup();
       buf_.append(s);
       buf_.append(" ");
    }
    else if (s.equals("}"))
    {
       int t;
       _n_ = _n_ - INDENT_WIDTH;
       for(t=0; t<INDENT_WIDTH; t++) {
         backup();
       }
       buf_.append(s);
       buf_.append("\n");
       indent();
    }
    else if (s.equals(","))
    {
       backup();
       buf_.append(s);
       buf_.append(" ");
    }
    else if (s.equals(";"))
    {
       backup();
       buf_.append(s);
       buf_.append("\n");
       indent();
    }
    else if (s.equals("")) return;
    else if (s.trim().equals(""))
    {
       backup();
       buf_.append(s);
    }
    else
    {
       buf_.append(s);
       buf_.append(" ");
    }
  }


  //  print and show methods are defined for each category.
  public static String print(Syntax.normal.Absyn.Program foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(Syntax.normal.Absyn.Program foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(Syntax.normal.Absyn.ListExpr foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(Syntax.normal.Absyn.ListExpr foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String print(Syntax.normal.Absyn.Expr foo)
  {
    pp(foo, 0);
    trim();
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  public static String show(Syntax.normal.Absyn.Expr foo)
  {
    sh(foo);
    String temp = buf_.toString();
    buf_.delete(0,buf_.length());
    return temp;
  }
  /***   You shouldn't need to change anything beyond this point.   ***/

  private static void pp(Syntax.normal.Absyn.Program foo, int _i_)
  {
    if (foo instanceof Syntax.normal.Absyn.ProgramExprs)
    {
       Syntax.normal.Absyn.ProgramExprs _programexprs = (Syntax.normal.Absyn.ProgramExprs) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_programexprs.listexpr_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
  }

  private static void pp(Syntax.normal.Absyn.ListExpr foo, int _i_)
  {
     for (java.util.Iterator<Syntax.normal.Absyn.Expr> it = foo.iterator(); it.hasNext();)
     {
       pp(it.next(), _i_);
       if (it.hasNext()) {
         render(";");
       } else {
         render("");
       }
     }  }

  private static void pp(Syntax.normal.Absyn.Expr foo, int _i_)
  {
    if (foo instanceof Syntax.normal.Absyn.ConstTrue)
    {
       Syntax.normal.Absyn.ConstTrue _consttrue = (Syntax.normal.Absyn.ConstTrue) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("true");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.ConstFalse)
    {
       Syntax.normal.Absyn.ConstFalse _constfalse = (Syntax.normal.Absyn.ConstFalse) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("false");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.If)
    {
       Syntax.normal.Absyn.If _if = (Syntax.normal.Absyn.If) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("if");
       pp(_if.expr_1, 0);
       render("then");
       pp(_if.expr_2, 0);
       render("else");
       pp(_if.expr_3, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.ConstZero)
    {
       Syntax.normal.Absyn.ConstZero _constzero = (Syntax.normal.Absyn.ConstZero) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("0");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.Succ)
    {
       Syntax.normal.Absyn.Succ _succ = (Syntax.normal.Absyn.Succ) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("succ");
       pp(_succ.expr_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.Pred)
    {
       Syntax.normal.Absyn.Pred _pred = (Syntax.normal.Absyn.Pred) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("pred");
       pp(_pred.expr_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.IsZero)
    {
       Syntax.normal.Absyn.IsZero _iszero = (Syntax.normal.Absyn.IsZero) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("iszero");
       pp(_iszero.expr_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.Var)
    {
       Syntax.normal.Absyn.Var _var = (Syntax.normal.Absyn.Var) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_var.ident_, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.Abstraction)
    {
       Syntax.normal.Absyn.Abstraction _abstraction = (Syntax.normal.Absyn.Abstraction) foo;
       if (_i_ > 0) render(_L_PAREN);
       render("fun");
       render("(");
       pp(_abstraction.ident_, 0);
       render(")");
       render("{");
       render("return");
       pp(_abstraction.expr_, 0);
       render("}");
       if (_i_ > 0) render(_R_PAREN);
    }
    else     if (foo instanceof Syntax.normal.Absyn.Application)
    {
       Syntax.normal.Absyn.Application _application = (Syntax.normal.Absyn.Application) foo;
       if (_i_ > 0) render(_L_PAREN);
       pp(_application.expr_1, 0);
       pp(_application.expr_2, 0);
       if (_i_ > 0) render(_R_PAREN);
    }
  }


  private static void sh(Syntax.normal.Absyn.Program foo)
  {
    if (foo instanceof Syntax.normal.Absyn.ProgramExprs)
    {
       Syntax.normal.Absyn.ProgramExprs _programexprs = (Syntax.normal.Absyn.ProgramExprs) foo;
       render("(");
       render("ProgramExprs");
       render("[");
       sh(_programexprs.listexpr_);
       render("]");
       render(")");
    }
  }

  private static void sh(Syntax.normal.Absyn.ListExpr foo)
  {
     for (java.util.Iterator<Syntax.normal.Absyn.Expr> it = foo.iterator(); it.hasNext();)
     {
       sh(it.next());
       if (it.hasNext())
         render(",");
     }
  }

  private static void sh(Syntax.normal.Absyn.Expr foo)
  {
    if (foo instanceof Syntax.normal.Absyn.ConstTrue)
    {
       Syntax.normal.Absyn.ConstTrue _consttrue = (Syntax.normal.Absyn.ConstTrue) foo;
       render("ConstTrue");
    }
    if (foo instanceof Syntax.normal.Absyn.ConstFalse)
    {
       Syntax.normal.Absyn.ConstFalse _constfalse = (Syntax.normal.Absyn.ConstFalse) foo;
       render("ConstFalse");
    }
    if (foo instanceof Syntax.normal.Absyn.If)
    {
       Syntax.normal.Absyn.If _if = (Syntax.normal.Absyn.If) foo;
       render("(");
       render("If");
       sh(_if.expr_1);
       sh(_if.expr_2);
       sh(_if.expr_3);
       render(")");
    }
    if (foo instanceof Syntax.normal.Absyn.ConstZero)
    {
       Syntax.normal.Absyn.ConstZero _constzero = (Syntax.normal.Absyn.ConstZero) foo;
       render("ConstZero");
    }
    if (foo instanceof Syntax.normal.Absyn.Succ)
    {
       Syntax.normal.Absyn.Succ _succ = (Syntax.normal.Absyn.Succ) foo;
       render("(");
       render("Succ");
       sh(_succ.expr_);
       render(")");
    }
    if (foo instanceof Syntax.normal.Absyn.Pred)
    {
       Syntax.normal.Absyn.Pred _pred = (Syntax.normal.Absyn.Pred) foo;
       render("(");
       render("Pred");
       sh(_pred.expr_);
       render(")");
    }
    if (foo instanceof Syntax.normal.Absyn.IsZero)
    {
       Syntax.normal.Absyn.IsZero _iszero = (Syntax.normal.Absyn.IsZero) foo;
       render("(");
       render("IsZero");
       sh(_iszero.expr_);
       render(")");
    }
    if (foo instanceof Syntax.normal.Absyn.Var)
    {
       Syntax.normal.Absyn.Var _var = (Syntax.normal.Absyn.Var) foo;
       render("(");
       render("Var");
       sh(_var.ident_);
       render(")");
    }
    if (foo instanceof Syntax.normal.Absyn.Abstraction)
    {
       Syntax.normal.Absyn.Abstraction _abstraction = (Syntax.normal.Absyn.Abstraction) foo;
       render("(");
       render("Abstraction");
       sh(_abstraction.ident_);
       sh(_abstraction.expr_);
       render(")");
    }
    if (foo instanceof Syntax.normal.Absyn.Application)
    {
       Syntax.normal.Absyn.Application _application = (Syntax.normal.Absyn.Application) foo;
       render("(");
       render("Application");
       sh(_application.expr_1);
       sh(_application.expr_2);
       render(")");
    }
  }


  private static void pp(Integer n, int _i_) { buf_.append(n); buf_.append(" "); }
  private static void pp(Double d, int _i_) { buf_.append(String.format(java.util.Locale.ROOT, "%.15g ", d)); }
  private static void pp(String s, int _i_) { buf_.append(s); buf_.append(" "); }
  private static void pp(Character c, int _i_) { buf_.append("'" + c.toString() + "'"); buf_.append(" "); }
  private static void sh(Integer n) { render(n.toString()); }
  private static void sh(Double d) { render(String.format(java.util.Locale.ROOT, "%.15g", d)); }
  private static void sh(Character c) { render("'" + c.toString() + "'"); }
  private static void sh(String s) { printQuoted(s); }
  private static void printQuoted(String s) { render("\"" + s + "\""); }
  private static void indent()
  {
    int n = _n_;
    while (n > 0)
    {
      buf_.append(' ');
      n--;
    }
  }
  private static void backup()
  {
    int prev = buf_.length() - 1;
    if (buf_.charAt(prev) == ' ')
      buf_.setLength(prev);
  }
  private static void trim()
  {
    // Trim initial spaces
    int end = 0;
    int len = buf_.length();
    while (end < len && buf_.charAt(end) == ' ')
      end++;
    buf_.delete(0, end);
    // Trim trailing spaces
    end = buf_.length();
    while (end > 0 && buf_.charAt(end-1) == ' ')
      end--;
    buf_.setLength(end);
  }
  private static int _n_ = 0;
  private static StringBuilder buf_ = new StringBuilder(INITIAL_BUFFER_SIZE);
}

