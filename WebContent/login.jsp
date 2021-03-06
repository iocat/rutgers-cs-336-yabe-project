<%@ page import="com.yabe.util.Utils"%>
<%! 
	// Page variable declaration 
	String pagePath;				// Page context path
	boolean failedToLogin = false;	// Failed to login	
%>
<%	
	// Page variable initialization
	pagePath = request.getContextPath();
	failedToLogin = !Utils.isEmpty(request.getParameter("login")) &&
			request.getParameter("login").equals("failed");		
%>
<!DOCTYPE html>
<html>
<head lang="en-US">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link href="<%=pagePath%>/vendors/css/normalize.css" rel="stylesheet"
	type="text/css">
<link href="<%=pagePath%>/vendors/css/grid.css" rel="stylesheet"
	type="text/css">
<link href="<%=pagePath%>/vendors/css/normalize.css" rel="stylesheet"
	type="text/css">
<link href="<%=pagePath%>/resources/css/login.css" rel="stylesheet"
	type="text/css">
<link href="<%=pagePath%>/resources/css/setup.css" rel="stylesheet"
	type="text/css">

<link
	href='https://fonts.googleapis.com/css?family=Lato:400,700,300,100'
	rel='stylesheet' type='text/css'>
</head>
<body>
	<header>
		<div class="logo">
			<a href="main-page.jsp">
				<img src="<%=pagePath%>/resources/img/yabe-logo.png">
			</a>
		</div>
	</header>
	<section class="login-section" >
		<div class="row">
			<div class="col span-1-of-4">
				<!--  blank div -->
			</div>
			<div class="col span-3-of-4 container <%if(failedToLogin){ %>alert<%}%>">
				<form method="POST" action="<%=pagePath%>/login">
					<div class="row">
						<h1 class="title">Yabe</h1>
					</div>
					<%if (failedToLogin){%>
					<div class="row">
						<p class="alert"> Your username or Password is incorrect. </p> 
					</div>
					<% } %>
					<div class="row signinfield">
						<div class="col span-1-of-3">
							<label for="username">Username</label>
						</div>
						<div class="col span-2-of-3">
							<input id="username" type="text" name="username"
								placeholder="Happy user" required />
						</div>
					</div>
					<div class="row signinfield">
						<div class="col span-1-of-3">
							<label for="password">Password</label>
						</div>
						<div class="col span-2-of-3">
							<input id="password" type="password" name="password" required />
						</div>
					</div>
					<div class="row signinfield">
						<input type="checkbox" name="keepSignedIn" value="true"
							id="keepSignedIn" checked> <label for="keepSignedIn">Keep
							me signed in.</label>
					</div>
					<% if(request.getParameter("item")!=null){ %>
						<input type="hidden" name="item" value="<%=request.getParameter("item")%>">
					<% } %>
					<input class="btn-important" type="submit" value="Sign In">
					<a href="<%=pagePath%>/new-account.jsp" class="register-link">
						Create a new Account ?</a>
				</form>
			</div>
		</div>
	</section>
	<footer>
		<p>Copyright &copy; 2016 YABE. All Rights Reserved.</p>
	</footer>
	
	
</body>
</html>