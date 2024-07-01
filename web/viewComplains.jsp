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
<!--<table width="20%" align="left" class="tabtheme" style="box-shadow:0px 0px 50px white,0px 0px 50px white;height:100%;">
    <tr>
        <td class="tdtheme"><a href="adminpage.jsp" class="link">Home</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="settings.jsp" class="link">Settings</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="adminemployee.jsp" class="link">Employee</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="products.jsp" class="link">Products</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="complains.jsp" class="link">Complains</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="adminfeedbacks.jsp" class="link">Feedbacks</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="shipments.jsp" class="link">View Shipments</a></td>
    </tr>

</table>-->
<%@page import='java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement' %>
<%@page import='java.sql.ResultSet,java.util.ArrayList' %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st =  con.prepareStatement("select * from complain_table");
    ResultSet rs = st.executeQuery();
    ArrayList list1 = new ArrayList(); // for complain_id
    ArrayList list2 = new ArrayList(); // for user who posted
    ArrayList list3 = new ArrayList(); // for complain description
    ArrayList list4 = new ArrayList(); // date of complain
    ArrayList list5 = new ArrayList(); 
    ArrayList list6 = new ArrayList(); 
    ArrayList list7 = new ArrayList(); 
    ArrayList list8 = new ArrayList(); 
    while(rs.next()){
    list1.add(rs.getString(1));
    list2.add(rs.getString(2));
    list3.add(rs.getString(3));
    list4.add(rs.getString(4));
    list5.add(rs.getString(5));
    list6.add(rs.getString(6));
    list7.add(rs.getString(7));
    list8.add(rs.getString(8));
    }
    %>

        <div style="width:100%;height: 700px;background-image: url(images/peachgradient.jpg);background-repeat: no-repeat;
             background-size:100%;background-color: rgba(255,255,255,0.6);">
            
            <table align="center" cellspacing="20" class="backtheme">
                <tr align="center" bgcolor="white" style="font-size: 20px; font-family: Sylfaen">
                    <td colspan="8">COMPLAIN LIST</td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td>COMPLAIN ID</td>
                    <td>USER ID</td>
                    <td>COMPLAIN DESCRIPTION</td>
                    <td>REMARKS</td>
                    <td>COMPLAIN STATUS</td>
                    <td>DATE OF COMPLAIN</td>
                    <td>DATE OF RESOLVE</td>
                    <td>RESOLVED BY</td>
                    
                </tr>
                <% 
                    for(int i=0;i<list1.size();i++){
                %>
                <tr align="center">
                    <td><%=list1.get(i)%></td>
                    <td><%=list2.get(i)%></td>
                    <td><%=list3.get(i)%></td>
                    <td><%=list4.get(i)%></td>
                    <td><%=list5.get(i)%></td>
                    <td><%=list6.get(i)%></td>
                    <td><%=list7.get(i)%></td>
                    <td><%=list8.get(i)%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>    
</html>