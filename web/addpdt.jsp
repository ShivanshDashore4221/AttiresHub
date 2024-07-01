<%@include file="securityguard.jsp" %>
<%@page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.DriverManager"%>
<%
            String button = request.getParameter("btn");
            int RESULT=0;
            if(button!=null && button.equalsIgnoreCase("ADD"))
            {
//            String pdt_id = request.getParameter("pdt_id");
            String pdt_name = request.getParameter("pdt_name");
            String pdt_description = request.getParameter("pdt_desc");
            int pdt_discount = Integer.parseInt(request.getParameter("pdt_disc"));
            int pdt_rate = Integer.parseInt(request.getParameter("pdt_rate"));
           
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","root");
            PreparedStatement st=con.prepareStatement("insert into product_table(product_name,product_description,"
            + "product_discounts,product_rate) values(?,?,?,?)");
//            st.setString(1, pdt_id);
            st.setString(1, pdt_name);
            st.setString(2, pdt_description);
            st.setInt(3, pdt_discount);
            st.setInt(4, pdt_rate);
            st.executeUpdate();
            con.close();
            response.sendRedirect("addpdt.jsp");
            }
            %>
<html>
    <!-- Attire Hub-->
    <head>
        <link href ="styleAttire.css" rel="stylesheet">
    </head>
    
    <body>
      

        <div style="width:100%;height: 700px;background-image: url(images/attire_gif.gif);background-repeat: no-repeat;
             background-size:100%;background-color: rgba(255,255,255,0.6);">
            <form action="" method="post">
            <table align="center" cellspacing="20" class="backtheme">
            <tr align="center" bgcolor= white style="font-size: 20px;font-family: Sylfaen">
                <td colspan="2">ADD PRODUCT</td>
            </tr>
<!--            <tr>
                <td>PRODUCT ID</td>
                <td><input type="text" name="pdt_id" placeholder="Enter pdt id..."></td>
            </tr>-->
            <tr>
                <td>PRODUCT NAME</td>
                <td><input type="text" name="pdt_name" placeholder="Enter pdt name..."></td>
            </tr>
            <tr>
                <td>PRODUCT DESCRIPTION</td>
                <td><textarea  name="pdt_desc" placeholder="Enter pdt description..."></textarea></td>
            </tr>
            <tr>
                <td>PRODUCT DISCOUNT</td>
                <td><input type="number" name="pdt_disc" placeholder="Enter discounts..."></td>
            </tr>         
            <tr>
                <td>PRODUCT RATE</td>
                <td><input type="number" name="pdt_rate" placeholder="Enter pdt rate..."></td>
            </tr>
            <tr>
                <td><input type="submit" name="btn" value="ADD"></td>
                <td><input type="reset" value="CLEAR"></td>
            </tr>
        </table>
        </form>  
        </div>
    </body>    
</html>