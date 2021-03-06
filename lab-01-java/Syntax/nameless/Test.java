package Syntax.nameless;

import Syntax.nameless.*;
import java.io.*;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.*;
import java.util.*;

class TestError extends RuntimeException
{
  int line;
  int column;
  public TestError(String msg, int l, int c)
  {
    super(msg);
    line = l;
    column = c;
  }
}
class BNFCErrorListener implements ANTLRErrorListener
{
  @Override
  public void syntaxError(Recognizer<?, ?> recognizer, Object o, int i, int i1, String s, RecognitionException e)
  {
    throw new TestError(s,i,i1);
  }
  @Override
  public void reportAmbiguity(Parser parser, DFA dfa, int i, int i1, boolean b, BitSet bitSet, ATNConfigSet atnConfigSet)
  {
    throw new TestError("Ambiguity at",i,i1);
  }
  @Override
  public void reportAttemptingFullContext(Parser parser, DFA dfa, int i, int i1, BitSet bitSet, ATNConfigSet atnConfigSet)
  {
  }
  @Override
  public void reportContextSensitivity(Parser parser, DFA dfa, int i, int i1, int i2, ATNConfigSet atnConfigSet)
  {
  }
}

public class Test
{
  namelessLexer l;
  namelessParser p;

  public Test(String[] args)
  {
    try
    {
      Reader input;
      if (args.length == 0) input = new InputStreamReader(System.in);
      else input = new FileReader(args[0]);
      l = new namelessLexer(new ANTLRInputStream(input));
              l.addErrorListener(new BNFCErrorListener());
    }
    catch(IOException e)
    {
      System.err.println("Error: File not found: " + args[0]);
      System.exit(1);
    }
    p = new namelessParser(new CommonTokenStream(l));
            p.addErrorListener(new BNFCErrorListener());
  }

  public Syntax.nameless.Absyn.Expr parse() throws Exception
  {
    /* The default parser is the first-defined entry point. */
    namelessParser.Start_ExprContext pc = p.start_Expr();
    Syntax.nameless.Absyn.Expr ast = pc.result;
    System.out.println();
    System.out.println("Parse Succesful!");
    System.out.println();
    System.out.println("[Abstract Syntax]");
    System.out.println();
    System.out.println(PrettyPrinter.show(ast));
    System.out.println();
    System.out.println("[Linearized Tree]");
    System.out.println();
    System.out.println(PrettyPrinter.print(ast));
    return ast;
  }

  public static void main(String args[]) throws Exception
  {
    Test t = new Test(args);
    try
    {
      t.parse();
    }
    catch(TestError e)
    {
      System.err.println("At line " + e.line + ", column " + e.column + " :");
      System.err.println("     " + e.getMessage());
      System.exit(1);
    }
  }
}
