<%@page import="java.util.*"%>
<%@ include file="connect.jsp"%>
<%@page
	import="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
<%@ page
	import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream"%>
<%@ page
	import="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
<%@page
	import="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

		  <%
	
	int i;
 	String s2, s3, s4, s5, s6, s7, s12="", s13="", s14="", s15="", s16="";
	try {
	
			String ename=(String)application.getAttribute("uname");
			String file = request.getParameter("t1");
			String on = request.getParameter("t12");
			String cn = request.getParameter("cl");
			String cont = request.getParameter("text");
			String keys = "ef50a0ef2c3e3a5f";
			String h1 = "";
			String filename = "filename.txt";

            String type="Added Malacious Data";

			i = 1;

			byte[] keyValue = keys.getBytes();
			Key key = new SecretKeySpec(keyValue, "AES");
			Cipher c = Cipher.getInstance("AES");
			c.init(Cipher.ENCRYPT_MODE, key);
			String encryptedValue = new String(Base64.encode(cont
					.getBytes()));
			//D:/Workspace Jayam/SelCSp/WebContent
			PrintStream p = new PrintStream(new FileOutputStream(filename));
			p.print(new String(cont));

			MessageDigest md = MessageDigest.getInstance("SHA1");
			FileInputStream fis11 = new FileInputStream(filename);
			DigestInputStream dis1 = new DigestInputStream(fis11, md);
			BufferedInputStream bis1 = new BufferedInputStream(dis1);

			//Read the bis so SHA1 is auto calculated at dis
			while (true) {
				int b1 = bis1.read();
				if (b1 == -1)
					break;
			}

			BigInteger bi1 = new BigInteger(md.digest());
			String spl1 = bi1.toString();
			h1 = bi1.toString(16);
			/*KeyPairGenerator kg = KeyPairGenerator.getInstance("RSA");
			Cipher encoder = Cipher.getInstance("RSA");
			KeyPair kp = kg.generateKeyPair();

			Key pubKey = kp.getPublic();

			byte[] pub = pubKey.getEncoded();
			//				System.out.println("PUBLIC KEY" + pub);

			String pk = String.valueOf(pub);
			String type = "Malicious Data Attack";
			String strQuery3 = "Select * FROM cloudserver where fname='"
				+ file + "'";

		Statement sta = connection.createStatement();

		ResultSet rsa = sta.executeQuery(strQuery3);
		if (rsa.next()) {
			i = rsa.getInt(1);//id
			s12 = rsa.getString(3);//fname
			s13 = rsa.getString(2);//on
			s14 = rsa.getString(5);//mac
			s15 = rsa.getString(6);//sk
			s16 = rsa.getString(7);//rank
		}*/
			SimpleDateFormat sdfDate = new SimpleDateFormat(
					"dd/MM/yyyy");
			SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");

			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
			
			
				
			String strQuery2 = "update  cloudserver set ct='"+cont+"', trapdoor='" + h1 + "' where fname='" + file + "' ";
			connection.createStatement().executeUpdate(strQuery2);
			
			String strQuery25 = "insert into attacker1(user,fname,type,dt) values('"
					+ on
					+ "','"
					+ file
					+ "','"
					+ type
					+ "','" + dt + "')";
			connection.createStatement().executeUpdate(strQuery25);
%>






<p>
<h1 >Attacked Success Fully!!!</h1>
</p>
<br />

<%
	connection.close();


	} catch (Exception e) {
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>

		  
		  

