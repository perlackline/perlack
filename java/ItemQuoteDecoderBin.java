import java.io.*;   // For ByteArrayInputStream
import java.net.*;  // For DatagramPacket

public class ItemQuoteDecoderBin implements ItemQuoteDecoder, ItemQuoteBinConst {

	private String encoding;  // 文字エンコード方式

	public ItemQuoteDecoderBin() {
		encoding = DEFAULT_ENCODING;
	}

	public ItemQuoteDecoderBin(String encoding) {
	  this.encoding = encoding;
	}

	// decode stream
	public ItemQuote decode(InputStream wire) throws IOException {
	  boolean discounted, inStock;

		// InputStream をラップ
		// DataInputStream の readLong(), readInt() で
		// バイナリデータ型を入力から読み込むため
		DataInputStream src = new DataInputStream(wire);

		// 整数を読み込む
		long itemNumber = src.readLong();
		int quantity = src.readInt();
		int unitPrice = src.readInt();
		byte flags = src.readByte();
		int stringLength = src.read();  // 符号なしバイトを int で返す
		if (stringLength == -1) throw new EOFException();
		byte[] stringBuf = new byte[stringLength];
		src.readFully(stringBuf);
		String itemDesc = new String(stringBuf, encoding);
		return new ItemQuote(itemNumber, itemDesc, quantity, unitPrice,
			((flags & DISCOUNT_FLAG) == DISCOUNT_FLAG),
			((flags & IN_STOCK_FLAG) == IN_STOCK_FLAG));
	}

	public ItemQuote decode(DatagramPacket p) throws IOException {
	  ByteArrayInputStream payload =
			new ByteArrayInputStream(p.getData(), p.getOffset(), p.getLength());
		return decode(payload);	
	}
}
