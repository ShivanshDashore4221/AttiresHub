 <%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager,java.sql.ResultSet"%>
<% 
    
    String button=request.getParameter("btn");
    int RESULT=0;
    if(button!= null && button.equalsIgnoreCase("Apply changes"))
    {
    String id=request.getParameter("authID");
    String oldPassword=request.getParameter("opass");
    String newPassword=request.getParameter("upass");
    String cnewPassword=request.getParameter("cnpass");
    if(oldPassword.equals("")||newPassword.equals("")||cnewPassword.equals(""))
    { RESULT=1;}
    else{    
    Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from auth_table where id=? and password=?");
            st.setString(1, id);
            st.setString(2, oldPassword);
            ResultSet rs= st.executeQuery();
            if(rs.next()){
                if(newPassword.equals(cnewPassword)){
                    PreparedStatement st1=con.prepareStatement("update auth_table set password=? where id=?");
                    st1.setString(1, newPassword);
                    st1.setString(2, id);
                    st1.executeUpdate();
                    response.sendRedirect("authority.jsp");
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
        <table>
    <tr>
        <td align="left"><img src="images/Purple Minimalist Flower Shop Logo-2.png" width="300px" height="300px"></td>
        <td class="titletheme" align="center">ATTIREs HUB</td>
        <td style="text-align: right"><a href="home.jsp" class="link">LOG OUT</a></td>
    </tr>
</table>

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

        <div style="width:100%;height: 700px;background-image: url(images/peachgradient.jpg);background-repeat: no-repeat;
             background-size:100%;background-color: rgba(224,25,255,0.6);">
            <form action="" method="post"> 
                <table align="center" cellspacing="20" style="box-shadow: 0px 0px 60px white">
                    <tr style="font-size: 20px;font-family: Sylfaen">
                        <td colspan="2">PASSWORD SETTING FORM</td>
                    </tr>
                    <% if(button!=null && RESULT==1){ %>
                    <tr><td><font color="red"><b>PASSWORD NOT FOUND! TRY AGAIN.</b></font></td></tr>
                    <%}%>
                    <% if(button!=null && RESULT==2){ %>
                    <tr><td><font color="red"><b>CONFIRMED PASSWORD DOES NOT MATCH WITH NEW PASSWORD!</b></font></td></tr>
                    <%}%>
                    
                    <tr>
                        <td>ID</td>
                    </tr>
                    <tr>
                        <td><input type="text" value="<%=session.getAttribute("AUTH") %>" name="authID" class="texttheme" placeholder="Enter Id..." readonly="true" ></td>
                    </tr>
                    
                    <tr>
                        <td>OLD PASSWORD</td>
                    </tr>
                    <tr>
                        <td><input type="password" name="opass" class="texttheme" placeholder="Enter old password..." ></td>
                    </tr>
                    
                    <tr>
                        <td>NEW PASSWORD</td>
                    </tr>
                    <tr>
                        <td><input type="password" name="upass" class="texttheme" placeholder="Enter new password..." ></td>
                    </tr>
                    
                    <tr>
                        <td>CONFIRM NEW PASSWORD</td>
                    </tr>
                    <tr>
                        <td><input type="password" name="cnpass" class="texttheme" placeholder="Confirm new password..." ></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="btn" value="Apply changes" ></td>
                    </tr>
                    
                </table>
            </form> 
        </div>              
    </body>    
</html>