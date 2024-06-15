<%-- 
    Document   : welcome
    Created on : 01-Mar-2024, 7:38:07 pm
    Author     : arunjay
--%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
          <%
        // Retrieve the session object
        HttpSession session1 = request.getSession(false);

        // Check if the session is not null and the email attribute is set
        if (session1 != null && session1.getAttribute("email") != null) {
            // Get the email from the session
            String email = (String) session1.getAttribute("email");
    %>
    
        <div class="container">
            <h1>Welcome , <%= email %>  Welcome To Ravinder Tech Pvt. ltd </h1>
        <h2>You are successfully registered 🚀</h2>
        <h3>Thank you for giving me a few moments of your time.</h3> 
        you can <button onclick="window.location.href='login.jsp'">Logout</button>
 securely.
    </div>
        <%
        } else {
            // Redirect to the login page if the session is not valid
            response.sendRedirect("login.jsp");
        }
    %>
    </body>
</html>