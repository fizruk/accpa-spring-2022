// Generated from Syntax/normal/normalParser.g4 by ANTLR 4.9.3
package Syntax.normal;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link normalParser}.
 */
public interface normalParserListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link normalParser#start_Program}.
	 * @param ctx the parse tree
	 */
	void enterStart_Program(normalParser.Start_ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link normalParser#start_Program}.
	 * @param ctx the parse tree
	 */
	void exitStart_Program(normalParser.Start_ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link normalParser#start_ListExpr}.
	 * @param ctx the parse tree
	 */
	void enterStart_ListExpr(normalParser.Start_ListExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link normalParser#start_ListExpr}.
	 * @param ctx the parse tree
	 */
	void exitStart_ListExpr(normalParser.Start_ListExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link normalParser#start_Expr}.
	 * @param ctx the parse tree
	 */
	void enterStart_Expr(normalParser.Start_ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link normalParser#start_Expr}.
	 * @param ctx the parse tree
	 */
	void exitStart_Expr(normalParser.Start_ExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link normalParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(normalParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link normalParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(normalParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link normalParser#listExpr}.
	 * @param ctx the parse tree
	 */
	void enterListExpr(normalParser.ListExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link normalParser#listExpr}.
	 * @param ctx the parse tree
	 */
	void exitListExpr(normalParser.ListExprContext ctx);
	/**
	 * Enter a parse tree produced by {@link normalParser#expr}.
	 * @param ctx the parse tree
	 */
	void enterExpr(normalParser.ExprContext ctx);
	/**
	 * Exit a parse tree produced by {@link normalParser#expr}.
	 * @param ctx the parse tree
	 */
	void exitExpr(normalParser.ExprContext ctx);
}