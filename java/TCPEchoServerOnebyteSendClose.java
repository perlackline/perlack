import java.net.*; // Socket, ServerSocket, InetAddress に必要 
import java.io.*;  // IOException, Input/OutputStream に必要

// データを 1 byte だけ読み込んでソケットをクローズするように change

public class TCPEchoServerOnebyteSendClose {
	private static final int BUFSIZE = 32; // 受信バッファのサイズ
	public static void main(String[] args) throws IOException {
	  if (args.length != 1)  // 引数が正しいか調べる
			throw new IllegalArgumentException("Parameter(s): <Port>");
		int servPort = Integer.parseInt(args[0]);

		// クライントの接続要求を受け付けるサーバソケットを作成する
		ServerSocket servSock = new ServerSocket(servPort);

		int recvMsgSize;  // 受信したメッセージのサイズ
		byte[] byteBuffer = new byte[BUFSIZE]; // 受信バッファ

		for(;;) { // 繰り返し実行され, 接続を受け付けて処理する
			Socket clntSock = servSock.accept();  // クライアント接続を取得

			System.out.println("Handling client at" +
			  clntSock.getInetAddress().getHostAddress() + " on port " +
				  clntSock.getPort());

			InputStream in = clntSock.getInputStream();
			OutputStream out = clntSock.getOutputStream();

			// クライアントが接続をクローズして, -1 が返されるまで受信する
			//while ((recvMsgSize = in.read(byteBuffer)) != -1)
				//out.write(byteBuffer, 0, recvMsgSize);
			recvMsgSize = in.read();
			out.write(recvMsgSize);

			clntSock.close();  // ソケットをクローズ. このクライアントとの接続は終了
		}
		/* この部分には到達しない */
	}
}
