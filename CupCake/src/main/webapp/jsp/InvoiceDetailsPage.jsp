<%-- 
    Document   : InvoiceDetailsPage
    Created on : 05-03-2019, 12:44:10
    Author     : Camilla
--%>

<jsp:include page='Header.jsp'></jsp:include>
    <h2>Customer Invoices</h2>
<jsp:include page='NavigationBar.jsp'></jsp:include>
<%@page import="Data.Model_InvoiceDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Data.Model_Invoice"%>
<%@page import="Data.Model_User"%>
<%
    Model_User user = (Model_User) request.getAttribute("user");
    Model_Invoice invoice = (Model_Invoice) request.getAttribute("invoice");

    int userID = user.getUserID();
    int invoiceID = invoice.getId_invoice();
    String userName = user.getUserName();
    double balance = user.getBalance();
    ArrayList<Model_InvoiceDetails> invoiceDetails = invoice.getInvoiceDetails();

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Page</title>
    </head>
    <body>
        <div class="padding">
            <h4>Invoice details:</h4>
            <br/>
            <p>User name: <%= userName%></p>
            <p>UserID: <%= userID%></p>
            <p>Balance: <%= balance%> $</p>
            <br/>
            <p>Invoice Details for invoice number: <%= invoiceID%></p>
            <br/>
            <table class="table">
                <tr>
                    <th>
                        Cake Top
                    </th>
                    <th>
                        Cake Top Price
                    </th>
                    <th>
                        Cake bottom
                    </th>
                    <th>
                        Cake bottom Price
                    </th>
                </tr>
                <%
                        for (int i = 0; i < invoiceDetails.size(); i++) {%>
                <tr>
                    <td>
                        <%= invoiceDetails.get(i).getCupcakes().get(i).getTopName()%>
                    </td>
                    <td>
                        <%= invoiceDetails.get(i).getCupcakes().get(i).getTopPrice()%>
                    </td>
                    <td>
                        <%= invoiceDetails.get(i).getCupcakes().get(i).getBottomName()%>
                    </td>
                    <td>
                        <%= invoiceDetails.get(i).getCupcakes().get(i).getBottomPrice()%>
                    </td>
                </tr>
                <% }%>
            </table>
            <p>Total price: <%=invoice.getTotalPrice()%></p>
        </div>
    </body>
</html>

<jsp:include page='Footer.jsp'></jsp:include>