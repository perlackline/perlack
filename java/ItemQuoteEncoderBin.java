import java.io.*;  // For ByteArrayOutputStream, DataOutputStream

public class ItemQuoteEncoderBin implements ItemQuoteEncoder, ItemQuoteBinConst {

	// 定数, 変数, コンストラクタの定義
  private String encoding;  // 文字エンコード方式

	public ItemQuoteEncoderBin() {
	  encoding = DEFAULT_ENCODING;
	}

	public ItemQuoteEncoderBin(String encoding) {
	  this.encoding = encoding;
	}

	// encode()
	public byte[] encode(ItemQuote item) throws Exception {

		// Output の setup
		// encode したメッセージのバイトを集めるインスタンス buf
	  ByteArrayOutputStream buf = new ByteArrayOutputStream();

		// buf を DataOutputStream の中にカプセル化 (ラップ?) することで
		// DataOutputStream のメソッドを使って 2 進整数を書き込めるようにする
		DataOutputStream out = new DataOutputStream(buf);

		// 整数を書き込む
		// long 型 8 バイトをビッグエンディアン順にストリームを書き込む
		out.writeLong(item.itemNumber);
		// Int 型 4 バイトを (同上)
		out.writeInt(item.quantity);
		out.writeInt(item.unitPrice);

		// 論理値をフラグとして書き込む
		// フラグバイトを初期化
		byte flags = 0;
		// 値が true の場合は該当するビットを 1 に設定する
		// ビットは ItemQuoteBinConst インタフェースのビット演算子で
		// それぞれのバイトの最上位ビットと再開ビットになるように定義されている
		if (item.discounted) flags |= DISCOUNT_FLAG;
		if (item.inStock) flags |= IN_STOCK_FLAG;
		// バイトをバイトストリームに書き込む
		out.writeByte(flags);

    // Description をバイトに変換
		// DetaOutputStream は String を書き込むメソッドをもっているが
		// サポートは UTF-8 のみ
		// ここでは他のエンコード方式もサポートしたいので明示的に文字列をバイトに変換する
		byte[] encodedDesc = item.itemDescription.getBytes(encoding);

		// Description の長さチェック
		// 文字列には明示的な長さのエンコード方式を使って 1 バイトで長さを示す
		// 1 バイトに格納できる最大値は 255 なのでセットできる文字列長は 255 まで
		if (encodedDesc.length > MAX_DESC_LEN)
		  throw new IOException("Item Description exceeds encoded length limit");

		// encoded string を書き込む
		// エンコードした文字列の長さ, 次にバッファ内のバイトを書き込む
		out.writeByte(encodedDesc.length);
		out.write(encodedDesc);

		// OutputStream を flush
		// バイトを下位のバイトバッファに flush by DataOutputStream 
		out.flush();
		return buf.toByteArray();
	}
}

