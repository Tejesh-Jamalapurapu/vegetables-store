<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.Vegetable"%>
<!DOCTYPE html>
<html>
<head>
<title>Rao's Vegetable Store</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f0f7f0;
	margin: 0;
	padding: 0;
}

/* Header */
.store-header {
	background: linear-gradient(135deg, #2e7d32, #43a047);
	padding: 12px 10px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.15);
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
/* Cards */
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
</style>
</head>

<body>

	<div class="store-header">
		<div class="container d-flex align-items-center">

			<!-- Left Space -->
			<div style="width: 40px;"></div>

			<!-- Store Title -->
			<div class="flex-grow-1 text-center">
				<h2 class="m-0">🥦 JGR Vegetable Store</h2>
			</div>

			<!-- Admin Button -->
			<div>
				<a href="admin-login.jsp" class="btn btn-sm fw-semibold admin-btn">
					🔒 </a>
			</div>

		</div>
	</div>


	<!-- Vegetable Cards -->

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
						<span class="price-tag"> ₹<%=v.getPrice()%> / kg
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

</body>
</html>