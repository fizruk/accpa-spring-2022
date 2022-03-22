// Generated from Syntax/normal/normalParser.g4 by ANTLR 4.9.3
package Syntax.normal;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class normalParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.3", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		Surrogate_id_SYMB_0=1, Surrogate_id_SYMB_1=2, Surrogate_id_SYMB_2=3, Surrogate_id_SYMB_3=4, 
		Surrogate_id_SYMB_4=5, Surrogate_id_SYMB_5=6, Surrogate_id_SYMB_6=7, Surrogate_id_SYMB_7=8, 
		Surrogate_id_SYMB_8=9, Surrogate_id_SYMB_9=10, Surrogate_id_SYMB_10=11, 
		Surrogate_id_SYMB_11=12, Surrogate_id_SYMB_12=13, Surrogate_id_SYMB_13=14, 
		Surrogate_id_SYMB_14=15, Surrogate_id_SYMB_15=16, COMMENT_antlr_builtin=17, 
		MULTICOMMENT_antlr_builtin=18, IDENT=19, WS=20, ErrorToken=21;
	public static final int
		RULE_start_Program = 0, RULE_start_ListExpr = 1, RULE_start_Expr = 2, 
		RULE_program = 3, RULE_listExpr = 4, RULE_expr = 5;
	private static String[] makeRuleNames() {
		return new String[] {
			"start_Program", "start_ListExpr", "start_Expr", "program", "listExpr", 
			"expr"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "';'", "'0'", "'('", "')'", "'{'", "'}'", "'else'", "'false'", 
			"'fun'", "'if'", "'iszero'", "'pred'", "'return'", "'succ'", "'then'", 
			"'true'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "Surrogate_id_SYMB_0", "Surrogate_id_SYMB_1", "Surrogate_id_SYMB_2", 
			"Surrogate_id_SYMB_3", "Surrogate_id_SYMB_4", "Surrogate_id_SYMB_5", 
			"Surrogate_id_SYMB_6", "Surrogate_id_SYMB_7", "Surrogate_id_SYMB_8", 
			"Surrogate_id_SYMB_9", "Surrogate_id_SYMB_10", "Surrogate_id_SYMB_11", 
			"Surrogate_id_SYMB_12", "Surrogate_id_SYMB_13", "Surrogate_id_SYMB_14", 
			"Surrogate_id_SYMB_15", "COMMENT_antlr_builtin", "MULTICOMMENT_antlr_builtin", 
			"IDENT", "WS", "ErrorToken"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "normalParser.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }



	public normalParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class Start_ProgramContext extends ParserRuleContext {
		public Syntax.normal.Absyn.Program result;
		public ProgramContext x;
		public TerminalNode EOF() { return getToken(normalParser.EOF, 0); }
		public ProgramContext program() {
			return getRuleContext(ProgramContext.class,0);
		}
		public Start_ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_start_Program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).enterStart_Program(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).exitStart_Program(this);
		}
	}

	public final Start_ProgramContext start_Program() throws RecognitionException {
		Start_ProgramContext _localctx = new Start_ProgramContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_start_Program);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(12);
			((Start_ProgramContext)_localctx).x = program();
			setState(13);
			match(EOF);
			 ((Start_ProgramContext)_localctx).result =  ((Start_ProgramContext)_localctx).x.result; 
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Start_ListExprContext extends ParserRuleContext {
		public Syntax.normal.Absyn.ListExpr result;
		public ListExprContext x;
		public TerminalNode EOF() { return getToken(normalParser.EOF, 0); }
		public ListExprContext listExpr() {
			return getRuleContext(ListExprContext.class,0);
		}
		public Start_ListExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_start_ListExpr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).enterStart_ListExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).exitStart_ListExpr(this);
		}
	}

	public final Start_ListExprContext start_ListExpr() throws RecognitionException {
		Start_ListExprContext _localctx = new Start_ListExprContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_start_ListExpr);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(16);
			((Start_ListExprContext)_localctx).x = listExpr();
			setState(17);
			match(EOF);
			 ((Start_ListExprContext)_localctx).result =  ((Start_ListExprContext)_localctx).x.result; 
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class Start_ExprContext extends ParserRuleContext {
		public Syntax.normal.Absyn.Expr result;
		public ExprContext x;
		public TerminalNode EOF() { return getToken(normalParser.EOF, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Start_ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_start_Expr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).enterStart_Expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).exitStart_Expr(this);
		}
	}

	public final Start_ExprContext start_Expr() throws RecognitionException {
		Start_ExprContext _localctx = new Start_ExprContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_start_Expr);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(20);
			((Start_ExprContext)_localctx).x = expr(0);
			setState(21);
			match(EOF);
			 ((Start_ExprContext)_localctx).result =  ((Start_ExprContext)_localctx).x.result; 
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ProgramContext extends ParserRuleContext {
		public Syntax.normal.Absyn.Program result;
		public ListExprContext p_1_1;
		public ListExprContext listExpr() {
			return getRuleContext(ListExprContext.class,0);
		}
		public ProgramContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_program; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).enterProgram(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).exitProgram(this);
		}
	}

	public final ProgramContext program() throws RecognitionException {
		ProgramContext _localctx = new ProgramContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_program);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(24);
			((ProgramContext)_localctx).p_1_1 = listExpr();
			 ((ProgramContext)_localctx).result =  new Syntax.normal.Absyn.ProgramExprs(((ProgramContext)_localctx).p_1_1.result); 
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ListExprContext extends ParserRuleContext {
		public Syntax.normal.Absyn.ListExpr result;
		public ExprContext p_2_1;
		public ExprContext p_3_1;
		public ListExprContext p_3_3;
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public TerminalNode Surrogate_id_SYMB_0() { return getToken(normalParser.Surrogate_id_SYMB_0, 0); }
		public ListExprContext listExpr() {
			return getRuleContext(ListExprContext.class,0);
		}
		public ListExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_listExpr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).enterListExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).exitListExpr(this);
		}
	}

	public final ListExprContext listExpr() throws RecognitionException {
		ListExprContext _localctx = new ListExprContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_listExpr);
		try {
			setState(36);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,0,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				 ((ListExprContext)_localctx).result =  new Syntax.normal.Absyn.ListExpr(); 
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				setState(28);
				((ListExprContext)_localctx).p_2_1 = expr(0);
				 ((ListExprContext)_localctx).result =  new Syntax.normal.Absyn.ListExpr(); _localctx.result.addLast(((ListExprContext)_localctx).p_2_1.result); 
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(31);
				((ListExprContext)_localctx).p_3_1 = expr(0);
				setState(32);
				match(Surrogate_id_SYMB_0);
				setState(33);
				((ListExprContext)_localctx).p_3_3 = listExpr();
				 ((ListExprContext)_localctx).result =  ((ListExprContext)_localctx).p_3_3.result; _localctx.result.addFirst(((ListExprContext)_localctx).p_3_1.result); 
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class ExprContext extends ParserRuleContext {
		public Syntax.normal.Absyn.Expr result;
		public ExprContext p_10_1;
		public ExprContext p_3_2;
		public ExprContext p_3_4;
		public ExprContext p_3_6;
		public ExprContext p_5_2;
		public ExprContext p_6_2;
		public ExprContext p_7_2;
		public Token p_8_1;
		public Token p_9_3;
		public ExprContext p_9_7;
		public ExprContext p_11_2;
		public ExprContext p_10_2;
		public TerminalNode Surrogate_id_SYMB_15() { return getToken(normalParser.Surrogate_id_SYMB_15, 0); }
		public TerminalNode Surrogate_id_SYMB_7() { return getToken(normalParser.Surrogate_id_SYMB_7, 0); }
		public TerminalNode Surrogate_id_SYMB_9() { return getToken(normalParser.Surrogate_id_SYMB_9, 0); }
		public TerminalNode Surrogate_id_SYMB_14() { return getToken(normalParser.Surrogate_id_SYMB_14, 0); }
		public TerminalNode Surrogate_id_SYMB_6() { return getToken(normalParser.Surrogate_id_SYMB_6, 0); }
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public TerminalNode Surrogate_id_SYMB_1() { return getToken(normalParser.Surrogate_id_SYMB_1, 0); }
		public TerminalNode Surrogate_id_SYMB_13() { return getToken(normalParser.Surrogate_id_SYMB_13, 0); }
		public TerminalNode Surrogate_id_SYMB_11() { return getToken(normalParser.Surrogate_id_SYMB_11, 0); }
		public TerminalNode Surrogate_id_SYMB_10() { return getToken(normalParser.Surrogate_id_SYMB_10, 0); }
		public TerminalNode IDENT() { return getToken(normalParser.IDENT, 0); }
		public TerminalNode Surrogate_id_SYMB_8() { return getToken(normalParser.Surrogate_id_SYMB_8, 0); }
		public TerminalNode Surrogate_id_SYMB_2() { return getToken(normalParser.Surrogate_id_SYMB_2, 0); }
		public TerminalNode Surrogate_id_SYMB_3() { return getToken(normalParser.Surrogate_id_SYMB_3, 0); }
		public TerminalNode Surrogate_id_SYMB_4() { return getToken(normalParser.Surrogate_id_SYMB_4, 0); }
		public TerminalNode Surrogate_id_SYMB_12() { return getToken(normalParser.Surrogate_id_SYMB_12, 0); }
		public TerminalNode Surrogate_id_SYMB_5() { return getToken(normalParser.Surrogate_id_SYMB_5, 0); }
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).enterExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof normalParserListener ) ((normalParserListener)listener).exitExpr(this);
		}
	}

	public final ExprContext expr() throws RecognitionException {
		return expr(0);
	}

	private ExprContext expr(int _p) throws RecognitionException {
		ParserRuleContext _parentctx = _ctx;
		int _parentState = getState();
		ExprContext _localctx = new ExprContext(_ctx, _parentState);
		ExprContext _prevctx = _localctx;
		int _startState = 10;
		enterRecursionRule(_localctx, 10, RULE_expr, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(82);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case Surrogate_id_SYMB_15:
				{
				setState(39);
				match(Surrogate_id_SYMB_15);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.ConstTrue(); 
				}
				break;
			case Surrogate_id_SYMB_7:
				{
				setState(41);
				match(Surrogate_id_SYMB_7);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.ConstFalse(); 
				}
				break;
			case Surrogate_id_SYMB_9:
				{
				setState(43);
				match(Surrogate_id_SYMB_9);
				setState(44);
				((ExprContext)_localctx).p_3_2 = expr(0);
				setState(45);
				match(Surrogate_id_SYMB_14);
				setState(46);
				((ExprContext)_localctx).p_3_4 = expr(0);
				setState(47);
				match(Surrogate_id_SYMB_6);
				setState(48);
				((ExprContext)_localctx).p_3_6 = expr(9);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.If(((ExprContext)_localctx).p_3_2.result,((ExprContext)_localctx).p_3_4.result,((ExprContext)_localctx).p_3_6.result); 
				}
				break;
			case Surrogate_id_SYMB_1:
				{
				setState(51);
				match(Surrogate_id_SYMB_1);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.ConstZero(); 
				}
				break;
			case Surrogate_id_SYMB_13:
				{
				setState(53);
				match(Surrogate_id_SYMB_13);
				setState(54);
				((ExprContext)_localctx).p_5_2 = expr(7);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.Succ(((ExprContext)_localctx).p_5_2.result); 
				}
				break;
			case Surrogate_id_SYMB_11:
				{
				setState(57);
				match(Surrogate_id_SYMB_11);
				setState(58);
				((ExprContext)_localctx).p_6_2 = expr(6);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.Pred(((ExprContext)_localctx).p_6_2.result); 
				}
				break;
			case Surrogate_id_SYMB_10:
				{
				setState(61);
				match(Surrogate_id_SYMB_10);
				setState(62);
				((ExprContext)_localctx).p_7_2 = expr(5);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.IsZero(((ExprContext)_localctx).p_7_2.result); 
				}
				break;
			case IDENT:
				{
				setState(65);
				((ExprContext)_localctx).p_8_1 = match(IDENT);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.Var(((ExprContext)_localctx).p_8_1.getText()); 
				}
				break;
			case Surrogate_id_SYMB_8:
				{
				setState(67);
				match(Surrogate_id_SYMB_8);
				setState(68);
				match(Surrogate_id_SYMB_2);
				setState(69);
				((ExprContext)_localctx).p_9_3 = match(IDENT);
				setState(70);
				match(Surrogate_id_SYMB_3);
				setState(71);
				match(Surrogate_id_SYMB_4);
				setState(72);
				match(Surrogate_id_SYMB_12);
				setState(73);
				((ExprContext)_localctx).p_9_7 = expr(0);
				setState(74);
				match(Surrogate_id_SYMB_5);
				 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.Abstraction(((ExprContext)_localctx).p_9_3.getText(),((ExprContext)_localctx).p_9_7.result); 
				}
				break;
			case Surrogate_id_SYMB_2:
				{
				setState(77);
				match(Surrogate_id_SYMB_2);
				setState(78);
				((ExprContext)_localctx).p_11_2 = expr(0);
				setState(79);
				match(Surrogate_id_SYMB_3);
				 ((ExprContext)_localctx).result =  ((ExprContext)_localctx).p_11_2.result; 
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(90);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new ExprContext(_parentctx, _parentState);
					_localctx.p_10_1 = _prevctx;
					_localctx.p_10_1 = _prevctx;
					pushNewRecursionContext(_localctx, _startState, RULE_expr);
					setState(84);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(85);
					((ExprContext)_localctx).p_10_2 = expr(3);
					 ((ExprContext)_localctx).result =  new Syntax.normal.Absyn.Application(((ExprContext)_localctx).p_10_1.result,((ExprContext)_localctx).p_10_2.result); 
					}
					} 
				}
				setState(92);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			unrollRecursionContexts(_parentctx);
		}
		return _localctx;
	}

	public boolean sempred(RuleContext _localctx, int ruleIndex, int predIndex) {
		switch (ruleIndex) {
		case 5:
			return expr_sempred((ExprContext)_localctx, predIndex);
		}
		return true;
	}
	private boolean expr_sempred(ExprContext _localctx, int predIndex) {
		switch (predIndex) {
		case 0:
			return precpred(_ctx, 2);
		}
		return true;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\27`\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\4"+
		"\3\4\3\4\3\4\3\5\3\5\3\5\3\6\3\6\3\6\3\6\3\6\3\6\3\6\3\6\3\6\5\6\'\n\6"+
		"\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3"+
		"\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7"+
		"\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\3\7\5\7U\n\7\3\7\3\7\3\7\3\7\7\7[\n\7"+
		"\f\7\16\7^\13\7\3\7\2\3\f\b\2\4\6\b\n\f\2\2\2e\2\16\3\2\2\2\4\22\3\2\2"+
		"\2\6\26\3\2\2\2\b\32\3\2\2\2\n&\3\2\2\2\fT\3\2\2\2\16\17\5\b\5\2\17\20"+
		"\7\2\2\3\20\21\b\2\1\2\21\3\3\2\2\2\22\23\5\n\6\2\23\24\7\2\2\3\24\25"+
		"\b\3\1\2\25\5\3\2\2\2\26\27\5\f\7\2\27\30\7\2\2\3\30\31\b\4\1\2\31\7\3"+
		"\2\2\2\32\33\5\n\6\2\33\34\b\5\1\2\34\t\3\2\2\2\35\'\b\6\1\2\36\37\5\f"+
		"\7\2\37 \b\6\1\2 \'\3\2\2\2!\"\5\f\7\2\"#\7\3\2\2#$\5\n\6\2$%\b\6\1\2"+
		"%\'\3\2\2\2&\35\3\2\2\2&\36\3\2\2\2&!\3\2\2\2\'\13\3\2\2\2()\b\7\1\2)"+
		"*\7\22\2\2*U\b\7\1\2+,\7\n\2\2,U\b\7\1\2-.\7\f\2\2./\5\f\7\2/\60\7\21"+
		"\2\2\60\61\5\f\7\2\61\62\7\t\2\2\62\63\5\f\7\13\63\64\b\7\1\2\64U\3\2"+
		"\2\2\65\66\7\4\2\2\66U\b\7\1\2\678\7\20\2\289\5\f\7\t9:\b\7\1\2:U\3\2"+
		"\2\2;<\7\16\2\2<=\5\f\7\b=>\b\7\1\2>U\3\2\2\2?@\7\r\2\2@A\5\f\7\7AB\b"+
		"\7\1\2BU\3\2\2\2CD\7\25\2\2DU\b\7\1\2EF\7\13\2\2FG\7\5\2\2GH\7\25\2\2"+
		"HI\7\6\2\2IJ\7\7\2\2JK\7\17\2\2KL\5\f\7\2LM\7\b\2\2MN\b\7\1\2NU\3\2\2"+
		"\2OP\7\5\2\2PQ\5\f\7\2QR\7\6\2\2RS\b\7\1\2SU\3\2\2\2T(\3\2\2\2T+\3\2\2"+
		"\2T-\3\2\2\2T\65\3\2\2\2T\67\3\2\2\2T;\3\2\2\2T?\3\2\2\2TC\3\2\2\2TE\3"+
		"\2\2\2TO\3\2\2\2U\\\3\2\2\2VW\f\4\2\2WX\5\f\7\5XY\b\7\1\2Y[\3\2\2\2ZV"+
		"\3\2\2\2[^\3\2\2\2\\Z\3\2\2\2\\]\3\2\2\2]\r\3\2\2\2^\\\3\2\2\2\5&T\\";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}