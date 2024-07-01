<html>
    <!-- Attire Hub-->
    <head>
        <link href ="style1.css" rel="stylesheet">
    </head>
    
    <body>
<%@page import='java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement' %>
<%@page import='java.sql.ResultSet,java.util.ArrayList' %>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
    PreparedStatement st =  con.prepareStatement("select * from product_table");
    ResultSet rs = st.executeQuery();
    ArrayList list1 = new ArrayList(); // for product_id
    ArrayList list2 = new ArrayList(); // for product name
    ArrayList list3 = new ArrayList(); // for product description
    ArrayList list4 = new ArrayList(); // product discount
    ArrayList list5 = new ArrayList();  // product amount
    while(rs.next()){
    list1.add(rs.getString(1));
    list2.add(rs.getString(2));
    list3.add(rs.getString(3));
    list4.add(rs.getString(4));
    list5.add(rs.getString(5));
    }
    %>
        <%@include file='publictopAttire.jsp' %>
        <div style="width:100%;height: 700px;
             background-size:100%;background-color: rgba(255,255,255,0.6);">
              <br>
        <table align="center" cellspacing="20" class="backtheme2">
                <tr align="center" style="font-size: 20px; font-family: Sylfaen">
                    <td colspan="5">PRODUCT LIST</td>
                </tr>
                <tr>
                    <td colspan="5">&nbsp;</td>
                </tr>
                <tr align="center" bgcolor="white">
                    <td>PRODUCT ID</td>
                    <td>PRODUCT NAME</td>
                    <td>PRODUCT DESCRIPTION</td>
                    <td>PRODUCT DISCOUNTS</td>
                    <td>PRODUCT RATE</td>
                </tr>
                <% 
                    for(int i=0;i<list1.size();i++){
                %>
                <tr align="center">
                    <td><%=list1.get(i)%></td>
                    <td><%=list2.get(i)%></td>
                    <td><%=list3.get(i)%></td>
                    <td><%=list4.get(i)%></td>
                    <td><%=list5.get(i)%></td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>    
</html>