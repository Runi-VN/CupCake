<%-- 
    Document   : ShopCheckOut
    Created on : 07-03-2019, 11:20:25
    Author     : Shevitar
--%>


<%@page import="Data.Cart"%>
<%@page import="Data.Model_User"%>
<jsp:include page='Header.jsp'></jsp:include>
    <h2>Checkout</h2>
<jsp:include page='NavigationBar.jsp'></jsp:include>
<%
    boolean buyPermission = (boolean)request.getSession().getAttribute("buyPermission");
    System.out.println("Do we have the ####ing permission or what? : " + buyPermission);
    String msg = "";
    if (buyPermission)
    {
        msg = "Cupcakes have succesfully been ordered";
    }
    else
    {
        msg = "Not enough credits in account";
    }
    Cart cart = (Cart) request.getSession().getAttribute("cart");
    if (cart.getCakes().isEmpty())
    {
        msg = "Your cart is empty - no order placed";
    }
%>
    
<div>
    <h3>Checkout</h3>
        
    <p><%=msg%></p>
    </br>
    </br>
    <form action="app/customer" method="get" target="">
        <button type="submit">Return to customer page</button>
    </form> 
</div>

<jsp:include page='Footer.jsp'></jsp:include>