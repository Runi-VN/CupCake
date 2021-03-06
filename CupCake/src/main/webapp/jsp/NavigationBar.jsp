
<%@page import="Data.Model_CupCake"%>
<%@page import="Data.Cart"%>
<%@page import="Data.Model_User"%>
<%
    Model_User user = (Model_User) session.getAttribute("user");
    String username = "NULL";
    int cartsize = 0;
    double cartPrice = 0;
    String errorMsg = "";
    if (user != null)
    {
        username = user.getUserName().toUpperCase();
    }

    if (session.getAttribute("cart") != null)
    {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cartsize = cart.getCakes().size();
        for (Model_CupCake c : cart.getCakes())
        {
            cartPrice += c.getTotalPrice();
        }
    }
    /*if (session.getAttribute("finalPrice") != null)
    {
        cartPrice = (double) request.getSession().getAttribute("finalPrice");
    }*/

    if (request.getAttribute("error") != null)
    {
        errorMsg = (String) request.getAttribute("error");

        /*finally
        {
            request.removeAttribute("error");
        }*/
    }
%>

<div id="NavBar">

    <div id="leftBar">
        <nav id="home">
            <a href=".">Home</a>
        </nav>

        <nav id ="shop">
            <a href="app/shop">Shop</a>
        </nav>

    </div>

    <div id ="rightBar">

        <nav id="cart">
            <a href="app/cart"><img src="images/shoppingcart.png" height="20" width="20" alt="Shopping cart image"/>Shopping Cart: <%=cartsize%> item(s) � �<%=cartPrice%></a>
        </nav>

        <nav id="user">

            <%            if (user == null)
                {
            %>
            <a href="jsp/Login.jsp">Login/Register</a>
            <%
            }
            else
            {
            %>
            <a href="app/customer">Logged in as: <%= username%></a>
        </nav>
        <%            if (user.getRole() == Model_User.Role.admin)
            {%>
        <nav id="adminpanel">
            <a href="app/admin" style="color: red">Admin Panel</a>
        </nav>
        <%
            } %>
        <nav id="logout">
            <form id = "logoutform" action="app/logout" method="post">
                <button class ="button" id="logoutbutton" type="submit"/>Log out</button>
            </form>
        </nav>

        <%
            }
        %>
    </div>
</div>
<%if (errorMsg != null && !errorMsg.isEmpty())
    {%>
<div id="error" class = " col-md-offset-5 col-sm-offset-4 col-xs-offset-3 ">
    <h3 class="errorMessage"><%=errorMsg%></h3>
</div>
<%}%>
