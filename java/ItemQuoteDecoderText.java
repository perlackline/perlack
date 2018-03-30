import java.io.*;   // For InputStream, ByteArrayInputStream, IOException
import java.net.*;  // For DatagamPacket

public class ItemQuoteDecoderText implements ItemQuoteDecoder, ItemQuoteTextConst {

	private String encoding;  // 文字エンコード方式

  // エンコードが指定されていない
	public ItemQuoteDecoderText() {
	  encoding = DEFAULT_ENCODING;
	}

  // エンコードが指定されているなら
	public ItemQuoteDecoderText(String encoding) {
	  this.encoding = encoding;
	}

  // ストリームをデコード
	public ItemQuote decode(InputStream wire) throws IOException {
	  String itemNo, description, quant, price, flags;

		// エンコードした区切り文字を事前に取得する
		byte[] space = " ".getBytes(encoding);
		byte[] newline = "\n".getBytes(encoding);

		itemNo      = new String(Framer.nextToken(wire, space), encoding);
		description = new String(Framer.nextToken(wire, newline), encoding);
		quant       = new String(Framer.nextToken(wire, space), encoding);
		price       = new String(Framer.nextToken(wire, space), encoding);
		flags       = new String(Framer.nextToken(wire, newline), encoding);

		// ItemQuote を作成
		// ラッパーの変換メソッドで元の型に変換
		return new ItemQuote(Long.parseLong(itemNo), description,
																Integer.parseInt(quant),
																Integer.parseInt(price),
																// フラグ文字があるか
																(flags.indexOf('d') != -1),
																(flags.indexOf('s') != -1));
	}

  // パケットをデコードする
	public ItemQuote decode(DatagramPacket p) throws IOException {
	  // データを抽出してストリームに変換
	  ByteArrayInputStream payload =
		  new ByteArrayInputStream(p.getData(), p.getOffset(), p.getLength());
    // ストリームの decode() を呼び出す
		return decode(payload);
	}
}

