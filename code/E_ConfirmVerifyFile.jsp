
		 <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>Encryptor Main</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Myriad_Pro_300.font.js" type="text/javascript"></script>
<!--[if lt IE 7]>
<script type="text/javascript" src="js/ie_png.js"></script>
<script type="text/javascript">ie_png.fix('.png, #header .row-2 ul li a, #content, .list li');</script>
<![endif]-->
<style type="text/css">
<!--
.style1 {
	font-size: 37px;
	color: #CCCCCC;
}
.style26 {
	font-size: 18px;
	font-style: italic;
	color: #FF0000;
}
-->
</style>
</head>
<body id="page1">
<div class="tail-top">
  <div class="tail-bottom">
    <div class="body-bg">
      <!-- HEADER -->
      <div id="header">
        <div class="extra"></div>
        <div class="row-1">
          <div class="fleft">
            <h2 class="style1">Verifiable Searchable Encryption Framework against Insider Keyword Guessing Attack in Cloud Storage</h2>
          </div>
          <div class="fright"></div>
        </div>
        <div class="row-2">
          <ul>
            <li class="m2"><a href="E_Main.jsp">Data Owner </a></li>
            <li class="m3"><a href="E_Login.jsp">logout</a></li>
          </ul>
        </div>
        <div class="row-3">
          <form action="#" method="post" id="search-form">
            <fieldset>
              <div><a href="#"></a></div>
            </fieldset>
          </form>
        </div>
      </div>
      <!-- CONTENT -->
      <div id="content">
        <div class="inner_copy">More <a href="#">Website Templates</a> @ Templates.com!</div>
        <div class="tail-right">
          <div class="wrapper">
            <div class="col-1">
              <div class="indent">
                <div class="indent1">
                  <h3>Confirm Verify Files !!!</h3>
                  <p>&nbsp;</p> 



		  <%
	 	
	 	String csmac=null, ownermac=null,ocon=null,csname=null;
		
			
				String omac="";

	 	try {
		
		SimpleDateFormat sdfDate = new SimpleDateFormat("dd/MM/yyyy");
		SimpleDateFormat sdfTime = new SimpleDateFormat("HH:mm:ss");
		
			Date now = new Date();

			String strDate = sdfDate.format(now);
			String strTime = sdfTime.format(now);
			String dt = strDate + "   " + strTime;
		
		
			
	 		String file = request.getParameter("fname");
	
	 		Statement st = connection.createStatement();

	 		String on=(String)application.getAttribute("ename");


	 		String strQuery2 = "select * from cloudserver where fname='"+file+"' and downer='"+on+"' ";
	 	

	 		ResultSet rs = st.executeQuery(strQuery2);
	 		if (rs.next()) {
	 			
	 			csmac = rs.getString("trapdoor");//mac
				
	 			}
				
				
				else if (rs.next()!=true) {
								%>
<p>
<h2><%=file %>  is Not Found in the Cloud Server !!!</h2>
</p>
<%				
					 		}
        
					String strQuery3 = "Select * FROM tpadata where fname='"+file+"' and downer='"+on+"' ";

							ResultSet rss = st.executeQuery(strQuery3);
							if (rss.next()) {
								
								ownermac = rss.getString("trapdoor");//mac
								
								}

							
					
							if(csmac.equals(ownermac) )
							{
							
					String type="Safe";
					String strQuery4 = "insert into auditresults(fname,ownername,audittype,dt) values('"+ file+"','"+on+"','"+type+"','"+dt+ "')";
					connection.createStatement().executeUpdate(strQuery4);
							
							%>
<p>
<h1><%=file%>  is Secured !!!</h1>
</p>

<%
							}	
							else {
							
					String type="Not Safe";
					String strQuery4 = "insert into auditresults(fname,ownername,audittype,dt) values('"+file+"','"+on+"','"+type+"','"+dt+ "')";
					connection.createStatement().executeUpdate(strQuery4);																					
								%>
<p>
<h2><%=file %>  is Attacked by Attacker !!! </h2>  <br />
<Br>

</p>
<%				
					 		}						
		  	connection.close();

		  	}catch (Exception e) {
		  		out.println(e.getMessage());
		  		e.printStackTrace();
		  	} %>
        

 <p align="justify">&nbsp;</p>
                  <p align="right"><a href="E_Main.jsp">Back</a></p>
                </div>
                <h4>&nbsp;</h4>
              </div>
            </div>
            <div class="col-2">
			<ul>
				<li><a href="E_Main.jsp">Home</a></li>
				<li><a href="E_Login.jsp">Logout</a></li>
			  </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- FOOTER -->
      <div id="footer">
        <div class="indent">
          <div class="fleft"></div>
          <div class="fright"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"> Cufon.now(); </script>
<div align=center></div>
</body>
</html>

        

         
		  
		