<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,com.dao.VegetableDAO,com.model.Vegetable"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Vegetables</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&display=swap"
	rel="stylesheet">

<style>
* {
	box-sizing: border-box;
}

body {
	font-family: 'Nunito', sans-serif;
	background-color: #f1f5f9;
}

/* ── Page wrapper ── */
.page-wrapper {
	max-width: 960px;
	margin: 2rem auto;
	padding: 0 1rem;
}

/* ── Page title ── */
.page-title {
	font-size: 1.6rem;
	font-weight: 800;
	text-align: center;
	margin-bottom: 1.5rem;
	color: #1e293b;
	letter-spacing: -0.02em;
}

/* ── Card shell around the table ── */
.table-card {
	background: #ffffff;
	border: 2px solid #cbd5e1; /* outer card border */
	border-radius: 14px;
	overflow: hidden;
	box-shadow: 0 4px 18px rgba(0, 0, 0, 0.07);
}

/* ── Table ── */
.veg-table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 0;
	margin: 0;
	font-size: 0.93rem;
}

/* Header */
.veg-table thead tr th {
	background-color: #1e293b;
	color: #f8fafc;
	font-weight: 700;
	padding: 0.85rem 1rem;
	text-align: center;
	font-size: 0.82rem;
	letter-spacing: 0.07em;
	text-transform: uppercase;
	border-bottom: 2px solid #334155;
}

/* Column separators in header */
.veg-table thead tr th+th {
	border-left: 1px solid #334155;
}

/* Body rows */
.veg-table tbody tr {
	border-bottom: 1px solid #e2e8f0;
	transition: background 0.15s;
}

.veg-table tbody tr:last-child {
	border-bottom: none;
}

.veg-table tbody tr:hover {
	background-color: #f0fdf4;
}

/* Body cells */
.veg-table tbody td {
	padding: 1rem 1.1rem;
	text-align: center;
	color: #334155;
	font-weight: 600;
	font-size: 0.96rem;
	border-right: 1px solid #e2e8f0;
	vertical-align: middle;
}

.veg-table tbody td:last-child {
	border-right: none;
}

/* ID cell */
.veg-table tbody td:first-child {
	color: #94a3b8;
	font-weight: 700;
	font-size: 0.88rem;
	width: 70px;
}

/* Name cell */
.veg-table tbody td:nth-child(2) {
	text-align: left;
	font-weight: 700;
	font-size: 1rem;
	color: #1e293b;
}

/* Price cell — right-aligned */
.veg-table tbody td:nth-child(3) {
	text-align: right;
	font-weight: 700;
	color: #1e293b;
	padding-right: 2rem;
}

.veg-table tbody td:nth-child(3)::before {
	content: '₹ ';
	color: #64748b;
	font-size: 0.82rem;
	font-weight: 600;
}

/* ── Buttons ── */
.btn-update {
	border: 2px solid #f59e0b;
	background: transparent;
	color: #b45309;
	font-weight: 700;
	font-size: 0.78rem;
	padding: 0.35rem 0.85rem;
	border-radius: 7px;
	transition: background 0.15s, color 0.15s;
	white-space: nowrap;
}

.btn-update:hover {
	background: #fef3c7;
	color: #92400e;
}

.btn-delete {
	border: 2px solid #ef4444;
	background: transparent;
	color: #dc2626;
	font-weight: 700;
	font-size: 0.78rem;
	padding: 0.35rem 0.85rem;
	border-radius: 7px;
	transition: background 0.15s, color 0.15s;
	white-space: nowrap;
}

.btn-delete:hover {
	background: #fee2e2;
	color: #991b1b;
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

.btn-store:hover {
	background: #dcfce7;
	color: #14532d;
}

/* ── Mobile card layout ── */
@media ( max-width : 600px) {
	.veg-table, .veg-table thead, .veg-table tbody, .veg-table th,
		.veg-table td, .veg-table tr {
		display: block;
	}
	.veg-table thead {
		display: none; /* hide header on mobile */
	}
	.veg-table tbody tr {
		border: 1.5px solid #cbd5e1;
		border-left: 4px solid #16a34a; /* green accent bar on left */
		border-radius: 12px;
		margin-bottom: 1rem;
		background: #fff;
		box-shadow: 0 3px 10px rgba(0, 0, 0, 0.07);
		padding: 0.5rem 0.9rem;
		overflow: hidden;
	}
	.veg-table tbody td {
		border-right: none;
		border-bottom: 1px solid #f1f5f9;
		padding: 0.65rem 0.3rem;
		text-align: right;
		display: flex;
		justify-content: space-between;
		align-items: center;
		font-size: 1rem; /* bigger text on mobile */
	}
	.veg-table tbody td:last-child {
		border-bottom: none;
	}

	/* Data labels */
	.veg-table tbody td::before {
		content: attr(data-label);
		font-size: 0.7rem;
		font-weight: 800;
		text-transform: uppercase;
		letter-spacing: 0.09em;
		color: #94a3b8;
		flex-shrink: 0;
		margin-right: 0.5rem;
		text-align: left;
	}

	/* Name row — larger */
	.veg-table tbody td:nth-child(2) {
		font-size: 1.08rem;
		font-weight: 800;
		color: #1e293b;
		text-align: right;
	}

	/* Price col on mobile — override desktop pseudo */
	.veg-table tbody td:nth-child(3) {
		text-align: right;
		padding-right: 0.3rem;
	}
	.veg-table tbody td:nth-child(3)::before {
		content: attr(data-label);
		font-size: 0.7rem;
		font-weight: 800;
		text-transform: uppercase;
		letter-spacing: 0.09em;
		color: #94a3b8;
	}

	/* Action cells — merge both into one row */
	.action-cell {
		display: none !important; /* hide individual action cells */
	}

	/* Combined action row rendered via JS */
	.mobile-action-row {
		display: flex !important;
		justify-content: flex-end;
		gap: 0.6rem;
		padding: 0.65rem 0.3rem 0.4rem;
		border-top: 1px solid #f1f5f9;
		margin-top: 0.15rem;
	}

	/* Bigger tap targets on mobile */
	.mobile-action-row .btn-update, .mobile-action-row .btn-delete {
		padding: 0.5rem 1.1rem;
		font-size: 0.85rem;
		border-radius: 8px;
	}
	.table-card {
		border: none;
		background: transparent;
		box-shadow: none;
		border-radius: 0;
	}
}

/* ── Modal borders ── */
.modal-content {
	border: 2px solid #cbd5e1;
	border-radius: 14px;
	overflow: hidden;
	box-shadow: 0 12px 40px rgba(0, 0, 0, 0.15);
}

.modal-header.bg-warning {
	border-bottom: 2px solid #f59e0b;
}

.modal-footer {
	border-top: 1px solid #e2e8f0;
}

.form-control {
	border: 1.5px solid #cbd5e1;
	border-radius: 8px;
	font-family: 'Nunito', sans-serif;
	font-weight: 600;
}

.form-control:focus {
	border-color: #94a3b8;
	box-shadow: 0 0 0 3px rgba(148, 163, 184, 0.2);
}

.form-label {
	font-weight: 700;
	font-size: 0.82rem;
	text-transform: uppercase;
	letter-spacing: 0.06em;
	color: #475569;
}
</style>

</head>

<body>

	<div class="page-wrapper">

		<h3 class="page-title">🥦 Manage Vegetables</h3>

		<%
		VegetableDAO dao = new VegetableDAO();
		List<Vegetable> list = dao.getAllVegetables();
		%>

		<div class="table-card">
			<div class="table-responsive">
				<table class="veg-table">

					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Price</th>
							<th>Update</th>
							<th>Delete</th>
						</tr>
					</thead>

					<tbody>
						<%
						for (Vegetable v : list) {
						%>
						<tr>

							<td data-label="ID"><%=v.getId()%></td>
							<td data-label="Name"><%=v.getName()%></td>
							<td data-label="Price (₹)"><%=v.getPrice()%></td>

							<!-- UPDATE -->
							<td data-label="Update" class="action-cell">
								<button class="btn-update" data-bs-toggle="modal"
									data-bs-target="#updateModal<%=v.getId()%>">✏️ Update
								</button>
							</td>

							<!-- DELETE -->
							<td data-label="Delete" class="action-cell">
								<form action="deleteVegetable" method="post" style="margin: 0;">
									<input type="hidden" name="id" value="<%=v.getId()%>">
									<button type="submit" class="btn-delete"
										onclick="return confirm('Are you sure to delete?')">
										🗑️ Delete</button>
								</form>
							</td>

						</tr>

						<!-- UPDATE MODAL -->
						<div class="modal fade" id="updateModal<%=v.getId()%>"
							tabindex="-1">
							<div class="modal-dialog modal-dialog-centered">
								<div class="modal-content">

									<div class="modal-header bg-warning">
										<h5 class="modal-title fw-bold">✏️ Edit Vegetable</h5>
										<button type="button" class="btn-close"
											data-bs-dismiss="modal"></button>
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
												<label class="form-label">Price (₹)</label> <input
													type="text" name="price" class="form-control"
													value="<%=v.getPrice()%>" required>
											</div>

										</div>

										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Cancel</button>
											<button type="submit" class="btn btn-success fw-bold">Update</button>
										</div>
									</form>

								</div>
							</div>
						</div>
						<!-- END MODAL -->

						<%
						}
						%>
					</tbody>

				</table>
			</div>
		</div>

		<!-- Back to store -->
		<div class="text-center mt-4">
			<a href="home" class="btn-store">🛒 View Store Page</a>
		</div>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
		function applyMobileLayout() {
			if (window.innerWidth > 600)
				return;

			document
					.querySelectorAll('.veg-table tbody tr')
					.forEach(
							function(row) {
								// Skip modal divs that got block-displayed
								if (row.classList.contains('modal'))
									return;

								// ── Side-by-side action buttons ──
								var updateCell = row
										.querySelector('td.action-cell:nth-of-type(4)');
								var deleteCell = row
										.querySelector('td.action-cell:nth-of-type(5)');

								if (updateCell
										&& deleteCell
										&& !row
												.querySelector('.mobile-action-row')) {
									var actionRow = document
											.createElement('div');
									actionRow.className = 'mobile-action-row';

									var updateBtn = updateCell
											.querySelector('button');
									var deleteForm = deleteCell
											.querySelector('form');

									if (updateBtn)
										actionRow.appendChild(updateBtn
												.cloneNode(true));
									if (deleteForm)
										actionRow.appendChild(deleteForm
												.cloneNode(true));

									// Wire cloned update button modal trigger
									var clonedUpdate = actionRow
											.querySelector('button[data-bs-target]');
									if (clonedUpdate) {
										clonedUpdate
												.addEventListener(
														'click',
														function() {
															var target = this
																	.getAttribute('data-bs-target');
															var modal = new bootstrap.Modal(
																	document
																			.querySelector(target));
															modal.show();
														});
									}

									row.appendChild(actionRow);
								}

								// ── Add ₹ prefix to price value ──
								var priceTd = row
										.querySelector('td:nth-child(3)');
								if (priceTd && !priceTd.dataset.rupeeAdded) {
									priceTd.dataset.rupeeAdded = '1';
									var span = document.createElement('span');
									span.style.cssText = 'font-weight:800;color:#1e293b;';
									span.textContent = '₹ '
											+ priceTd.textContent.trim();
									priceTd.textContent = '';
									priceTd.appendChild(span);
								}
							});
		}

		document.addEventListener('DOMContentLoaded', applyMobileLayout);
		window.addEventListener('resize', applyMobileLayout);
	</script>
</body>
</html>
