package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.VegetableDAO;
import com.model.Vegetable;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/dashboard")
public class AdminDashboardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin-login.jsp");
            return;
        }
        VegetableDAO v1=new VegetableDAO();
        List<Vegetable> list = v1.getAllVegetables();
        request.setAttribute("vegList", list);

        RequestDispatcher rd =
                request.getRequestDispatcher("admin-dashboard.jsp");
        rd.forward(request, response);
	}

}
