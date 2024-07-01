<% 
    response.addHeader("Pragma", "no-Cache");
    response.addHeader("Cache-Control", "no-Store");
//    String value=(String)session.getAttribute("AUTH");
//    if(value==null){
//    response.sendRedirect("home.jsp");
//    }
    if(session==null){
    response.sendRedirect("home.jsp");
    }
%>