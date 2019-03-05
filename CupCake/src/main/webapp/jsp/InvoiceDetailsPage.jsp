<%-- 
    Document   : InvoiceDetailsPage
    Created on : 05-03-2019, 12:44:10
    Author     : Camilla
--%>

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
        <title>JSP Page</title>
    </head>
    <body>
        <p>User name: <span id="UserName"><%= userName%></span></p>
        <p>UserID: <span id="UserID"><%= userID%></span></p>
        <p>Balance: <span id="UserBalance"><%= balance%>$</span></p>
        <p>Invoice Details for invoice: <span id="InvoiceDetails"><%= invoiceID%></span></p>
        
        <%
            for (int i = 0; i < invoiceDetails.size(); i++) {
                out.println("<p>"
                        + "Cake top name: " + invoiceDetails.get(i).getCupcakes().get(i).getTopName()
                        + " price: " + invoiceDetails.get(i).getCupcakes().get(i).getTopPrice()
                        + "<br/>"
                        + "Cake bottom name: " + invoiceDetails.get(i).getCupcakes().get(i).getBottomName()
                        + " price: " + invoiceDetails.get(i).getCupcakes().get(i).getBottomPrice()
                        + "<br/>"
                        + "</p>");
            }
        %>
        
    </body>
</html>
