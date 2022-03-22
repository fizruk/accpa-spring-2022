// Generated from Syntax/normal/normalLexer.g4 by ANTLR 4.9.3
package Syntax.normal;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class normalLexer extends Lexer {
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
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"LETTER", "CAPITAL", "SMALL", "DIGIT", "Surrogate_id_SYMB_0", "Surrogate_id_SYMB_1", 
			"Surrogate_id_SYMB_2", "Surrogate_id_SYMB_3", "Surrogate_id_SYMB_4", 
			"Surrogate_id_SYMB_5", "Surrogate_id_SYMB_6", "Surrogate_id_SYMB_7", 
			"Surrogate_id_SYMB_8", "Surrogate_id_SYMB_9", "Surrogate_id_SYMB_10", 
			"Surrogate_id_SYMB_11", "Surrogate_id_SYMB_12", "Surrogate_id_SYMB_13", 
			"Surrogate_id_SYMB_14", "Surrogate_id_SYMB_15", "COMMENT_antlr_builtin", 
			"MULTICOMMENT_antlr_builtin", "IDENTIFIER_FIRST", "IDENT", "WS", "Escapable", 
			"ErrorToken"
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


	public normalLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "normalLexer.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\27\u00ba\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\4\34\t\34\3\2\3\2\5\2<\n\2\3\3\3\3\3\4\3\4\3"+
		"\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\f\3"+
		"\f\3\f\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\17\3\17\3\17\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\21\3\21\3\21\3\21\3\21\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\23\3\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24\3\24"+
		"\3\25\3\25\3\25\3\25\3\25\3\26\3\26\3\26\3\26\7\26\u0088\n\26\f\26\16"+
		"\26\u008b\13\26\3\26\5\26\u008e\n\26\3\26\3\26\5\26\u0092\n\26\3\26\3"+
		"\26\3\27\3\27\3\27\3\27\7\27\u009a\n\27\f\27\16\27\u009d\13\27\3\27\3"+
		"\27\3\27\3\27\3\27\3\30\3\30\5\30\u00a6\n\30\3\31\3\31\3\31\7\31\u00ab"+
		"\n\31\f\31\16\31\u00ae\13\31\3\32\6\32\u00b1\n\32\r\32\16\32\u00b2\3\32"+
		"\3\32\3\33\3\33\3\34\3\34\3\u009b\2\35\3\2\5\2\7\2\t\2\13\3\r\4\17\5\21"+
		"\6\23\7\25\b\27\t\31\n\33\13\35\f\37\r!\16#\17%\20\'\21)\22+\23-\24/\2"+
		"\61\25\63\26\65\2\67\27\3\2\b\5\2C\\\u00c2\u00d8\u00da\u00e0\5\2c|\u00e1"+
		"\u00f8\u00fa\u0101\3\2\62;\4\2\f\f\17\17\5\2\13\f\16\17\"\"\b\2$$^^hh"+
		"ppttvv\2\u00bc\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23"+
		"\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2"+
		"\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2"+
		"\2\2\2+\3\2\2\2\2-\3\2\2\2\2\61\3\2\2\2\2\63\3\2\2\2\2\67\3\2\2\2\3;\3"+
		"\2\2\2\5=\3\2\2\2\7?\3\2\2\2\tA\3\2\2\2\13C\3\2\2\2\rE\3\2\2\2\17G\3\2"+
		"\2\2\21I\3\2\2\2\23K\3\2\2\2\25M\3\2\2\2\27O\3\2\2\2\31T\3\2\2\2\33Z\3"+
		"\2\2\2\35^\3\2\2\2\37a\3\2\2\2!h\3\2\2\2#m\3\2\2\2%t\3\2\2\2\'y\3\2\2"+
		"\2)~\3\2\2\2+\u0083\3\2\2\2-\u0095\3\2\2\2/\u00a5\3\2\2\2\61\u00a7\3\2"+
		"\2\2\63\u00b0\3\2\2\2\65\u00b6\3\2\2\2\67\u00b8\3\2\2\29<\5\5\3\2:<\5"+
		"\7\4\2;9\3\2\2\2;:\3\2\2\2<\4\3\2\2\2=>\t\2\2\2>\6\3\2\2\2?@\t\3\2\2@"+
		"\b\3\2\2\2AB\t\4\2\2B\n\3\2\2\2CD\7=\2\2D\f\3\2\2\2EF\7\62\2\2F\16\3\2"+
		"\2\2GH\7*\2\2H\20\3\2\2\2IJ\7+\2\2J\22\3\2\2\2KL\7}\2\2L\24\3\2\2\2MN"+
		"\7\177\2\2N\26\3\2\2\2OP\7g\2\2PQ\7n\2\2QR\7u\2\2RS\7g\2\2S\30\3\2\2\2"+
		"TU\7h\2\2UV\7c\2\2VW\7n\2\2WX\7u\2\2XY\7g\2\2Y\32\3\2\2\2Z[\7h\2\2[\\"+
		"\7w\2\2\\]\7p\2\2]\34\3\2\2\2^_\7k\2\2_`\7h\2\2`\36\3\2\2\2ab\7k\2\2b"+
		"c\7u\2\2cd\7|\2\2de\7g\2\2ef\7t\2\2fg\7q\2\2g \3\2\2\2hi\7r\2\2ij\7t\2"+
		"\2jk\7g\2\2kl\7f\2\2l\"\3\2\2\2mn\7t\2\2no\7g\2\2op\7v\2\2pq\7w\2\2qr"+
		"\7t\2\2rs\7p\2\2s$\3\2\2\2tu\7u\2\2uv\7w\2\2vw\7e\2\2wx\7e\2\2x&\3\2\2"+
		"\2yz\7v\2\2z{\7j\2\2{|\7g\2\2|}\7p\2\2}(\3\2\2\2~\177\7v\2\2\177\u0080"+
		"\7t\2\2\u0080\u0081\7w\2\2\u0081\u0082\7g\2\2\u0082*\3\2\2\2\u0083\u0084"+
		"\7\61\2\2\u0084\u0085\7\61\2\2\u0085\u0089\3\2\2\2\u0086\u0088\n\5\2\2"+
		"\u0087\u0086\3\2\2\2\u0088\u008b\3\2\2\2\u0089\u0087\3\2\2\2\u0089\u008a"+
		"\3\2\2\2\u008a\u0091\3\2\2\2\u008b\u0089\3\2\2\2\u008c\u008e\7\17\2\2"+
		"\u008d\u008c\3\2\2\2\u008d\u008e\3\2\2\2\u008e\u008f\3\2\2\2\u008f\u0092"+
		"\7\f\2\2\u0090\u0092\7\2\2\3\u0091\u008d\3\2\2\2\u0091\u0090\3\2\2\2\u0092"+
		"\u0093\3\2\2\2\u0093\u0094\b\26\2\2\u0094,\3\2\2\2\u0095\u0096\7\61\2"+
		"\2\u0096\u0097\7,\2\2\u0097\u009b\3\2\2\2\u0098\u009a\13\2\2\2\u0099\u0098"+
		"\3\2\2\2\u009a\u009d\3\2\2\2\u009b\u009c\3\2\2\2\u009b\u0099\3\2\2\2\u009c"+
		"\u009e\3\2\2\2\u009d\u009b\3\2\2\2\u009e\u009f\7,\2\2\u009f\u00a0\7\61"+
		"\2\2\u00a0\u00a1\3\2\2\2\u00a1\u00a2\b\27\2\2\u00a2.\3\2\2\2\u00a3\u00a6"+
		"\5\3\2\2\u00a4\u00a6\7a\2\2\u00a5\u00a3\3\2\2\2\u00a5\u00a4\3\2\2\2\u00a6"+
		"\60\3\2\2\2\u00a7\u00ac\5/\30\2\u00a8\u00ab\5/\30\2\u00a9\u00ab\5\t\5"+
		"\2\u00aa\u00a8\3\2\2\2\u00aa\u00a9\3\2\2\2\u00ab\u00ae\3\2\2\2\u00ac\u00aa"+
		"\3\2\2\2\u00ac\u00ad\3\2\2\2\u00ad\62\3\2\2\2\u00ae\u00ac\3\2\2\2\u00af"+
		"\u00b1\t\6\2\2\u00b0\u00af\3\2\2\2\u00b1\u00b2\3\2\2\2\u00b2\u00b0\3\2"+
		"\2\2\u00b2\u00b3\3\2\2\2\u00b3\u00b4\3\2\2\2\u00b4\u00b5\b\32\2\2\u00b5"+
		"\64\3\2\2\2\u00b6\u00b7\t\7\2\2\u00b7\66\3\2\2\2\u00b8\u00b9\13\2\2\2"+
		"\u00b98\3\2\2\2\f\2;\u0089\u008d\u0091\u009b\u00a5\u00aa\u00ac\u00b2\3"+
		"\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}