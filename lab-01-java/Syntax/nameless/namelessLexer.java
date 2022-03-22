// Generated from Syntax/nameless/namelessLexer.g4 by ANTLR 4.9.3
package Syntax.nameless;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class namelessLexer extends Lexer {
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
			"Surrogate_id_SYMB_14", "Surrogate_id_SYMB_15", "Surrogate_id_SYMB_16", 
			"INTEGER", "IDENTIFIER_FIRST", "IDENT", "WS", "Escapable", "ErrorToken"
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


	public namelessLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "namelessLexer.g4"; }

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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\27\u00a1\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\4\25\t\25\4\26\t\26\4\27\t\27\4\30\t\30\4\31"+
		"\t\31\4\32\t\32\4\33\t\33\4\34\t\34\3\2\3\2\5\2<\n\2\3\3\3\3\3\4\3\4\3"+
		"\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\r\3"+
		"\r\3\r\3\r\3\r\3\16\3\16\3\16\3\16\3\16\3\16\3\17\3\17\3\17\3\17\3\20"+
		"\3\20\3\20\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22\3\22"+
		"\3\23\3\23\3\23\3\23\3\23\3\23\3\23\3\24\3\24\3\24\3\24\3\24\3\25\3\25"+
		"\3\25\3\25\3\25\3\26\3\26\3\26\3\26\3\26\3\27\6\27\u0087\n\27\r\27\16"+
		"\27\u0088\3\30\3\30\5\30\u008d\n\30\3\31\3\31\3\31\7\31\u0092\n\31\f\31"+
		"\16\31\u0095\13\31\3\32\6\32\u0098\n\32\r\32\16\32\u0099\3\32\3\32\3\33"+
		"\3\33\3\34\3\34\2\2\35\3\2\5\2\7\2\t\2\13\3\r\4\17\5\21\6\23\7\25\b\27"+
		"\t\31\n\33\13\35\f\37\r!\16#\17%\20\'\21)\22+\23-\24/\2\61\25\63\26\65"+
		"\2\67\27\3\2\7\5\2C\\\u00c2\u00d8\u00da\u00e0\5\2c|\u00e1\u00f8\u00fa"+
		"\u0101\3\2\62;\5\2\13\f\16\17\"\"\b\2$$^^hhppttvv\2\u00a0\2\13\3\2\2\2"+
		"\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27"+
		"\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2"+
		"\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2\2\2\2)\3\2\2\2\2+\3\2\2\2\2-\3\2\2\2"+
		"\2\61\3\2\2\2\2\63\3\2\2\2\2\67\3\2\2\2\3;\3\2\2\2\5=\3\2\2\2\7?\3\2\2"+
		"\2\tA\3\2\2\2\13C\3\2\2\2\rE\3\2\2\2\17G\3\2\2\2\21I\3\2\2\2\23K\3\2\2"+
		"\2\25M\3\2\2\2\27O\3\2\2\2\31Q\3\2\2\2\33V\3\2\2\2\35\\\3\2\2\2\37`\3"+
		"\2\2\2!c\3\2\2\2#j\3\2\2\2%o\3\2\2\2\'v\3\2\2\2){\3\2\2\2+\u0080\3\2\2"+
		"\2-\u0086\3\2\2\2/\u008c\3\2\2\2\61\u008e\3\2\2\2\63\u0097\3\2\2\2\65"+
		"\u009d\3\2\2\2\67\u009f\3\2\2\29<\5\5\3\2:<\5\7\4\2;9\3\2\2\2;:\3\2\2"+
		"\2<\4\3\2\2\2=>\t\2\2\2>\6\3\2\2\2?@\t\3\2\2@\b\3\2\2\2AB\t\4\2\2B\n\3"+
		"\2\2\2CD\7\62\2\2D\f\3\2\2\2EF\7]\2\2F\16\3\2\2\2GH\7_\2\2H\20\3\2\2\2"+
		"IJ\7}\2\2J\22\3\2\2\2KL\7\177\2\2L\24\3\2\2\2MN\7*\2\2N\26\3\2\2\2OP\7"+
		"+\2\2P\30\3\2\2\2QR\7g\2\2RS\7n\2\2ST\7u\2\2TU\7g\2\2U\32\3\2\2\2VW\7"+
		"h\2\2WX\7c\2\2XY\7n\2\2YZ\7u\2\2Z[\7g\2\2[\34\3\2\2\2\\]\7h\2\2]^\7w\2"+
		"\2^_\7p\2\2_\36\3\2\2\2`a\7k\2\2ab\7h\2\2b \3\2\2\2cd\7k\2\2de\7u\2\2"+
		"ef\7|\2\2fg\7g\2\2gh\7t\2\2hi\7q\2\2i\"\3\2\2\2jk\7r\2\2kl\7t\2\2lm\7"+
		"g\2\2mn\7f\2\2n$\3\2\2\2op\7t\2\2pq\7g\2\2qr\7v\2\2rs\7w\2\2st\7t\2\2"+
		"tu\7p\2\2u&\3\2\2\2vw\7u\2\2wx\7w\2\2xy\7e\2\2yz\7e\2\2z(\3\2\2\2{|\7"+
		"v\2\2|}\7j\2\2}~\7g\2\2~\177\7p\2\2\177*\3\2\2\2\u0080\u0081\7v\2\2\u0081"+
		"\u0082\7t\2\2\u0082\u0083\7w\2\2\u0083\u0084\7g\2\2\u0084,\3\2\2\2\u0085"+
		"\u0087\5\t\5\2\u0086\u0085\3\2\2\2\u0087\u0088\3\2\2\2\u0088\u0086\3\2"+
		"\2\2\u0088\u0089\3\2\2\2\u0089.\3\2\2\2\u008a\u008d\5\3\2\2\u008b\u008d"+
		"\7a\2\2\u008c\u008a\3\2\2\2\u008c\u008b\3\2\2\2\u008d\60\3\2\2\2\u008e"+
		"\u0093\5/\30\2\u008f\u0092\5/\30\2\u0090\u0092\5\t\5\2\u0091\u008f\3\2"+
		"\2\2\u0091\u0090\3\2\2\2\u0092\u0095\3\2\2\2\u0093\u0091\3\2\2\2\u0093"+
		"\u0094\3\2\2\2\u0094\62\3\2\2\2\u0095\u0093\3\2\2\2\u0096\u0098\t\5\2"+
		"\2\u0097\u0096\3\2\2\2\u0098\u0099\3\2\2\2\u0099\u0097\3\2\2\2\u0099\u009a"+
		"\3\2\2\2\u009a\u009b\3\2\2\2\u009b\u009c\b\32\2\2\u009c\64\3\2\2\2\u009d"+
		"\u009e\t\6\2\2\u009e\66\3\2\2\2\u009f\u00a0\13\2\2\2\u00a08\3\2\2\2\t"+
		"\2;\u0088\u008c\u0091\u0093\u0099\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}