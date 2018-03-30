import java.io.*;   // For InputStream, IOException
import java.net.*;  // For DatagramPacket

public interface ItemQuoteDecoder {
  ItemQuote decode(InputStream source) throws IOException;
  ItemQuote decode(DatagramPacket packet) throws IOException;
}
