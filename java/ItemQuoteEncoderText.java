import java.io.*;  // For ByteArrayOutputStream, OutputStreamWriter

public class ItemQuoteEncoderText implements ItemQuoteEncoder, ItemQuoteTextConst {

  private String encoding;  // 文字エンコード方式

  // コンストラクタ (encoding が未指定)
	public ItemQuoteEncoderText() {
	  encoding = DEFAULT_ENCODING;
  }

  // コンストラクタ (encoding 指定)
	public ItemQuoteEncoderText(String encoding) {
	  this.encoding = encoding;
  }

  // encode() メソッド
	public byte[] encode(ItemQuote item) throws Exception {

  	// 出力バッファを作成
		// バイト列を集める buf
	  ByteArrayOutputStream buf = new ByteArrayOutputStream();
		// OutputStreamWriter のメソッドで char -> byte 変換をするために buf をラップ
		OutputStreamWriter out    = new OutputStreamWriter(buf, encoding);

		// 最初の整数とデリミタ (空白) を書き込む
		out.write(item.itemNumber + " ");

		// デリミタをチェック
		// フィールドにデリミタが含まれていたら例外を投げる
		if(item.itemDescription.indexOf('\n') != -1)
		  throw new IOException("Invalid description (contains newline)");

		// itemDescription と残りの整数を書き込む
		out.write(item.itemDescription + "\n" + item.quantity + " " + item.unitPrice + " ");

		// 論理値が true の場合はフラグ文字を書き込む
		// 値引きがある場合 d を挿入
		if(item.discounted) out.write('d');
		// 在庫がある場合 s を挿入
		if(item.inStock) out.write('s');

		// フラグフィールドの区切り文字を書き込む
		out.write('\n');

    // 出力ストリームをフラッシュ (流し出す) する
		out.flush();

		// 下位のストリームににフラッシュしたバイト列 (ストリーム) に対して
		// その長さが MAX_WIRE_LENGTH を超えてないかチェックする
		// 長ければ例外を投げる
		// # 長さの制限を設けることで受信側は予め DatagramPacket の受信に必要な
		// # バッファサイズを知ることができる
		// # ストリーム通信では不要だが役に立つ機能
		if(buf.size() > MAX_WIRE_LENGTH)
		  throw new IOException("Encoded length too long");

		// 出力ストリームからバイト配列を返す
		return buf.toByteArray();
	}
}
