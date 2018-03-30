import java.net.*;  // For DatagramSocket, DatagramPacket, InetAddress
import java.io.*;   // For IOException

// UDP Echo server. Datagram を受信後そのままクライアントに返す. Datagram の先頭 255 文字 (?) のみを処理する. 超過した文字 (?) は破棄.

// データグラムを 1 つおきにしかエコーしないように change の Test

public class UDPEchoServerOnedataTest {
  private static final int ECHOMAX = 255;  // Echo Datagram MAX size
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

			int length = packet.getLength();
			System.out.println("length: " + length);
			for (int i = 0; i < length; i++){
			  packet.setData(packet.getData(), i, 1);
			  socket.send(packet);        // クライアントにパケットをそのまま送り返す
			  System.out.println("send: " + new String(packet.getLength().getData()));
			  System.out.println("i: " + i);
			}
			System.out.println("Received: " + new String(packet.getData()));
		  packet.setData(packet.getData());

			packet.setLength(ECHOMAX);  // バッファが縮小しないように長さをリセットする
		}
	}
}

