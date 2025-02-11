package mik_udp;
// Java program to illustrate Server side
// Implementation using DatagramSocket
import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;

public class udpBaseServer_2
{
	public static void main(String[] args) throws IOException
	{
		// Step 1 : Create a socket to listen at port 1234
		DatagramSocket ds = new DatagramSocket(1234);
		byte[] receive = new byte[65535];

		DatagramPacket DpReceive = null;
		while (true)
		{

			// Step 2 : create a DatgramPacket to receive the data.
			DpReceive = new DatagramPacket(receive, receive.length);

			// Step 3 : revieve the data in byte buffer.
			ds.receive(DpReceive);

			System.out.println("Client:-" + data(receive));

			// Exit the server if the client sends "bye"
			if (data(receive).toString().equals("bye"))
			{
				System.out.println("Client sent bye.....EXITING");
				break;
			}

			// Clear the buffer after every message.
			receive = new byte[65535];
		}
	}

	// A utility method to convert the byte array
	// data into a string representation.
	public static StringBuilder data(byte[] a)
	{
		if (a == null)
			return null;
		StringBuilder ret = new StringBuilder();
		int i = 0;
		while (a[i] != 0)
		{
			ret.append((char) a[i]);
			i++;
		}
		return ret;
	}
}

/* 
   // Try to send our data

    try {

      // Create an InetAddress object to store our address, and use it to create a packet to send

      InetAddress address = InetAddress.getByName(SEND_ADDRESS);

      DatagramPacket sendPacket = new DatagramPacket(sendBuffer, sendBuffer.length, address, SEND_PORT);



      sendSocket.connect(address, SEND_PORT);

      // Send the packet

      sendSocket.send(sendPacket);



      // Log message

      System.out.println("[NetController - " + timestamp() + "] Sending packet to "

      + SEND_ADDRESS + ":" + SEND_PORT + ", data: " + new String(sendPacket.getData()));



      // Close the socket since we are done with it

      sendSocket.disconnect();

      sendSocket.close();

    }
 */