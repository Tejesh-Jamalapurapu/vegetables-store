<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.dao.VegetableDAO,com.model.Vegetable"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Vegetables</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body class="bg-light">

	<div class="container mt-4">

		<h3 class="mb-4 fw-bold text-center">Manage Vegetables</h3>

		<%
		VegetableDAO dao = new VegetableDAO();
		List<Vegetable> list = dao.getAllVegetables();
		%>

		<div class="table-responsive">

			<table class="table table-bordered table-hover text-center">

				<thead class="table-dark">
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Price</th>
						<th colspan="2">Action</th>
					</tr>
				</thead>

				<tbody>

					<%
					for (Vegetable v : list) {
					%>

					<tr>

						<td><%=v.getId()%></td>
						<td><%=v.getName()%></td>
						<td><%=v.getPrice()%></td>

						<!-- UPDATE BUTTON -->
						<td>

							<button class="btn btn-warning btn-sm" data-bs-toggle="modal"
								data-bs-target="#updateModal<%=v.getId()%>">Update</button>

						</td>

						<!-- DELETE BUTTON -->
						<td>

							<form action="deleteVegetable" method="post">

								<input type="hidden" name="id" value="<%=v.getId()%>">

								<button class="btn btn-danger btn-sm"
									onclick="return confirm('Are you sure to delete?')">

									Delete</button>

							</form>

						</td>

					</tr>


					<!-- UPDATE MODAL POPUP -->

					<div class="modal fade" id="updateModal<%=v.getId()%>"
						tabindex="-1">

						<div class="modal-dialog">

							<div class="modal-content">

								<div class="modal-header bg-warning">

									<h5 class="modal-title">Edit Vegetable</h5>

									<button type="button" class="btn-close" data-bs-dismiss="modal"></button>

								</div>


								<form action="updateVegetable" method="post">

									<div class="modal-body">

										<input type="hidden" name="id" value="<%=v.getId()%>">


										<div class="mb-3">

											<label class="form-label">Vegetable Name</label> <input
												type="text" name="name" class="form-control"
												value="<%=v.getName()%>" required>

										</div>


										<div class="mb-3">

											<label class="form-label">Price</label> <input type="text"
												name="price" class="form-control" value="<%=v.getPrice()%>"
												required>

										</div>

									</div>


									<div class="modal-footer">

										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancel</button>

										<button type="submit" class="btn btn-success">Update

										</button>

									</div>

								</form>

							</div>

						</div>

					</div>


					<%
					}
					%>

				</tbody>

			</table>


		</div>
		<div class="text-center mt-4">
			<a href="home" class="btn btn-success"> 🛒 View Store
				Page </a>
		</div>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>