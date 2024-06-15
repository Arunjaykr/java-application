<%-- 
    Document   : Login
    Created on : 01-Mar-2024, 7:19:27 pm
    Author     : arunjay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
       
    <div class="container">
        <h1>Login</h1>
        <form action="NewLoginServlet" method="post"> <!-- Change method to "post" -->
            <label for="email">Email id:</label>
            <input type="email" id="email" name="email" required><br><br>  
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required><br><br>  
            <button type="submit" value="login">Login</button>
        </form><br>
        <p>Click the "Register" button to register yourself.</p>
        <button onclick="window.location.href='register.jsp'">Register</button>
        

        <p><a href="index.html">Back to Home</a></p>

        <%-- Display error message if login fails --%>
        <% String error = request.getParameter("error");
            if (error != null && error.equals("1")) { %>
                <p style="color: red;">Invalid username or password. Please try again.</p>
        <% } %>
        
        <%-- Display error message if Register Successful --%>
        <% String rs = request.getParameter("registration");
            if (rs != null && rs.equals("success")) { %>
                <p style="color: green;">Your Registration is Successful. Please Login.</p>
        <% } %>
    </div>

    </body>
</html>