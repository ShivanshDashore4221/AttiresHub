<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager,java.sql.ResultSet"%>
<% 
    
    String button=request.getParameter("btn");
    int RESULT=0;
    if(button!=null && button.equalsIgnoreCase("Apply changes"))
    {      
    String id=request.getParameter("u_id");
    String oldPassword=request.getParameter("u_opass");
    String newPassword=request.getParameter("u_upass");
    String cnewPassword=request.getParameter("u_cnpass");
    if(oldPassword.equals("")||newPassword.equals("")||cnewPassword.equals("")){
    RESULT=1;} 
    else{
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from user_table where user_id=? and user_password=?");
            st.setString(1, id);
            st.setString(2, oldPassword);
            ResultSet rs= st.executeQuery();
            if(rs.next()){
                if(newPassword.equals(cnewPassword)){
                    PreparedStatement st1=con.prepareStatement("update user_table set user_password=? where user_id=?");
                    st1.setString(1, newPassword);
                    st1.setString(2, id);
                    st1.executeUpdate();
                    response.sendRedirect("signinPageAttire.jsp");
                }
                else{
                    RESULT=2;
                 }
            }
            else{
                RESULT=1;
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
    
    <body>
        <%@include file='publictopAttire.jsp' %>

        <div style="width:100%;height:100%;background-size:100%;background-color: rgba(255,255,255,0.6);">
            <form action="" method="post"> 
                <table align="center" cellspacing="20" style="box-shadow: 0px 0px 60px white">
                    <tr style="font-size: 20px;font-family: Sylfaen">
                        <td colspan="2">PASSWORD SETTING FORM</td>
                    </tr>
                    <% if(button!=null && RESULT==1){ %>
                    <tr><td><font color="red"><b>INVALID PASSWORD!! TRY AGAIN.</b> </td></tr>
                    <%}%>
                    <% if(button!=null && RESULT==2){ %>
                    <tr><td><font color="red"><b>CONFIRM NEW PASSWORD DOES NOT MATCH WITH NEW PASSWORD!!</b> </td></tr>
                    <%}%>
                    <% String nm = (String)session.getAttribute("user");%>
                    <tr>
                        <td>ID</td>
                    </tr>
                    <tr>
                        <td><input type="text" value="<%=nm%>" name='u_id' class="texttheme" readonly="true" ></td>
                    </tr>
                    
                    <tr>
                        <td>OLD PASSWORD</td>
                    </tr>
                    <tr>
                        <td><input type="password" name="u_opass" class="texttheme" placeholder="Enter old password..." ></td>
                    </tr>
                    
                    <tr>
                        <td>NEW PASSWORD</td>
                    </tr>
                    <tr>
                        <td><input type="password" name="u_upass" class="texttheme" placeholder="Enter new password..." ></td>
                    </tr>
                    
                    <tr>
                        <td>CONFIRM NEW PASSWORD</td>
                    </tr>
                    <tr>
                        <td><input type="password" name="u_cnpass" class="texttheme" placeholder="Confirm new password..." ></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btn" value="Apply changes" ></td>
                    </tr>
                    
                </table>
            </form> 
        </div>
    </body>    
</html>