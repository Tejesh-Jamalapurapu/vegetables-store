<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.Vegetable"%>
<!DOCTYPE html>
<html>
<head>
<title>JGR Vegetable Store</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
* {
	box-sizing: border-box;
}

body {
	background-color: #f0f7f0;
	margin: 0;
	padding: 0;
	display: flex;
	flex-direction: column;
	min-height: 100vh;
	font-family: 'Segoe UI', sans-serif;
}

main {
	flex: 1;
	padding-top: 62px; /* offset for fixed header */
}

/* ── Header ── */
.store-header {
	background: linear-gradient(135deg, #2e7d32, #43a047);
	padding: 12px 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 1000;
}

.store-header h2 {
	font-size: 1.3rem;
	font-weight: 700;
	color: white;
	letter-spacing: 0.5px;
}

.admin-btn {
	background: #fff3cd;
	color: #664d03;
	border-radius: 20px;
	padding: 5px 10px;
	transition: all 0.25s ease;
}

.admin-btn:hover {
	background: #ffe69c;
	color: #4d3900;
	transform: scale(1.05);
	box-shadow: 0 3px 8px rgba(0, 0, 0, 0.2);
}

/* ── Cards ── */
.card-grid {
	padding: 14px 10px;
}

.veg-card {
	border: 2px solid #c8e6c9 !important;
	border-radius: 14px !important;
	box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
	background: #ffffff;
	padding: 12px 8px;
	transition: 0.2s;
	width: 100%;
}

.veg-card:hover {
	transform: translateY(-4px);
	box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
	border-color: #66bb6a !important;
}

.veg-card img {
	height: 90px;
	object-fit: contain;
	margin: 6px auto;
	display: block;
}

.card-title {
	font-size: 0.9rem;
	font-weight: 600;
	margin-bottom: 4px;
	text-transform: capitalize;
}

.price-tag {
	font-size: 0.82rem;
	font-weight: 700;
	color: #2e7d32;
	background: #e8f5e9;
	border-radius: 20px;
	padding: 3px 10px;
	display: inline-block;
	margin-top: 6px;
}

/* ── Footer ── */
.site-footer {
	background: linear-gradient(135deg, #1b5e20, #2e7d32);
	color: #e8f5e9;
	padding: 28px 16px 18px;
	margin-top: 24px;
	border-top: 3px solid #66bb6a;
}

.footer-inner {
	max-width: 900px;
	margin: 0 auto;
}

/* Three-column grid */
.footer-grid {
	display: grid;
	grid-template-columns: 1fr 1fr 1fr;
	gap: 1.2rem;
	margin-bottom: 18px;
}

/* Store name column */
.footer-brand .brand-name {
	font-size: 1.05rem;
	font-weight: 700;
	color: #ffffff;
	margin-bottom: 4px;
}

.footer-brand p {
	font-size: 0.78rem;
	color: #a5d6a7;
	margin: 0;
	line-height: 1.5;
}

/* Developer column */
.footer-dev .footer-col-title {
	font-size: 0.68rem;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.1em;
	color: #81c784;
	margin-bottom: 6px;
}

.footer-dev .dev-name {
	font-size: 0.92rem;
	font-weight: 700;
	color: #ffffff;
}

.footer-dev .dev-role {
	font-size: 0.75rem;
	color: #a5d6a7;
	margin: 0;
}

/* Contact column */
.footer-contact .footer-col-title {
	font-size: 0.68rem;
	font-weight: 700;
	text-transform: uppercase;
	letter-spacing: 0.1em;
	color: #81c784;
	margin-bottom: 6px;
}

.contact-item {
	display: flex;
	align-items: center;
	gap: 7px;
	font-size: 0.8rem;
	color: #c8e6c9;
	margin-bottom: 5px;
}

.contact-item .icon {
	font-size: 0.9rem;
	flex-shrink: 0;
}

.contact-item a {
	color: #c8e6c9;
	text-decoration: none;
	transition: color 0.2s;
}

.contact-item a:hover {
	color: #ffffff;
}

/* Divider */
.footer-divider {
	border: none;
	border-top: 1px solid rgba(255, 255, 255, 0.15);
	margin: 0 0 12px;
}

/* Copyright bar */
.footer-copy {
	text-align: center;
	font-size: 0.72rem;
	color: #81c784;
	letter-spacing: 0.03em;
}

.footer-copy span {
	color: #ffffff;
	font-weight: 600;
}

/* ── Mobile footer ── */
@media ( max-width : 576px) {
	.footer-grid {
		grid-template-columns: 1fr;
		gap: 1rem;
		text-align: center;
	}
	.contact-item {
		justify-content: center;
	}
	.footer-brand .brand-name {
		font-size: 1rem;
	}
}
</style>
</head>

<body>

	<!-- ── Header ── -->
	<div class="store-header">
		<div class="container d-flex align-items-center">
			<div style="width: 40px;"></div>
			<div class="flex-grow-1 text-center">
				<h2 class="m-0">🥦 JGR  Vegetable Store</h2>
			</div>
			<div>
				<a href="admin-login.jsp" class="btn btn-sm fw-semibold admin-btn">🔒</a>
			</div>
		</div>
	</div>

	<!-- ── Main content ── -->
	<main>
		<div class="container-fluid card-grid">
			<div class="row g-3">

				<%
				List<Vegetable> list = (List<Vegetable>) request.getAttribute("vegList");
				if (list != null) {
					for (Vegetable v : list) {
				%>

				<div class="col-6 col-md-4 col-lg-3">
					<div class="card veg-card text-center">
						<h5 class="card-title"><%=v.getName()%></h5>
						<img src="ImageLoaderServlet?name=<%=v.getImage()%>"
							class="img-fluid" alt="<%=v.getName()%>">
						<div>
							<span class="price-tag">₹<%=v.getPrice()%> / kg
							</span>
						</div>
					</div>
				</div>

				<%
				}
				}
				%>

			</div>
		</div>
	</main>
	

	<!-- ── Footer ── -->
	<footer class="site-footer">
		<div class="footer-inner">

			<div class="footer-grid">

				<!-- Store Brand -->
				<div class="footer-brand">
					<div class="brand-name">🥦 JGR Vegetable Store</div>
					<p>Fresh vegetables delivered to your doorstep. Quality you can
						trust, prices you'll love.</p>
				</div>

				<!-- Developer -->
				<div class="footer-dev">
					<div class="footer-col-title">Developed By</div>
					<div class="dev-name">👨‍💻 Tejesh Jamalapurapu</div>
					<p class="dev-role">Full Stack Developer</p>
				</div>

				<!-- Contact -->
				<div class="footer-contact">
					<div class="footer-col-title">Contact Us</div>

					<div class="contact-item">
						<span class="icon">📞</span> <a href="tel:+917661826779">+91
							7661826779</a>
					</div>

					<div class="contact-item">
						<span class="icon">📧</span> <a
							href="mailto:tejeshjamalapurapu@gmail.com">tejeshjamalapurapu@gmail.com</a>
					</div>

					<div class="contact-item">
						<span class="icon">📍</span> <span>Hyderabad, Telangana</span>
					</div>

				</div>

			</div>

			<hr class="footer-divider">

			<div class="footer-copy">
				&copy; 2025 <span>JGR Vegetable Store</span>. All rights reserved.
				&nbsp;|&nbsp; Developed by <span>Tejesh</span>
			</div>

		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
