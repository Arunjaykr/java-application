<%-- 
    Document   : Register
    Created on : 01-Mar-2024, 7:18:50 pm
    Author     : arunjay
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
   <body>
    <div class="container">
        <h1>Register</h1>
        <form action="NewRegisterServlet" method="post">
    
          <label for="name">Full Name</label>
          <input type="text" name="name" id="name" placeholder="Enter your name"><br><br>
        
       
          <label for="email">Email Address:</label>
          <input type="email" name="email" id="email" placeholder="Enter your email"><br><br>
        
          <label for="password">Password:</label>
          <input type="password" name="password" id="password" placeholder="Create a password"><br><br>
          <label for="gender">Gender:</label>
            <input type="radio" name="gender" id="male" value="male">
            <label class="form-check-label" for="male">Male</label>
          
          
            <input  type="radio" name="gender" id="female" value="female">
            <label class="form-check-label" for="female">Female</label><br><br>
          
        
          <label for="country">Country:</label>
          <select name="country" id="country">
            <option value="INDIA">India</option>
            <option value="US">United States</option>
            <option value="UK">United Kingdom</option>
            <option value="CA">Canada</option>
          </select><br><br>
        
        
          <button type="submit" value="Register">Register</button>
      
        </form>
    
        <p><a href="index.html">Back to Home</a></p>
    
        <%-- Display error message if registration fails --%>
        <% String error = request.getParameter("error");
           if (error != null && error.equals("1")) { %>
            <p style="color: red;">Registration failed. Please try again.</p>
        <% } %>
      </div>
      
</body>
 
</html>