<%-- 
    Document   : CustomerPage
    Created on : 05-03-2019, 10:09:48
    Author     : Camilla
--%>

<jsp:include page='Header.jsp'></jsp:include>
    <h2>Customer Page</h2>
<jsp:include page='NavigationBar.jsp'></jsp:include>
<%@page import="java.util.ArrayList"%>
<%@page import="Data.Model_Invoice"%>
<%@page import="Data.Model_User"%>
<%
    Model_User user = (Model_User) request.getAttribute("user");

    int userID = user.getUserID();
    String userName = user.getUserName();
    String userEmail = user.getEmail();
    double balance = user.getBalance();
    ArrayList<Model_Invoice> userInvoices = user.getInvoices();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Page</title>
    </head>
    <body>
        <div class="row antimargin">
            <div class="col-md-6 padding">
                <h4>Customer details:</h4>
                <br/>
                <p>Logged in as: <%= userName%></p>
                <p>UserID: <%= userID%></p>
                <p>E-mail: <%= userEmail%></p>
                <p>Balance: <%= balance%> $</p>
            </div>
            <div class="col-md-6 padding">
                <h4>Invoices:</h4>
                <br/>
                <table class="table">
                    <tr>
                        <th>
                            Invoice ID
                        </th>
                        <th>
                            Total price
                        </th>
                        <th>
                            See details
                        </th>
                    </tr>
                    <%
                        for (int i = 0; i < userInvoices.size(); i++) {%>
                    <tr>
                        <td>
                            <%= userInvoices.get(i).getId_invoice()%>
                        </td>
                        <td>
                            <%= userInvoices.get(i).getTotalPrice()%>
                        </td>
                        <td>
                            <a href="app/customerinvoice?invoiceid=<%=userInvoices.get(i).getId_invoice()%>"> Order details</a>
                        </td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
        <jsp:include page='Footer.jsp'></jsp:include>