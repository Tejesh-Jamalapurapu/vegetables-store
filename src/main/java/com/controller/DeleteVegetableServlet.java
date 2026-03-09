package com.controller;

import java.io.IOException;

import com.dao.VegetableDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteVegetable")
public class DeleteVegetableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		VegetableDAO vd=new VegetableDAO();
		vd.deleteVegetable(id);
		response.sendRedirect("manageVegetable.jsp");
	}

}
