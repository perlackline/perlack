import java.net.*; // for InetAddress

public class InetAddressExample {
  public static void main(String[] args){
    // get localhost name, IP addr
		// ローカルホストに関する情報を出力する
    try{
			// ローカルホストの InetAddress インスタンス
      InetAddress address = InetAddress.getLocalHost();
			System.out.println("Local Host:");
			System.out.println("\t" + address.getHostName());
			System.out.println("\t" + address.getHostAddress());
		} catch (UnknownHostException e) {
			System.out.println("Unable to determine this host's address");
		}

		// コマンドラインで指定された各ホストの情報を要求
		for (int i = 0; i < args.length; i++) {
			// get hostname and  address specified on cmdline
			try{
				// 指定されたホストごとの InetAddress インスタンスの配列
			  InetAddress[] addressList = InetAddress.getAllByName(args[i]);
				System.out.println(args[i] + ":");
				// print first name.
				System.out.println("\t" + addressList[0].getHostName());
				for (int j = 0; j < addressList.length; j++)
				  System.out.println("\t" + addressList[j].getHostAddress());
			} catch (UnknownHostException e) {
			  System.out.println("Unable to find address for " + args[i]);
			}
		}
	}
}
