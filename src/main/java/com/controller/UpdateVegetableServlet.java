package com.controller;

import java.io.IOException;

import com.dao.VegetableDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateVegetable")
public class UpdateVegetableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		double price = Double.parseDouble(request.getParameter("price"));

		VegetableDAO dao = new VegetableDAO();
		dao.updateVegetable(id, name, price);
		response.sendRedirect("manageVegetable.jsp");
	}

}
