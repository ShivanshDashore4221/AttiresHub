<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager"%>
<%
            String button = request.getParameter("btn");
            int RESULT=0;
            if(button!=null && button.equalsIgnoreCase("Submit Feedback"))
            {
//            String feed_id = request.getParameter("feed_id");
            String feedback_desc = request.getParameter("feed_desc");
            String contact = request.getParameter("contact");
            if(feedback_desc.equals("")||contact.equals(""))
            { RESULT=1; }
            else{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("insert into feedback_table(feedback_description,contact) values(?,?)");
//            st.setString(1, feed_id);
            st.setString(1, feedback_desc);
            st.setString(2, contact);
            st.executeUpdate();
            con.close();
            response.sendRedirect("feedback.jsp");
            }   
            }   
            %>
<html>
    <!-- Attire Hub-->
    <head>
        <link href ="stylenew.css" rel="stylesheet">
    </head>
    
    <body>
        <div style="margin-top:30px;margin-left:20px;width:95%;height:700px;background-color: rgba(255,255,255,0.8);">
            
            
        <%@include file='topAttire.jsp'%>

        <form action="" method="post">
                <table width="70%"  style="margin-top:50px;margin-left:100px">
                    <tr>
                        <td><img src="images/Purple Minimalist Flower Shop Logo-2.png" style="box-shadow: 0px 0px 50px pink"></td>
                    </tr>
                </table>
            <table align="right" cellspacing="40" class="backtheme2" style="margin-top: -500px;width:32%">
            <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">FEEDBACK</td>
            </tr>
            <% if(button!=null && RESULT==1){ %>
            <tr><td colspan="2"><font color="red"><b>PLEASE COMPLETE ALL THE FIELDS!!</b></font> </td></tr>
            <% } %>
<!--            <tr>
                <td>FEEDBACK ID</td>
                <td><input type="text" name="feed_id" placeholder="Enter id..."></td>
            </tr>-->
            <tr>
                <td>FEEDBACK</td>
                <td><textarea name="feed_desc" placeholder="Write here..." class="textareatheme"></textarea></td>
            </tr>
            <tr>
                <td>CONTACT</td>
                <td><input type="number" name="contact" placeholder="Enter your Contact no..." class="texttheme"></td>
            </tr>
            <tr align="center">
                <td colspan="2"><input type="submit" name="btn" value="Submit Feedback" class="buttons"></td>
            </tr>
        </table>
        </form>  
        </div>
    </body>  
</html>