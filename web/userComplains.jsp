<%@page import='java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement' %>
<%@page import='java.sql.ResultSet,java.util.ArrayList' %>
<% 
    String button=request.getParameter("btn");
    int RESULT=0;
    if(button!=null && button.equalsIgnoreCase("Delete"))
    {
        String comp_id = request.getParameter("c_id");
        if(comp_id.equals(""))
            { RESULT=1; }
        else{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st = con.prepareStatement("select * from complain_table where complain_id=?");
            st.setString(1,comp_id);
            ResultSet rs=st.executeQuery();
            if(rs.next()){
                PreparedStatement st1= con.prepareStatement("delete from complain_table where complain_id=?");
                st1.setString(1,comp_id);
                st1.executeUpdate();
                response.sendRedirect("userComplains.jsp");
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
        <link href="stylenew.css" rel="stylesheet">
    </head>
    
    <body>
<!--        <table>
    <tr>
        <td align="left"><img src="images/Purple Minimalist Flower Shop Logo-2.png" width="300px" height="300px"></td>
        <td class="titletheme" align="center">ATTIREs HUB</td>
        <td style="text-align: right"><a href="destroysession.jsp" class="link">LOG OUT</a></td>
    </tr>
</table>-->
 <%@include file='publictopAttire.jsp' %>


<%
    String u_id=(String)session.getAttribute("user");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st =  con.prepareStatement("select * from complain_table where user_id=?");
    st.setString(1,u_id);
    ResultSet rs = st.executeQuery();
    ArrayList list1 = new ArrayList(); // for complain_id
    ArrayList list2 = new ArrayList(); // for user who posted
    ArrayList list3 = new ArrayList(); // for complain description
    ArrayList list4 = new ArrayList(); // for remarks
    ArrayList list5 = new ArrayList(); // for status
    ArrayList list6 = new ArrayList(); //for complain date
    ArrayList list7 = new ArrayList(); // for resolve date
    ArrayList list8 = new ArrayList(); // for complain solved by
    while(rs.next()){
    list1.add(rs.getString(1));
    list2.add(rs.getString(2));
    list3.add(rs.getString(3));
    list4.add(rs.getString(4));
    list5.add(rs.getString(5));
    list6.add(rs.getString(6));
    list7.add(rs.getString(7));
    list8.add(rs.getString(8));
    }
    %>

        <div style="width:100%;height: 700px;background-size:100%;background-color: rgba(255,255,255,0.6);">
            <br>
            <br>
            <table align="center" cellspacing="20" class="backtheme2">
                <tr align="center" bgcolor="white" style="font-size: 20px; font-family: Sylfaen">
                    <td colspan="8">COMPLAIN LIST</td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td>COMPLAIN ID</td>
                    <td>USER ID</td>
                    <td>COMPLAIN DESCRIPTION</td>
                    <td>COMPLAIN STATUS</td>
                    <td>REMARKS</td>
                    <td>DATE OF COMPLAIN</td>
                    <td>DATE OF RESOLVE</td>
                    <td>RESOLVED BY</td>
                    
                </tr>
                <% 
                    for(int i=0;i<list1.size();i++){
                %>
                <tr align="center">
                    <td><%=list1.get(i)%></td>
                    <td><%=list2.get(i)%></td>
                    <td><%=list3.get(i)%></td>
                    <td><%=list5.get(i)%></td>
                    <td><%=list4.get(i)%></td>
                    <td><%=list6.get(i)%></td>
                    <td><%=list7.get(i)%></td>
                    <td><%=list8.get(i)%></td>
                </tr>
                <%}%>
            </table>
            <br>
            <br>
            <form action="" method="post">
            <table cellspacing="20" align="center">
                <% if(button!=null && RESULT==1){ %>
                <tr><td><font color="red"><b>INVALID COMPLAIN ID!!TRY AGAIN</b></td></tr>
                <%}%>   
                <tr align="center" colspan="2">
                    <td style="font-size: 20px">ENTER COMPLAIN ID TO BE DELETED</td>
                    <br>
                    <td><input type="text" name="c_id" placeholder="Enter complain id..." class="texttheme"></td>
                </tr>
                <tr><td colspan="2" align="center"><input type="submit" name="btn" value="Delete" class="buttons" style="width: 150px;font-size: 15px"></td></tr>
            </table>
            </form>
        </div>
    </body>    
</html>