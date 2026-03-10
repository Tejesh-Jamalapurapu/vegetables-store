<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	font-family: 'Segoe UI', sans-serif;
	background: linear-gradient(135deg, #a8edea, #fed6e3);
}

/* Login Card */
.login-card {
	width: 380px;
	background: white;
	border-radius: 20px;
	padding: 40px 30px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
	animation: fadeUp .6s ease;
}

.btn-store {
	border: 2px solid #16a34a;
	background: transparent;
	color: #15803d;
	font-weight: 700;
	padding: 0.55rem 1.6rem;
	border-radius: 9px;
	font-size: 0.9rem;
	text-decoration: none;
	display: inline-block;
	transition: background 0.15s, color 0.15s;
}

@
keyframes fadeUp {from { opacity:0;
	transform: translateY(30px);
}

to {
	opacity: 1;
	transform: translateY(0);
}

}

/* Title */
.login-title {
	font-weight: 700;
	text-align: center;
	margin-bottom: 10px;
}

.login-sub {
	text-align: center;
	color: #777;
	font-size: 14px;
	margin-bottom: 30px;
}

/* Input */
.form-control {
	border-radius: 10px;
	padding: 12px;
}

.form-control:focus {
	box-shadow: 0 0 0 2px rgba(0, 123, 255, 0.2);
}

/* Button */
.btn-login {
	width: 100%;
	border-radius: 10px;
	padding: 12px;
	font-weight: 600;
	background: #4facfe;
	border: none;
	color: white;
	transition: .3s;
}

.btn-login:hover {
	background: #00c6ff;
}

/* icon */
.login-icon {
	width: 70px;
	height: 70px;
	background: #eef4ff;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 30px;
	margin: auto;
	margin-bottom: 15px;
}

.footer {
	text-align: center;
	font-size: 15px;
	margin-top: 25px;
	font-weight: 600;
	background: linear-gradient(90deg, #28a745, #6f42c1, #0dcaf0, #ffc107, #ff4d6d);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	letter-spacing: 1px;
}
</style>
</head>

<body>

	<div class="login-card">

		<div class="login-icon">🔐</div>

		<h3 class="login-title">Admin Login</h3>
		<p class="login-sub">Enter your credentials to continue</p>

		<form action="adminLogin" method="post">

			<div class="mb-3">
				<input type="text" name="username" class="form-control"
					placeholder="Username" required>
			</div>

			<div class="mb-3">
				<input type="password" name="password" class="form-control"
					placeholder="Password" required>
			</div>

			<button type="submit" class="btn-login">Login</button>

		</form>
		<div class="footer">Fresh vegetables • Healthy life 🌿</div>
		<!-- Back to store -->
		<div class="text-center mt-4">
			<a href="home" class="btn-store">🛒 View Store Page</a>
		</div>
	</div>


</body>
</html>