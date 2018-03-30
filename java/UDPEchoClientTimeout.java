import java.net.*; // for DatagramSocket, DatagramPacket, InetAddress
import java.io.*;  // for IOException

public class UDPEchoClientTimeout {

  private static final int TIMEOUT = 3000; // 再送のタイムアウト (ミリ秒)
  private static final int MAXTRIES = 5;   // 再送回数の上限

	public static void main(String[] args) throws IOException {
	  if ((args.length < 2) || (args.length > 3)) // args の数チェック
		  throw new IllegalArgumentException("Parameter(s): <Server> <Word> [<Port>]");
	
	  InetAddress serverAddress = InetAddress.getByName(args[0]); // servers name
		// デフォルトのエンコード方式で引数の String をバイトに変換
		byte[] bytesToSend = args[1].getBytes();

    // Default が UDP の Echo Protocol のポート 7 
		// Server 側でのポート 7 での実行は su 権限が必要
		int servPort = (args.length == 3) ? Integer.parseInt(args[2]) : 7;
		//int servPort = (args.length == 3) ? Integer.parseInt(args[2]) : 5000;
	
		// Create a UDP socket (ポートとアドレスを指定してないので任意のものを使う)
		DatagramSocket socket = new DatagramSocket();
	
		socket.setSoTimeout(TIMEOUT); // 受信待機時間の最大値 (ミリ秒)
	
	  // 送信パケット
		DatagramPacket sendPacket = new DatagramPacket(bytesToSend, bytesToSend.length, serverAddress, servPort);
	
		// 受信パケット
		DatagramPacket receivePacket = new DatagramPacket(new byte [bytesToSend.length], bytesToSend.length);
	
		int tries = 0;  // パケットが紛失した場合は再送
		boolean receivedResponse = false;
		do {
		  socket.send(sendPacket);  // エコー文字列を送信する
			try {
		    socket.receive(receivePacket);  // エコー応答の受信を試みる
	
			  // 送信元のチェック
			  if (!receivePacket.getAddress().equals(serverAddress))
				  throw new IOException("Received packet from an unknown source");
	
			  receivedResponse = true;
			} catch (InterruptedIOException e) {  // 何も受け取ってない
				tries += 1;
				System.out.println("Time out, " + (MAXTRIES - tries) + " more tries...");
			}
		} while ((!receivedResponse) && (tries < MAXTRIES));
	
		if (receivedResponse)
			System.out.println("Received: " + new String(receivePacket.getData()));
		else
			System.out.println("No response -- giving up.");
	
		socket.close();
	}
}



