<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager,java.sql.ResultSet"%>
<% Class.forName("com.mysql.jdbc.Driver");
        
            String button = request.getParameter("btn");
            int RESULT=0;
            if(button!=null && button.equalsIgnoreCase("sign in"))
            {
            String id = request.getParameter("id");
            String password = request.getParameter("pass");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("select * from auth_table where id=? and password=?");
            st.setString(1, id);
            st.setString(2, password);
            ResultSet rs= st.executeQuery();
            if(rs.next())
            {
                String post=rs.getString(3);
                if(post.equalsIgnoreCase("admin")){
                    session.setAttribute("AUTH", id);
                    response.sendRedirect("adminpage.jsp");
                }
                if(post.equalsIgnoreCase("complain operator")){
                    session.setAttribute("AUTH", id);                
                    response.sendRedirect("complainoppage.jsp");
                }
                if(post.equalsIgnoreCase("product operator")){
                    session.setAttribute("AUTH", id);
                    response.sendRedirect("pdtoppage.jsp");
                }
                if(post.equalsIgnoreCase("shipment operator")){
                    session.setAttribute("AUTH", id);
                    response.sendRedirect("shipoppage.jsp");
                }
            }
            else{
                RESULT=1;
            }
            con.close();
}
            %>
<body style="background-image: url(images/gradient_wallpapers/yellow-hd-mosaic-texture-gs207iar6nxplncn.jpg)">     
            <form action="">
            <table align="center" cellspacing="20" class="backtheme" width="40%">
            <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">LOG IN</td>
            </tr>
            <% if(button!=null && RESULT==1){ %>
            <tr><td><font color="#FF4500"><b>INVALID ID/PASSWORD</b></font></td></tr>
            <%}%>
            <tr>
                <td>ID</td>
            </tr>
            <tr>    
                <td><input type="text" name="id" placeholder="Enter id..." style="border-radius: 20px; height: 30px ;width: 100%"></td>
            </tr>
            <tr>
                <td>Password</td>
            </tr>
            <tr>
                <td><input type="password" name="pass" placeholder="Enter password..." style="border-radius: 20px; height: 30px ;width: 100%"></td>
            </tr>
               
            <tr>
                <td><input type="submit" name="btn" value="sign in"> </td>
            </tr>
        </table>
        </form>  
</body>