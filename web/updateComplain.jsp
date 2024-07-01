<%@include file="securityguard.jsp" %>
<%@page import='java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement' %>
<%@page import='java.sql.ResultSet,java.util.ArrayList' %>
<%
    String button= request.getParameter("btn");
    int RESULT=0;
    if(button!=null && button.equalsIgnoreCase("Update")){
    String comp_id = request.getParameter("c_id");
    String comp_remarks = request.getParameter("c_remarks");
    String comp_status = request.getParameter("c_stat");
    String comp_resolvedate = request.getParameter("c_rdate");
    String comp_resolvedby = request.getParameter("c_resolved_by");
    if(comp_id.equals("")||comp_remarks.equals("")||comp_status.equals("")||comp_resolvedate.equals("")||comp_resolvedby.equals("")){
    RESULT=1;
    }
    else{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st =  con.prepareStatement("select * from complain_table where complain_id=?");
    st.setString(1, comp_id);
    ResultSet rs = st.executeQuery();
    if(rs.next()){
    PreparedStatement st1 = con.prepareStatement("update complain_table set remarks=?,complain_status=?,resolve_date=?,complain_solved_by=? where complain_id=?");
    st1.setString(1, comp_remarks);
    st1.setString(2, comp_status);
    st1.setString(3, comp_resolvedate);
    st1.setString(4, comp_resolvedby);
    st1.setString(5, comp_id);
    st1.executeUpdate();
    response.sendRedirect("updateComplain.jsp");
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


        <div style="width:100%;height: 700px;background-image: url(images/ahimg1.jpg);background-repeat: no-repeat;
             background-size:100%;background-color: rgba(255,255,255,0.6);">
            <form action="" method="post">
            <table align="center" cellspacing="20" class="backtheme">
                <tr align="center" bgcolor="white" style="font-size: 20px; font-family: Sylfaen">
                    <td colspan="2">UPDATE COMPLAIN </td>
                </tr>
                <tr>
                    <td colspan="2">&nbsp;</td>
                </tr>
                <% if(button!=null && RESULT==1){ %>
                <tr><td colspan="2"><font color="red"><b>ALL THE DETAILS ARE MANDATORY!</b></td></tr>
                <% } %>
                <% if(button!=null && RESULT==2){ %>
                <tr><td colspan="2"><font color="red"><b>COMPLAIN NOT FOUND!</b></td></tr>
                <% } %>
                <tr>
                    <td>ENTER COMPLAIN ID</td>
                    <td><input type="text" name="c_id" placeholder="Enter id..."></td>
                </tr>
                <tr>
                    <td>ENTER REMARKS</td>
                    <td><textarea name="c_remarks" placeholder="Enter remarks..."></textarea></td>
                </tr>
                <tr>
                    <td>ENTER UPDATED STATUS</td>
                    <td><input type="text" name="c_stat"></td>
                </tr>
                <tr>
                    <td>ENTER RESOLVE DATE</td>
                    <td><input type="date" name="c_rdate"></td>
                </tr>
                <tr>
                    <td>ENTER TECHNICIAN NAME</td>
                    <td><input type="text" name="c_resolved_by"></td>
                </tr>
                <tr>
                    <td><input type="submit" name="btn" value="Update"></td>
                </tr>    
            </table>
            </form>
        </div>
    </body>    
</html>