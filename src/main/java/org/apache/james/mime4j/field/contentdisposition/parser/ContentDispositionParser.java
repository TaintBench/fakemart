package org.apache.james.mime4j.field.contentdisposition.parser;

import java.io.InputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

public class ContentDispositionParser implements ContentDispositionParserConstants {
    private static int[] jj_la1_0;
    private String dispositionType;
    private Vector<int[]> jj_expentries;
    private int[] jj_expentry;
    private int jj_gen;
    SimpleCharStream jj_input_stream;
    private int jj_kind;
    private final int[] jj_la1;
    public Token jj_nt;
    private int jj_ntk;
    private List<String> paramNames;
    private List<String> paramValues;
    public Token token;
    public ContentDispositionParserTokenManager token_source;

    public String getDispositionType() {
        return this.dispositionType;
    }

    public List<String> getParamNames() {
        return this.paramNames;
    }

    public List<String> getParamValues() {
        return this.paramValues;
    }

    public static void main(String[] args) throws ParseException {
        while (true) {
            try {
                new ContentDispositionParser(System.in).parseLine();
            } catch (Exception x) {
                x.printStackTrace();
                return;
            }
        }
    }

    public final void parseLine() throws ParseException {
        parse();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case 1:
                jj_consume_token(1);
                break;
            default:
                this.jj_la1[0] = this.jj_gen;
                break;
        }
        jj_consume_token(2);
    }

    public final void parseAll() throws ParseException {
        parse();
        jj_consume_token(0);
    }

    public final void parse() throws ParseException {
        this.dispositionType = jj_consume_token(20).image;
        while (true) {
            switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
                case 3:
                    jj_consume_token(3);
                    parameter();
                default:
                    this.jj_la1[1] = this.jj_gen;
                    return;
            }
        }
    }

    public final void parameter() throws ParseException {
        Token attrib = jj_consume_token(20);
        jj_consume_token(4);
        String val = value();
        this.paramNames.add(attrib.image);
        this.paramValues.add(val);
    }

    public final String value() throws ParseException {
        int jj_ntk;
        Token t;
        if (this.jj_ntk == -1) {
            jj_ntk = jj_ntk();
        } else {
            jj_ntk = this.jj_ntk;
        }
        switch (jj_ntk) {
            case 18:
                t = jj_consume_token(18);
                break;
            case 19:
                t = jj_consume_token(19);
                break;
            case 20:
                t = jj_consume_token(20);
                break;
            default:
                this.jj_la1[2] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        return t.image;
    }

    static {
        jj_la1_0();
    }

    private static void jj_la1_0() {
        jj_la1_0 = new int[]{2, 8, 1835008};
    }

    public ContentDispositionParser(InputStream stream) {
        this(stream, null);
    }

    public ContentDispositionParser(InputStream stream, String encoding) {
        this.paramNames = new ArrayList();
        this.paramValues = new ArrayList();
        this.jj_la1 = new int[3];
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        try {
            this.jj_input_stream = new SimpleCharStream(stream, encoding, 1, 1);
            this.token_source = new ContentDispositionParserTokenManager(this.jj_input_stream);
            this.token = new Token();
            this.jj_ntk = -1;
            this.jj_gen = 0;
            for (int i = 0; i < 3; i++) {
                this.jj_la1[i] = -1;
            }
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public void ReInit(InputStream stream) {
        ReInit(stream, null);
    }

    public void ReInit(InputStream stream, String encoding) {
        try {
            this.jj_input_stream.ReInit(stream, encoding, 1, 1);
            this.token_source.ReInit(this.jj_input_stream);
            this.token = new Token();
            this.jj_ntk = -1;
            this.jj_gen = 0;
            for (int i = 0; i < 3; i++) {
                this.jj_la1[i] = -1;
            }
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public ContentDispositionParser(Reader stream) {
        this.paramNames = new ArrayList();
        this.paramValues = new ArrayList();
        this.jj_la1 = new int[3];
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        this.jj_input_stream = new SimpleCharStream(stream, 1, 1);
        this.token_source = new ContentDispositionParserTokenManager(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 3; i++) {
            this.jj_la1[i] = -1;
        }
    }

    public void ReInit(Reader stream) {
        this.jj_input_stream.ReInit(stream, 1, 1);
        this.token_source.ReInit(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 3; i++) {
            this.jj_la1[i] = -1;
        }
    }

    public ContentDispositionParser(ContentDispositionParserTokenManager tm) {
        this.paramNames = new ArrayList();
        this.paramValues = new ArrayList();
        this.jj_la1 = new int[3];
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        this.token_source = tm;
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 3; i++) {
            this.jj_la1[i] = -1;
        }
    }

    public void ReInit(ContentDispositionParserTokenManager tm) {
        this.token_source = tm;
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 3; i++) {
            this.jj_la1[i] = -1;
        }
    }

    private final Token jj_consume_token(int kind) throws ParseException {
        Token oldToken = this.token;
        if (oldToken.next != null) {
            this.token = this.token.next;
        } else {
            Token token = this.token;
            Token nextToken = this.token_source.getNextToken();
            token.next = nextToken;
            this.token = nextToken;
        }
        this.jj_ntk = -1;
        if (this.token.kind == kind) {
            this.jj_gen++;
            return this.token;
        }
        this.token = oldToken;
        this.jj_kind = kind;
        throw generateParseException();
    }

    public final Token getNextToken() {
        if (this.token.next != null) {
            this.token = this.token.next;
        } else {
            Token token = this.token;
            Token nextToken = this.token_source.getNextToken();
            token.next = nextToken;
            this.token = nextToken;
        }
        this.jj_ntk = -1;
        this.jj_gen++;
        return this.token;
    }

    public final Token getToken(int index) {
        int i = 0;
        Token t = this.token;
        while (i < index) {
            Token t2;
            if (t.next != null) {
                t2 = t.next;
            } else {
                t2 = this.token_source.getNextToken();
                t.next = t2;
            }
            i++;
            t = t2;
        }
        return t;
    }

    private final int jj_ntk() {
        Token token = this.token.next;
        this.jj_nt = token;
        int i;
        if (token == null) {
            token = this.token;
            Token nextToken = this.token_source.getNextToken();
            token.next = nextToken;
            i = nextToken.kind;
            this.jj_ntk = i;
            return i;
        }
        i = this.jj_nt.kind;
        this.jj_ntk = i;
        return i;
    }

    public ParseException generateParseException() {
        int i;
        this.jj_expentries.removeAllElements();
        boolean[] la1tokens = new boolean[23];
        for (i = 0; i < 23; i++) {
            la1tokens[i] = false;
        }
        if (this.jj_kind >= 0) {
            la1tokens[this.jj_kind] = true;
            this.jj_kind = -1;
        }
        for (i = 0; i < 3; i++) {
            if (this.jj_la1[i] == this.jj_gen) {
                for (int j = 0; j < 32; j++) {
                    if ((jj_la1_0[i] & (1 << j)) != 0) {
                        la1tokens[j] = true;
                    }
                }
            }
        }
        for (i = 0; i < 23; i++) {
            if (la1tokens[i]) {
                this.jj_expentry = new int[1];
                this.jj_expentry[0] = i;
                this.jj_expentries.addElement(this.jj_expentry);
            }
        }
        int[][] exptokseq = new int[this.jj_expentries.size()][];
        for (i = 0; i < this.jj_expentries.size(); i++) {
            exptokseq[i] = (int[]) this.jj_expentries.elementAt(i);
        }
        return new ParseException(this.token, exptokseq, tokenImage);
    }

    public final void enable_tracing() {
    }

    public final void disable_tracing() {
    }
}
