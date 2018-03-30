import java.io.*;  // For InputStream, ByteArrayOutputStream

public class Framer {

  // 区切り文字 or ストリームの終わりまで入力ストリームを読み込む
  public static byte[] nextToken(InputStream in, byte[] delimiter)
	  throws IOException {
		int nextByte;

		// ストリームがすでに終了している場合は return null
		if ((nextByte = in.read()) == -1) return null;

    // 字句のバイトを格納するバッファを作成
		// # データを 1 バイトずつ集める
		// # ByteArray(Input|Output)Stream はバイト配列をバイトストリームのように扱える
		ByteArrayOutputStream tokenBuffer = new ByteArrayOutputStream();
		do {

		  // 読み込んだ最後のバイトをバッファに入れる
		  tokenBuffer.write(nextByte);

			// これまでの入力が含まれるバイト配列を取得
			// # 繰り返しのたび新しいバイト配列を作成するのは非効率だがシンプル
			byte[] currentToken = tokenBuffer.toByteArray();

			// delimiter が現在の字句の接尾語かどうかをチェック
			// # もしそうならすでに読み込んだバイトが含まれる新しいバイト配列を作成し delimiter を取り除いたものを返す
			
			if (endsWith(currentToken, delimiter)) {
			  int tokenLength = currentToken.length - delimiter.length;
				byte[] token = new byte[tokenLength];
				System.arraycopy(currentToken, 0, token, 0, tokenLength);
				return token;
		  }

			// 次のバイトを取得する
		} while ((nextByte = in.read()) != -1);  // ストリームの終わりで停止

    // ストリームの終わりで現在の字句を返す
		return tokenBuffer.toByteArray();  // 少なくとも 1 バイトを受信した
	}

	// value が suffix に格納されたバイト列で終了している場合は true を返す
	private static boolean endsWith(byte[] value, byte[] suffix) {
	  // 長さを比較する
		// # 候補の列が delimiter と等しくなるには少なくとも delimiter と同じ長さでなければならない
	  if (value.length < suffix.length) return false;
    // バイト列を比較, 違いがあれば false
		// # 字句の最後の suffix.length (delimiter.length) のバイト列を delimiter と比較
		for (int offset = 1; offset <= suffix.length; offset++)
		  if (value[value.length - offset] != suffix[suffix.length - offset])
			  return false;
    // 一致していれば true
		return true;
	}
}

