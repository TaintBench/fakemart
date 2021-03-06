package org.apache.james.mime4j.field.datetime.parser;

import java.io.InputStream;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.util.Vector;
import org.apache.james.mime4j.field.address.parser.AddressListParserConstants;
import org.apache.james.mime4j.field.contenttype.parser.ContentTypeParserConstants;
import org.apache.james.mime4j.field.datetime.DateTime;
import org.apache.james.mime4j.field.structured.parser.StructuredFieldParserConstants;

public class DateTimeParser implements DateTimeParserConstants {
    private static final boolean ignoreMilitaryZoneOffset = true;
    private static int[] jj_la1_0;
    private static int[] jj_la1_1;
    private Vector<int[]> jj_expentries;
    private int[] jj_expentry;
    private int jj_gen;
    SimpleCharStream jj_input_stream;
    private int jj_kind;
    private final int[] jj_la1;
    public Token jj_nt;
    private int jj_ntk;
    public Token token;
    public DateTimeParserTokenManager token_source;

    private static class Date {
        private int day;
        private int month;
        private String year;

        public Date(String year, int month, int day) {
            this.year = year;
            this.month = month;
            this.day = day;
        }

        public String getYear() {
            return this.year;
        }

        public int getMonth() {
            return this.month;
        }

        public int getDay() {
            return this.day;
        }
    }

    private static class Time {
        private int hour;
        private int minute;
        private int second;
        private int zone;

        public Time(int hour, int minute, int second, int zone) {
            this.hour = hour;
            this.minute = minute;
            this.second = second;
            this.zone = zone;
        }

        public int getHour() {
            return this.hour;
        }

        public int getMinute() {
            return this.minute;
        }

        public int getSecond() {
            return this.second;
        }

        public int getZone() {
            return this.zone;
        }
    }

    public static void main(String[] args) throws ParseException {
        while (true) {
            try {
                new DateTimeParser(System.in).parseLine();
            } catch (Exception x) {
                x.printStackTrace();
                return;
            }
        }
    }

    private static int parseDigits(Token token) {
        return Integer.parseInt(token.image, 10);
    }

    private static int getMilitaryZoneOffset(char c) {
        return 0;
    }

    public final DateTime parseLine() throws ParseException {
        DateTime dt = date_time();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case 1:
                jj_consume_token(1);
                break;
            default:
                this.jj_la1[0] = this.jj_gen;
                break;
        }
        jj_consume_token(2);
        return dt;
    }

    public final DateTime parseAll() throws ParseException {
        DateTime dt = date_time();
        jj_consume_token(0);
        return dt;
    }

    public final DateTime date_time() throws ParseException {
        int jj_ntk;
        if (this.jj_ntk == -1) {
            jj_ntk = jj_ntk();
        } else {
            jj_ntk = this.jj_ntk;
        }
        switch (jj_ntk) {
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
            case 10:
                day_of_week();
                jj_consume_token(3);
                break;
            default:
                this.jj_la1[1] = this.jj_gen;
                break;
        }
        Date d = date();
        Time t = time();
        return new DateTime(d.getYear(), d.getMonth(), d.getDay(), t.getHour(), t.getMinute(), t.getSecond(), t.getZone());
    }

    public final String day_of_week() throws ParseException {
        int jj_ntk;
        if (this.jj_ntk == -1) {
            jj_ntk = jj_ntk();
        } else {
            jj_ntk = this.jj_ntk;
        }
        switch (jj_ntk) {
            case 4:
                jj_consume_token(4);
                break;
            case 5:
                jj_consume_token(5);
                break;
            case 6:
                jj_consume_token(6);
                break;
            case 7:
                jj_consume_token(7);
                break;
            case 8:
                jj_consume_token(8);
                break;
            case 9:
                jj_consume_token(9);
                break;
            case 10:
                jj_consume_token(10);
                break;
            default:
                this.jj_la1[2] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        return this.token.image;
    }

    public final Date date() throws ParseException {
        int d = day();
        return new Date(year(), month(), d);
    }

    public final int day() throws ParseException {
        return parseDigits(jj_consume_token(46));
    }

    public final int month() throws ParseException {
        int jj_ntk;
        if (this.jj_ntk == -1) {
            jj_ntk = jj_ntk();
        } else {
            jj_ntk = this.jj_ntk;
        }
        switch (jj_ntk) {
            case 11:
                jj_consume_token(11);
                return 1;
            case 12:
                jj_consume_token(12);
                return 2;
            case 13:
                jj_consume_token(13);
                return 3;
            case 14:
                jj_consume_token(14);
                return 4;
            case StructuredFieldParserConstants.CONTENT /*15*/:
                jj_consume_token(15);
                return 5;
            case 16:
                jj_consume_token(16);
                return 6;
            case 17:
                jj_consume_token(17);
                return 7;
            case 18:
                jj_consume_token(18);
                return 8;
            case 19:
                jj_consume_token(19);
                return 9;
            case 20:
                jj_consume_token(20);
                return 10;
            case 21:
                jj_consume_token(21);
                return 11;
            case 22:
                jj_consume_token(22);
                return 12;
            default:
                this.jj_la1[3] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
    }

    public final String year() throws ParseException {
        return jj_consume_token(46).image;
    }

    public final Time time() throws ParseException {
        int s = 0;
        int h = hour();
        jj_consume_token(23);
        int m = minute();
        switch (this.jj_ntk == -1 ? jj_ntk() : this.jj_ntk) {
            case ContentTypeParserConstants.ANY /*23*/:
                jj_consume_token(23);
                s = second();
                break;
            default:
                this.jj_la1[4] = this.jj_gen;
                break;
        }
        return new Time(h, m, s, zone());
    }

    public final int hour() throws ParseException {
        return parseDigits(jj_consume_token(46));
    }

    public final int minute() throws ParseException {
        return parseDigits(jj_consume_token(46));
    }

    public final int second() throws ParseException {
        return parseDigits(jj_consume_token(46));
    }

    public final int zone() throws ParseException {
        int jj_ntk;
        int i = -1;
        if (this.jj_ntk == -1) {
            jj_ntk = jj_ntk();
        } else {
            jj_ntk = this.jj_ntk;
        }
        switch (jj_ntk) {
            case DateTimeParserConstants.OFFSETDIR /*24*/:
                Token t = jj_consume_token(24);
                jj_ntk = parseDigits(jj_consume_token(46));
                if (!t.image.equals("-")) {
                    i = 1;
                }
                return jj_ntk * i;
            case 25:
            case 26:
            case 27:
            case 28:
            case 29:
            case 30:
            case AddressListParserConstants.QUOTEDSTRING /*31*/:
            case 32:
            case AddressListParserConstants.ANY /*33*/:
            case 34:
            case DateTimeParserConstants.MILITARY_ZONE /*35*/:
                return obs_zone();
            default:
                this.jj_la1[5] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
    }

    public final int obs_zone() throws ParseException {
        int jj_ntk;
        int z;
        if (this.jj_ntk == -1) {
            jj_ntk = jj_ntk();
        } else {
            jj_ntk = this.jj_ntk;
        }
        switch (jj_ntk) {
            case 25:
                jj_consume_token(25);
                z = 0;
                break;
            case 26:
                jj_consume_token(26);
                z = 0;
                break;
            case 27:
                jj_consume_token(27);
                z = -5;
                break;
            case 28:
                jj_consume_token(28);
                z = -4;
                break;
            case 29:
                jj_consume_token(29);
                z = -6;
                break;
            case 30:
                jj_consume_token(30);
                z = -5;
                break;
            case AddressListParserConstants.QUOTEDSTRING /*31*/:
                jj_consume_token(31);
                z = -7;
                break;
            case 32:
                jj_consume_token(32);
                z = -6;
                break;
            case AddressListParserConstants.ANY /*33*/:
                jj_consume_token(33);
                z = -8;
                break;
            case 34:
                jj_consume_token(34);
                z = -7;
                break;
            case DateTimeParserConstants.MILITARY_ZONE /*35*/:
                z = getMilitaryZoneOffset(jj_consume_token(35).image.charAt(0));
                break;
            default:
                this.jj_la1[6] = this.jj_gen;
                jj_consume_token(-1);
                throw new ParseException();
        }
        return z * 100;
    }

    static {
        jj_la1_0();
        jj_la1_1();
    }

    private static void jj_la1_0() {
        jj_la1_0 = new int[]{2, 2032, 2032, 8386560, 8388608, -16777216, -33554432};
    }

    private static void jj_la1_1() {
        jj_la1_1 = new int[]{0, 0, 0, 0, 0, 15, 15};
    }

    public DateTimeParser(InputStream stream) {
        this(stream, null);
    }

    public DateTimeParser(InputStream stream, String encoding) {
        this.jj_la1 = new int[7];
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        try {
            this.jj_input_stream = new SimpleCharStream(stream, encoding, 1, 1);
            this.token_source = new DateTimeParserTokenManager(this.jj_input_stream);
            this.token = new Token();
            this.jj_ntk = -1;
            this.jj_gen = 0;
            for (int i = 0; i < 7; i++) {
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
            for (int i = 0; i < 7; i++) {
                this.jj_la1[i] = -1;
            }
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        }
    }

    public DateTimeParser(Reader stream) {
        this.jj_la1 = new int[7];
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        this.jj_input_stream = new SimpleCharStream(stream, 1, 1);
        this.token_source = new DateTimeParserTokenManager(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 7; i++) {
            this.jj_la1[i] = -1;
        }
    }

    public void ReInit(Reader stream) {
        this.jj_input_stream.ReInit(stream, 1, 1);
        this.token_source.ReInit(this.jj_input_stream);
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 7; i++) {
            this.jj_la1[i] = -1;
        }
    }

    public DateTimeParser(DateTimeParserTokenManager tm) {
        this.jj_la1 = new int[7];
        this.jj_expentries = new Vector();
        this.jj_kind = -1;
        this.token_source = tm;
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 7; i++) {
            this.jj_la1[i] = -1;
        }
    }

    public void ReInit(DateTimeParserTokenManager tm) {
        this.token_source = tm;
        this.token = new Token();
        this.jj_ntk = -1;
        this.jj_gen = 0;
        for (int i = 0; i < 7; i++) {
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
        boolean[] la1tokens = new boolean[49];
        for (i = 0; i < 49; i++) {
            la1tokens[i] = false;
        }
        if (this.jj_kind >= 0) {
            la1tokens[this.jj_kind] = true;
            this.jj_kind = -1;
        }
        for (i = 0; i < 7; i++) {
            if (this.jj_la1[i] == this.jj_gen) {
                for (int j = 0; j < 32; j++) {
                    if ((jj_la1_0[i] & (1 << j)) != 0) {
                        la1tokens[j] = true;
                    }
                    if ((jj_la1_1[i] & (1 << j)) != 0) {
                        la1tokens[j + 32] = true;
                    }
                }
            }
        }
        for (i = 0; i < 49; i++) {
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
