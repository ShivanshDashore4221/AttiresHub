<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager"%>
<%           
            String button = request.getParameter("btn");
            int RESULT= 0;
            if(button!=null && button.equalsIgnoreCase("Submit Feedback"))
            {
//            String feed_id = request.getParameter("feed_id");
            String feedback_desc = request.getParameter("feed_desc");
            String contact = request.getParameter("contact");
            if(feedback_desc.equals("")||contact.equals(""))
            { RESULT=1;}
            else{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("insert into feedback_table(feedback_description,contact) values(?,?)");
//            st.setString(1, feed_id);
            st.setString(1, feedback_desc);
            st.setString(2, contact);
            st.executeUpdate();
            con.close();
            response.sendRedirect("userfeedback.jsp");
            }
            }
            %>
<html>
    <!-- Attire Hub-->
    <head>
        <link href ="style1.css" rel="stylesheet">
    </head>
    
    <body>
        <%@include file="publictopAttire.jsp" %>

        <div style="width:100%;height: 700px;background-color: rgba(255,255,255,0.6);box-shadow: 0px 0px 50px goldenrod">
            <form action="" method="post">
            <table align="center" cellspacing="40" class="backtheme2" style="box-shadow: 0px 0px 20px black">
            <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">FEEDBACK</td>
            </tr>
            <% if(button!=null && RESULT==1){ %>
            <tr><td><font color="red"><b>PLEASE COMPLETE ALL THE FIELDS!!</b></font> </td></tr>
            <% } %>
            <tr>
<!--                <td>FEEDBACK ID</td>
                <td><input type="text" name="feed_id" class="texttheme" placeholder="Enter id..." ></td>
            </tr>-->
            <tr>
                <td>FEEDBACK</td>
                <td><textarea name="feed_desc" class="textareatheme" placeholder="Write here..."></textarea></td>
            </tr>
            <tr>
                <td>CONTACT</td>
                <td><input type="number" name="contact" class="texttheme" placeholder="Enter your Contact no..."></td>
            </tr>
            <tr>
                <td><input type="submit" name="btn" value="Submit Feedback"></td>
            </tr>
        </table>
        </form>  
        </div>
    </body>  
</html>