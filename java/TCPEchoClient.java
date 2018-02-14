import java.net.*; // for Socket
import java.io.*;  // for IOException, Input/OutputStream

// アプリケーションセットアップ, パラメータの解析
public class TCPEchoClient {
  public static void main(String[] args) throws IOException {
	  if ((args.length < 2) || (args.length > 3)) // Checking num of args
		  throw new IllegalArgumentException("parameter(s): <Server> <Word> [<Port]");

		String server = args[0];  // ServerName or IP addr
		// 引数で入力された文字列をデフォルトの文字エンコードでバイトに変換
		// TCP はバイト列を送受信する
		byte[] byteBuffer = args[1].getBytes();

		//int servPort = (args.length == 3) ? Integer.parseInt(args[2]) : 7;
		int servPort = (args.length == 3) ? Integer.parseInt(args[2]) : 5000;

		// サーバの指定されたポートに接続するソケットを作成
		// Socket コンストラクタでソケットを作成
		// ホスト名 or IP address で指定されたサーバ (server) との接続を確立する
		Socket socket = new Socket(server, servPort);
		System.out.println("Connected to server...sending echo string");

    // ソケットの入出力ストリームを取得する
		InputStream in = socket.getInputStream();
		OutputStream out = socket.getOutputStream();

    // send enced char to server
		// エコーサーバに文字列を送信する
		out.write(byteBuffer);

		// receive same chr from server
		// エコーサーバからの応答を受信する
		int totalBytesRcvd = 0;  // 受信した合計バイト数
		int bytesRcvd;           // 前回の読み込みで受信したバイト数

		// エコーされるのは送信した文字列と同じ長さ (byteBuffer.length) なので
		// 送信したのと同じバイト数が帰ってくるまで繰り返しデータを受信する
		while (totalBytesRcvd < byteBuffer.length) {

System.out.println("受信待ち....");
System.out.println("??  ??");
bytesRcvd = in.read(byteBuffer, totalBytesRcvd, byteBuffer.length - totalBytesRcvd);
System.out.println("?? " + byteBuffer + " ??");

		  if ((bytesRcvd = in.read(byteBuffer, totalBytesRcvd,
						byteBuffer.length - totalBytesRcvd)) == -1)
				throw new SocketException("Connection closed prematurely");
			totalBytesRcvd += bytesRcvd;
		}

		System.out.println("Received: " + new String(byteBuffer));

		socket.close(); // close socket and stream
	}
}
