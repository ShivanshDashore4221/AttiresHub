<%@include file="securityguard.jsp" %>
<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager,java.sql.ResultSet"%>
<%
    String button=request.getParameter("btn");
    int RESULT=0;
    if(button!=null && button.equalsIgnoreCase("Delete Feedback"))
    {
    String feed_id=request.getParameter("feed_id");
    if(feed_id.equals("")){
    RESULT=1;
    }
    else{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st = con.prepareStatement("select * from feedback_table where feedback_id=?");
    st.setString(1,feed_id);
    ResultSet rs=st.executeQuery();
    if(rs.next()){
        PreparedStatement st1= con.prepareStatement("delete from feedback_table where feedback_id=?");
        st1.setString(1,feed_id);
        st1.executeUpdate();
        response.sendRedirect("deleteFeedbacks.jsp");
    }
    else{
        RESULT=2;
    }
    con.close();
    }
    }
%>
<html>
    <!-- Attire Hub-->
    <head>
        <link href ="style1.css" rel="stylesheet">
    </head>
   
        <table>
    <tr>
        <td align="left"><img src="images/Purple Minimalist Flower Shop Logo-2.png" width="300px" height="300px"></td>
        <td class="titletheme" align="center">ATTIREs HUB</td>
        <td><h3 style="text-align: right"><a href="destroysession.jsp" class="link">LOG OUT</a></h3></td>
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
<table width="20%" align="left" class="tabtheme" style="box-shadow:0px 0px 50px white,0px 0px 50px white;height:100%;">
    <tr>
        <td class="tdtheme"><a href="complainoppage.jsp" class="link">Home</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="settings.jsp" class="link">Settings</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="viewComplains.jsp" class="link">View Complains</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="updateComplains.jsp" class="link">Update Complains</a></td>
    </tr>
    <tr><td>&nbsp;</td></tr>
    <tr>
        <td class="tdtheme"><a href="deleteComplains.jsp" class="link">Delete Complain</a></td>
    </tr>

</table>

        <div style="width:100%;height: 700px;background-size:100%;background-color: rgba(255,255,255,0.6);">
            <form action="" method="post">
            <table align="center" cellspacing="40" class="backtheme1">
                <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">DELETE FEEDBACK</td>
            </tr>
            <% if(button!=null && RESULT==1){ %>
            <tr><td><font color="red"><b>FIELD NOT FILLED CORRECTLY!!</b></td></tr>
            <%}%>
            <% if(button!=null && RESULT==2){ %>
            <tr><td><font color="red"><b>NO SUCH COMPLAIN RECORD FOUND!!</b></td></tr>
            <%}%>
            <tr>
                <td>COMPLAIN ID</td>
                <td><input type="text" name="comp_id" placeholder="Enter complain id here..." class="texttheme"></td>
            </tr>
            <tr>
                <td><input type="submit" name="btn" value="Delete Complain"></td>
            </tr> 
            </table>
            </form>    
        </div>
   
</html>