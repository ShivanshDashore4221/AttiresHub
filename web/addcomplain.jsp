<%@include file="securityguard.jsp" %>
<%@page import="java.util.Date,java.text.DateFormat,java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager"%>
<%
    
            String button = request.getParameter("btn");
            int RESULT=0;
            if(button!=null && button.equalsIgnoreCase("ADD COMPLAIN"))
            {
            Date date=new Date();
            DateFormat df = DateFormat.getDateInstance(DateFormat.SHORT);
            String datelogic = df.format(date);
//            String complain_id = request.getParameter("comp_id");
            String complain_user = request.getParameter("comp_user_id");
            String complain_description = request.getParameter("comp_desc");
           
            if(complain_user.equals("")||complain_description.equals(""))
            { RESULT=1;}
            else{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("insert into complain_table"
                    + "(user_id,complain_description,complain_status,complain_date) values(?,?,?,?)");
//            st.setString(1, complain_id);
            st.setString(1, complain_user);
            st.setString(2, complain_description);
            st.setString(3, "PENDING");
            st.setString(4, datelogic);
            st.executeUpdate();
            con.close();
            response.sendRedirect("addcomplain.jsp");
            }
            }
            %>
<html>
    <!-- Attire Hub-->
    <head>
        <link href ="stylenew.css" rel="stylesheet">
    </head>
    
    <body>
       <%@include file='publictopAttire.jsp' %>

        <div style="width:100%;height: 100%;background-size:100%;background-color: rgba(255,255,255,0.6);">
            <h3 style="text-align: right"><a href="home.jsp" class="link">LOG OUT</a></h3>
            <form action="" method="post">
            <table align="center" cellspacing="40" class="backtheme1">
            <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">ADD COMPLAIN</td>
            </tr>
            <% if(button!=null && RESULT==1){ %>
            <tr align="center"><td colspan="2"><font color="red"><b>ALL FIELDS ARE MANDATORY!!</b></font> </td></tr>
            <%}%>
<!--            <tr>
                <td>COMPLAIN ID</td>
                <td><input type="text" name="comp_id" placeholder="Enter complain id..."></td>
            </tr>-->
            <tr>
                <td>USER ID</td>
                <td><input type="text" value="<%=session.getAttribute("user")%>" name="comp_user_id" placeholder="Enter your id..."></td>
            </tr>
            <tr>
                <td>COMPLAIN DESCRIPTION</td>
                <td><textarea  name="comp_desc" placeholder="Enter complain..." style="height: 120px"></textarea></td>
            </tr>
                   
            <tr align="center">
                <td><input type="submit" name='btn' value="Add Complain" class="buttons"></td>
                <td><input type="reset" value="Clear" class="buttons"></td>
            </tr>
        </table>
        </form>  
        </div>
    </body>    
</html>