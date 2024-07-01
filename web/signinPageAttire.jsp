<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager,java.sql.ResultSet"%>
<% 

    String button=request.getParameter("btn");
    int RESULT =0;
    if(button!=null && button.equalsIgnoreCase("sign in")){
    
           
            String user_id = request.getParameter("u_id");
            String user_password = request.getParameter("u_pass");
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from user_table where user_id=? and user_password=?");
            st.setString(1, user_id);
            st.setString(2, user_password);
            ResultSet rs= st.executeQuery();
            if(rs.next()){
            Cookie ck=new Cookie("attire", user_id);
            ck.setMaxAge(10000);
            response.addCookie(ck);
            
            session.setAttribute("user",user_id);
            response.sendRedirect("publicpage.jsp");
            }
            else{
            RESULT=1;
            }
            con.close();
            
    }
            %>
<html>
    <!-- Attire Hub-->
    <head>

        <link href ="stylenew.css" rel="stylesheet">
        <title>LOG IN</title>
    </head>
    
    <body>
        
        <div style="margin-top:30px;margin-left:20px;width:95%;height:700px;background-color: rgba(255,255,255,0.8);">
            
            
        <%@include file='topAttire.jsp'%>
        <form action="" method="post">
            <table align="center" cellspacing="20" class="backtheme1" width="40%">
            <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">USER LOG IN</td>
            </tr>
            <% if(button!=null && RESULT==1){
               
            %>
            <tr><td align="center"><font color="#FF4500"><b>INVALID ID/PASSWORD</b></font></td></tr>
            <% } %>
            <tr>
                <td>ID</td>
            </tr>
            <tr>    
                <td><input type="text" name="u_id" placeholder="Enter id..." style="border-radius: 20px; height: 30px ;width: 100%"></td>
            </tr>
            <tr>
                <td>Password</td>
            </tr>
            <tr>
                <td><input type="password" name="u_pass" placeholder="Enter password..." style="border-radius: 20px; height: 30px ;width: 100%"></td>
            </tr>
               
            <tr align="center">
                <td colspan="2"><input type="submit" name="btn" value="Sign in" class='buttons' style="width: 80px;font-size: 16px"> </td>
            </tr>
        </table>
        </form>  
        </div>
    </body>    
</html>