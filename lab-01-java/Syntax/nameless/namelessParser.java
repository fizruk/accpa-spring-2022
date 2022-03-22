// Generated from Syntax/nameless/namelessParser.g4 by ANTLR 4.9.3
package Syntax.nameless;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class namelessParser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.3", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		Surrogate_id_SYMB_0=1, Surrogate_id_SYMB_1=2, Surrogate_id_SYMB_2=3, Surrogate_id_SYMB_3=4, 
		Surrogate_id_SYMB_4=5, Surrogate_id_SYMB_5=6, Surrogate_id_SYMB_6=7, Surrogate_id_SYMB_7=8, 
		Surrogate_id_SYMB_8=9, Surrogate_id_SYMB_9=10, Surrogate_id_SYMB_10=11, 
		Surrogate_id_SYMB_11=12, Surrogate_id_SYMB_12=13, Surrogate_id_SYMB_13=14, 
		Surrogate_id_SYMB_14=15, Surrogate_id_SYMB_15=16, Surrogate_id_SYMB_16=17, 
		INTEGER=18, IDENT=19, WS=20, ErrorToken=21;
	public static final int
		RULE_start_Expr = 0, RULE_expr = 1;
	private static String[] makeRuleNames() {
		return new String[] {
			"start_Expr", "expr"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'0'", "'['", "']'", "'{'", "'}'", "'('", "')'", "'else'", "'false'", 
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
			"Surrogate_id_SYMB_15", "Surrogate_id_SYMB_16", "INTEGER", "IDENT", "WS", 
			"ErrorToken"
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
	public String getGrammarFileName() { return "namelessParser.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }



	public namelessParser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class Start_ExprContext extends ParserRuleContext {
		public Syntax.nameless.Absyn.Expr result;
		public ExprContext x;
		public TerminalNode EOF() { return getToken(namelessParser.EOF, 0); }
		public ExprContext expr() {
			return getRuleContext(ExprContext.class,0);
		}
		public Start_ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_start_Expr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof namelessParserListener ) ((namelessParserListener)listener).enterStart_Expr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof namelessParserListener ) ((namelessParserListener)listener).exitStart_Expr(this);
		}
	}

	public final Start_ExprContext start_Expr() throws RecognitionException {
		Start_ExprContext _localctx = new Start_ExprContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_start_Expr);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(4);
			((Start_ExprContext)_localctx).x = expr(0);
			setState(5);
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

	public static class ExprContext extends ParserRuleContext {
		public Syntax.nameless.Absyn.Expr result;
		public ExprContext p_11_1;
		public ExprContext p_3_2;
		public ExprContext p_3_4;
		public ExprContext p_3_6;
		public ExprContext p_5_2;
		public ExprContext p_6_2;
		public ExprContext p_7_2;
		public Token p_8_1;
		public Token p_9_2;
		public ExprContext p_10_4;
		public ExprContext p_12_2;
		public ExprContext p_11_2;
		public TerminalNode Surrogate_id_SYMB_16() { return getToken(namelessParser.Surrogate_id_SYMB_16, 0); }
		public TerminalNode Surrogate_id_SYMB_8() { return getToken(namelessParser.Surrogate_id_SYMB_8, 0); }
		public TerminalNode Surrogate_id_SYMB_10() { return getToken(namelessParser.Surrogate_id_SYMB_10, 0); }
		public TerminalNode Surrogate_id_SYMB_15() { return getToken(namelessParser.Surrogate_id_SYMB_15, 0); }
		public TerminalNode Surrogate_id_SYMB_7() { return getToken(namelessParser.Surrogate_id_SYMB_7, 0); }
		public List<ExprContext> expr() {
			return getRuleContexts(ExprContext.class);
		}
		public ExprContext expr(int i) {
			return getRuleContext(ExprContext.class,i);
		}
		public TerminalNode Surrogate_id_SYMB_0() { return getToken(namelessParser.Surrogate_id_SYMB_0, 0); }
		public TerminalNode Surrogate_id_SYMB_14() { return getToken(namelessParser.Surrogate_id_SYMB_14, 0); }
		public TerminalNode Surrogate_id_SYMB_12() { return getToken(namelessParser.Surrogate_id_SYMB_12, 0); }
		public TerminalNode Surrogate_id_SYMB_11() { return getToken(namelessParser.Surrogate_id_SYMB_11, 0); }
		public TerminalNode IDENT() { return getToken(namelessParser.IDENT, 0); }
		public TerminalNode Surrogate_id_SYMB_1() { return getToken(namelessParser.Surrogate_id_SYMB_1, 0); }
		public TerminalNode Surrogate_id_SYMB_2() { return getToken(namelessParser.Surrogate_id_SYMB_2, 0); }
		public TerminalNode INTEGER() { return getToken(namelessParser.INTEGER, 0); }
		public TerminalNode Surrogate_id_SYMB_9() { return getToken(namelessParser.Surrogate_id_SYMB_9, 0); }
		public TerminalNode Surrogate_id_SYMB_3() { return getToken(namelessParser.Surrogate_id_SYMB_3, 0); }
		public TerminalNode Surrogate_id_SYMB_13() { return getToken(namelessParser.Surrogate_id_SYMB_13, 0); }
		public TerminalNode Surrogate_id_SYMB_4() { return getToken(namelessParser.Surrogate_id_SYMB_4, 0); }
		public TerminalNode Surrogate_id_SYMB_5() { return getToken(namelessParser.Surrogate_id_SYMB_5, 0); }
		public TerminalNode Surrogate_id_SYMB_6() { return getToken(namelessParser.Surrogate_id_SYMB_6, 0); }
		public ExprContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_expr; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof namelessParserListener ) ((namelessParserListener)listener).enterExpr(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof namelessParserListener ) ((namelessParserListener)listener).exitExpr(this);
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
		int _startState = 2;
		enterRecursionRule(_localctx, 2, RULE_expr, _p);
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(53);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case Surrogate_id_SYMB_16:
				{
				setState(9);
				match(Surrogate_id_SYMB_16);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.ConstTrue(); 
				}
				break;
			case Surrogate_id_SYMB_8:
				{
				setState(11);
				match(Surrogate_id_SYMB_8);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.ConstFalse(); 
				}
				break;
			case Surrogate_id_SYMB_10:
				{
				setState(13);
				match(Surrogate_id_SYMB_10);
				setState(14);
				((ExprContext)_localctx).p_3_2 = expr(0);
				setState(15);
				match(Surrogate_id_SYMB_15);
				setState(16);
				((ExprContext)_localctx).p_3_4 = expr(0);
				setState(17);
				match(Surrogate_id_SYMB_7);
				setState(18);
				((ExprContext)_localctx).p_3_6 = expr(10);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.If(((ExprContext)_localctx).p_3_2.result,((ExprContext)_localctx).p_3_4.result,((ExprContext)_localctx).p_3_6.result); 
				}
				break;
			case Surrogate_id_SYMB_0:
				{
				setState(21);
				match(Surrogate_id_SYMB_0);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.ConstZero(); 
				}
				break;
			case Surrogate_id_SYMB_14:
				{
				setState(23);
				match(Surrogate_id_SYMB_14);
				setState(24);
				((ExprContext)_localctx).p_5_2 = expr(8);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.Succ(((ExprContext)_localctx).p_5_2.result); 
				}
				break;
			case Surrogate_id_SYMB_12:
				{
				setState(27);
				match(Surrogate_id_SYMB_12);
				setState(28);
				((ExprContext)_localctx).p_6_2 = expr(7);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.Pred(((ExprContext)_localctx).p_6_2.result); 
				}
				break;
			case Surrogate_id_SYMB_11:
				{
				setState(31);
				match(Surrogate_id_SYMB_11);
				setState(32);
				((ExprContext)_localctx).p_7_2 = expr(6);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.IsZero(((ExprContext)_localctx).p_7_2.result); 
				}
				break;
			case IDENT:
				{
				setState(35);
				((ExprContext)_localctx).p_8_1 = match(IDENT);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.FreeVar(((ExprContext)_localctx).p_8_1.getText()); 
				}
				break;
			case Surrogate_id_SYMB_1:
				{
				setState(37);
				match(Surrogate_id_SYMB_1);
				setState(38);
				((ExprContext)_localctx).p_9_2 = match(INTEGER);
				setState(39);
				match(Surrogate_id_SYMB_2);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.BoundVar(Integer.parseInt(((ExprContext)_localctx).p_9_2.getText())); 
				}
				break;
			case Surrogate_id_SYMB_9:
				{
				setState(41);
				match(Surrogate_id_SYMB_9);
				setState(42);
				match(Surrogate_id_SYMB_3);
				setState(43);
				match(Surrogate_id_SYMB_13);
				setState(44);
				((ExprContext)_localctx).p_10_4 = expr(0);
				setState(45);
				match(Surrogate_id_SYMB_4);
				 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.Abstraction(((ExprContext)_localctx).p_10_4.result); 
				}
				break;
			case Surrogate_id_SYMB_5:
				{
				setState(48);
				match(Surrogate_id_SYMB_5);
				setState(49);
				((ExprContext)_localctx).p_12_2 = expr(0);
				setState(50);
				match(Surrogate_id_SYMB_6);
				 ((ExprContext)_localctx).result =  ((ExprContext)_localctx).p_12_2.result; 
				}
				break;
			default:
				throw new NoViableAltException(this);
			}
			_ctx.stop = _input.LT(-1);
			setState(61);
			_errHandler.sync(this);
			_alt = getInterpreter().adaptivePredict(_input,1,_ctx);
			while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER ) {
				if ( _alt==1 ) {
					if ( _parseListeners!=null ) triggerExitRuleEvent();
					_prevctx = _localctx;
					{
					{
					_localctx = new ExprContext(_parentctx, _parentState);
					_localctx.p_11_1 = _prevctx;
					_localctx.p_11_1 = _prevctx;
					pushNewRecursionContext(_localctx, _startState, RULE_expr);
					setState(55);
					if (!(precpred(_ctx, 2))) throw new FailedPredicateException(this, "precpred(_ctx, 2)");
					setState(56);
					((ExprContext)_localctx).p_11_2 = expr(3);
					 ((ExprContext)_localctx).result =  new Syntax.nameless.Absyn.Application(((ExprContext)_localctx).p_11_1.result,((ExprContext)_localctx).p_11_2.result); 
					}
					} 
				}
				setState(63);
				_errHandler.sync(this);
				_alt = getInterpreter().adaptivePredict(_input,1,_ctx);
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
		case 1:
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\27C\4\2\t\2\4\3\t"+
		"\3\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\5\38\n\3\3"+
		"\3\3\3\3\3\3\3\7\3>\n\3\f\3\16\3A\13\3\3\3\2\3\4\4\2\4\2\2\2K\2\6\3\2"+
		"\2\2\4\67\3\2\2\2\6\7\5\4\3\2\7\b\7\2\2\3\b\t\b\2\1\2\t\3\3\2\2\2\n\13"+
		"\b\3\1\2\13\f\7\23\2\2\f8\b\3\1\2\r\16\7\13\2\2\168\b\3\1\2\17\20\7\r"+
		"\2\2\20\21\5\4\3\2\21\22\7\22\2\2\22\23\5\4\3\2\23\24\7\n\2\2\24\25\5"+
		"\4\3\f\25\26\b\3\1\2\268\3\2\2\2\27\30\7\3\2\2\308\b\3\1\2\31\32\7\21"+
		"\2\2\32\33\5\4\3\n\33\34\b\3\1\2\348\3\2\2\2\35\36\7\17\2\2\36\37\5\4"+
		"\3\t\37 \b\3\1\2 8\3\2\2\2!\"\7\16\2\2\"#\5\4\3\b#$\b\3\1\2$8\3\2\2\2"+
		"%&\7\25\2\2&8\b\3\1\2\'(\7\4\2\2()\7\24\2\2)*\7\5\2\2*8\b\3\1\2+,\7\f"+
		"\2\2,-\7\6\2\2-.\7\20\2\2./\5\4\3\2/\60\7\7\2\2\60\61\b\3\1\2\618\3\2"+
		"\2\2\62\63\7\b\2\2\63\64\5\4\3\2\64\65\7\t\2\2\65\66\b\3\1\2\668\3\2\2"+
		"\2\67\n\3\2\2\2\67\r\3\2\2\2\67\17\3\2\2\2\67\27\3\2\2\2\67\31\3\2\2\2"+
		"\67\35\3\2\2\2\67!\3\2\2\2\67%\3\2\2\2\67\'\3\2\2\2\67+\3\2\2\2\67\62"+
		"\3\2\2\28?\3\2\2\29:\f\4\2\2:;\5\4\3\5;<\b\3\1\2<>\3\2\2\2=9\3\2\2\2>"+
		"A\3\2\2\2?=\3\2\2\2?@\3\2\2\2@\5\3\2\2\2A?\3\2\2\2\4\67?";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}