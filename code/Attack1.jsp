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
  String prcst="",attcksttus="",prc="";
  String fn, ct, on, mac = "";
  	try {
  		String file = request.getParameter("t1");
  		String oname = request.getParameter("ot");
  		String cattack = request.getParameter("attack");
  		
  		application.setAttribute("aname",cattack);
  		
  			%>
<style type="text/css">
<!--
.style3 {color: #FFFF00; font-weight: bold; }
-->
</style>
<h1>Add Malicious Content to File</h1>
<%
  			
  		
  		String sk = "";
  		String strQuery = "select * from cloudserver where fname='"
  				+ file + "'";
  		ResultSet rs = connection.createStatement().executeQuery(
  				strQuery);
  		{
  			if (rs.next() == true) {
  				fn = rs.getString(2);
  				ct = rs.getString(3);

  				SimpleDateFormat sdfDate = new SimpleDateFormat(
  						"dd/MM/yyyy");
  				SimpleDateFormat sdfTime = new SimpleDateFormat(
  						"HH:mm:ss");

  				Date now = new Date();

  				String strDate = sdfDate.format(now);
  				String strTime = sdfTime.format(now);
  				String dt = strDate + "   " + strTime;
  				String task = "Download";
  %>

<form action="Attack2.jsp" method="get" name="form1" id="form1">
<table width="478" border="0" align="center">
	<tr>
		<td width="223" bgcolor="#FF0000"><span class="style3">Enter File Name :-</span></td>
		<td width="245"><label> <input required name="t1"
			type="text" value="<%=file%>" size="40" /> </label></td>
	</tr>

	<tr>
		<td height="34" bgcolor="#FF0000"><span class="style3">Ur Name :-</span></td>
		<td><input name="t12" type="text" value="<%=oname%>" size="40" /></td>
	</tr>
	<tr>
		<td bgcolor="#FF0000"><span class="style3">File Content :-</span></td>
		<td><textarea name="text" id="textarea" cols="45" rows="17"><%=ct%></textarea></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td>
		<div align="right"></div>		</td>
		<td><label> <input type="submit" name="Submit2"
			value="Attack" /> </label></td>
	</tr>
</table>
</form>

<%
									} 
  		
  		else {
  			out.println("File Doesn't Exist !!!");
								%> <%
								}
									}

									connection.close();
  		
  							  			
  	}					catch(Exception e) {
									out.println(e.getMessage());
								}
							%>

