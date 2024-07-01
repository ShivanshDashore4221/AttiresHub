<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager"%>
<%
            String button = request.getParameter("btn");
            int RESULT=0;
            if(button!=null && button.equalsIgnoreCase("sign up"))
            {           
            String user_id = request.getParameter("u_id");
            String user_firstname = request.getParameter("u_fname");
            String user_lastname = request.getParameter("u_lname");
            String user_password = request.getParameter("u_pass");
            String user_dob = request.getParameter("u_dob");
            String user_mailid = request.getParameter("u_mailid");
            String user_address = request.getParameter("u_address");
            String user_contact = request.getParameter("u_contact");
            
            if(user_id.equals("")||user_firstname.equals("")||user_lastname.equals("")||user_password.equals("")
            ||user_dob.equals("")||user_mailid.equals("")||user_address.equals("")||user_contact.equals(""))
            {  RESULT = 1; }
            else{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("insert into user_table values(?,?,?,?,?,?,?,?)");
            st.setString(1, user_id);
            st.setString(2, user_firstname);
            st.setString(3, user_lastname);
            st.setString(4, user_password);
            st.setString(5, user_dob);
            st.setString(6, user_mailid);
            st.setString(7, user_address);
            st.setString(8, user_contact);
            st.executeUpdate();
            con.close();
            response.sendRedirect("home.jsp");
           }
           }
            %>
<html>
    <!-- Attire Hub-->
    <head>

        <link href ="stylenew.css" rel="stylesheet">
        <title>Attires Hub</title>
    </head>
    <script>
        function check(){
            if(user_signup.u_id.value==0 || user_signup.u_fname.value==0||user_signup.u_lname.value==0 ||user_signup.u_pass.value==0 ||user_signup.u_dob.value==0 ||user_signup.u_mailid.value==0 ||user_signup.u_address.value==0 ||user_signup.u_contact.value==0){
                alert("Please fill all the fields!");
            }
        }
    </script>
    <body>
        
        <div style="margin:30px auto;width:90%;height:750px;background-color: rgba(255,255,255,0.67);">
            
            
        <%@include file='topAttire.jsp'%>

        <form name="user_signup" action="" method="post">
                <table width="70%"  style="margin-top:30px;margin-left:100px">
                    <tr>
                        <td><img src="images/Purple Minimalist Flower Shop Logo-2.png" style="box-shadow: 0px 0px 50px pink"></td>
                    </tr>
                </table>
            
<table width="32%" align="right" cellspacing="20" class="backtheme">
            <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">USER SIGNUP</td>
            </tr>
            <% if(button!=null && RESULT==1){ %>
            <!--<tr align="center"><td colspan="2"><font color="#FF4500"><b>ALL FIELDS ARE MANDATORY!!</b></font> </td></tr>-->
            <%}%>
            <tr>
                <td>ID</td>
                <td><input type="text" name="u_id" placeholder="Enter id..." class="texttheme"></td>
            </tr>
            <tr>
                <td>First name</td>
                <td><input type="text" name="u_fname" placeholder="Enter First name..." class="texttheme"></td>
            </tr>
            <tr>
                <td>Last Name</td>
                <td><input type="text" name="u_lname" placeholder="Enter Last name..." class="texttheme"></td>
            </tr>
            <tr>
                <td>Password</td>
                <td><input type="password" name="u_pass" placeholder="Enter password..." class="texttheme"></td>
            </tr>
            <tr>
                <td>Date Of Birth</td>
                <td><input type="date" name="u_dob" placeholder="select DOB"class="texttheme"></td>
            </tr>
            <tr>
                <td>Email-id</td>
                <td><input type="email" name="u_mailid" placeholder="Enter email id..." class="texttheme"></td>
            </tr>
            <tr>
                <td>Address</td>
                <td><textarea name="u_address" placeholder="Enter Address..." class="textareatheme"></textarea></td>
            </tr>
            <tr>
                <td>Contact</td>
                <td><input type="number" name="u_contact" placeholder="Enter Contact no..." class="texttheme"></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" name="btn" value="Sign Up" class="buttons" onClick="check()">ALREADY A USER? <a href="signinPageAttire.jsp" class="link1">Log In</a>
                <input type="reset" value="Clear" class="buttons"></td>
            </tr>
        </table>
        </form>  
        </div>
    </body>    
</html>