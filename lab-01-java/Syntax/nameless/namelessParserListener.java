// Generated from Syntax/nameless/namelessParser.g4 by ANTLR 4.9.3
package Syntax.nameless;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link namelessParser}.
 */
public interface namelessParserListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link namelessParser#start_Expr}.
	 * @param ctx the parse tree
	 */
	void enterStart_Expr(namelessParser.Start_ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link namelessParser#start_Expr}.
	 * @param ctx the parse tree
	 */
	void exitStart_Expr(namelessParser.Start_ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link namelessParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(namelessParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link namelessParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(namelessParser.ExprContext ctx);
}