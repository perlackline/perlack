import java.net.*;  // For DatagramSocket, DatagramPacket, InetAddress
import java.io.*;   // For IOException

// ECHOMAX を 5 程度にして, 超過するデータグラムを受け付けてみる

public class UDPEchoServerMin {
  private static final int ECHOMAX = 5;  // Echo Datagram MAX size
  //private static final int ECHOMAX = 255;  // Echo Datagram MAX size
	public static void main(String[] args) throws IOException {

	  // 引数は 1 つで それはポート番号
	  if (args.length != 1)  // Check args
		  throw new IllegalArgumentException("Parameter(s): <Port>");

		// クライアントと違ってサーバ側のポートは明示的に指定する必要がある
		// UDP ではクライアントからは指定できないので
		int servPort = Integer.parseInt(args[0]);
	
		DatagramSocket socket = new DatagramSocket(servPort);
		DatagramPacket packet = new DatagramPacket(new byte[ECHOMAX], ECHOMAX);
	
		for (;;) {
			socket.receive(packet);  // Receive packet from client
			System.out.println("Handling client at " +
				packet.getAddress().getHostAddress() + " on port " + packet.getPort());
			socket.send(packet);        // クライアントにパケットをそのまま送り返す
			packet.setLength(ECHOMAX);  // バッファが縮小しないように長さをリセットする
		}
	}
}
