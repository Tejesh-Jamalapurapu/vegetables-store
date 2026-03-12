<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.model.Vegetable"%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: linear-gradient(135deg, #74ebd5, #ACB6E5);
	min-height: 100vh;
	font-family: 'Segoe UI', sans-serif;
}

.dashboard-card {
	background: white;
	padding: 40px;
	border-radius: 15px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.dashboard-title {
	font-weight: 700;
	margin-bottom: 30px;
}

.btn-custom {
	padding: 12px 25px;
	font-weight: 600;
	border-radius: 8px;
}

.logout-btn {
	position: absolute;
	top: 20px;
	right: 20px;
}

.modal-content {
	border-radius: 12px;
}

@media ( max-width :768px) {
	.dashboard-card {
		padding: 25px;
	}
	.btn-custom {
		width: 100%;
		margin-bottom: 15px;
	}
}
</style>

</head>

<body>

	<!-- Logout Button -->
	<div class="logout-btn">
		<a href="logout" class="btn btn-danger">Logout</a>
	</div>

	<div
		class="container d-flex justify-content-center align-items-center vh-100">

		<div class="dashboard-card text-center col-lg-6 col-md-8 col-12">

			<h2 class="dashboard-title">🥕 Vegetable Management</h2>

			<div class="d-flex flex-md-row flex-column justify-content-center">

				<!-- Add Vegetable Button -->
				<button class="btn btn-success btn-custom me-md-3"
					data-bs-toggle="modal" data-bs-target="#addVegetableModal">

					➕ Add Vegetable</button>

				<!-- Update/Delete Button -->
				<a href="admin-manageVegetable.jsp"
					class="btn btn-primary btn-custom"> ✏ Update / Delete </a>

			</div>

		</div>

	</div>


	<!-- Add Vegetable Modal -->

	<div class="modal fade" id="addVegetableModal">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h5 class="modal-title">Add Vegetable</h5>
					<button class="btn-close" data-bs-dismiss="modal"></button>
				</div>

				<div class="modal-body">

					<form action="addVegetable" method="post"
						enctype="multipart/form-data">

						<div class="mb-3">
							<input type="text" name="name" class="form-control"
								placeholder="Vegetable Name" required>
						</div>

						<div class="mb-3">
							<input type="number" name="price" min="0" step="0.01" class="form-control"
								placeholder="Price" required>
						</div>

						<div class="mb-3">
							<input type="file" name="image" class="form-control" required>
						</div>

						<button type="submit" class="btn btn-success w-100">Add
							Vegetable</button>

					</form>

				</div>

			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>