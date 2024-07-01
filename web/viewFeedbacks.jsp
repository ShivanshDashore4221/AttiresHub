<html>
    <!-- Attire Hub-->
    <head>
        <link href="styleAttire.css" rel="stylesheet">
    </head>
    
    <body>
        <table>
    <tr>
        <td align="left"><img src="images/Purple Minimalist Flower Shop Logo-2.png" width="300px" height="300px"></td>
        <td class="titletheme" align="center">ATTIREs HUB</td>
        <td style="text-align: right"><a href="destroysession.jsp" class="link">LOG OUT</a></td>
    </tr>
</table>
<!--        <table width="100%" class="tabtheme">
            <tr align="center">
                <td class="tdtheme"><a href="home.jsp" class="link">home</a></td>
                <td class="tdtheme"><a href="about.jsp" class="link">Settings</a></td>
                <td class="tdtheme"><a href="categories.jsp" class="link">Employee</a></td>
                <td class="tdtheme"><a href="services.jsp" class="link">Products</a></td>
                <td class="tdtheme"><a href="feedback.jsp" class="link">Complains</a></td>
                <td class="tdtheme"><a href="contactUs.jsp" class="link">Feedbacks</a></td>
                
            </tr>
            
        </table>--> 

<%@page import='java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement' %>
<%@page import='java.sql.ResultSet,java.util.ArrayList' %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st =  con.prepareStatement("select * from feedback_table");
    ResultSet rs = st.executeQuery();
    ArrayList list1 = new ArrayList(); // feedback id
    ArrayList list2 = new ArrayList(); // feedback description
    ArrayList list3 = new ArrayList(); // contact
    while(rs.next()){
    list1.add(rs.getString(1));
    list2.add(rs.getString(2));
    list3.add(rs.getString(3));
    }
    %>

        <div style="width:100%;height: 700px;background-image: url(images/peachgradient.jpg);background-repeat: no-repeat;
             background-size:100%;background-color: rgba(255,255,255,0.6);">
            
            <table align="center" cellspacing="20" class="backtheme">
                <tr align="center" style="font-size: 20px; font-family: Sylfaen">
                    <td colspan="3">FEEDBACK LIST</td>
                </tr>
                <tr>
                    <td colspan="5">&nbsp;</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td>FEEDBACK ID</td>
                    <td>FEEDBACK DESCRIPTION</td>
                    <td>CONTACT</td>
                </tr>
                <% 
                    for(int i=0;i<list1.size();i++){
                %>
                <tr align="center">
                    <td><%=list1.get(i)%></td>
                    <td><%=list2.get(i)%></td>
                    <td><%=list3.get(i)%></td>
                </tr>
                <%}%>
            </table>
            <table align="center">
                <tr>
                    <td></td>
                </tr>
            </table>
        </div>
    </body>    
</html>