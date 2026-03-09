package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        try {
	        	DBConnection db=new DBConnection();
	            Connection con = db.getConnection();
	            PreparedStatement ps = con.prepareStatement(
	                "SELECT * FROM admin WHERE username=? AND password=?");

	            ps.setString(1, username);
	            ps.setString(2, password);

	            ResultSet rs = ps.executeQuery();

	            if(rs.next()) {

	                request.getSession().setAttribute("admin", username);
	                response.sendRedirect("admin-dashboard.jsp");

	            } else {

	                response.sendRedirect("admin-login.jsp");
	            }

	        } catch(Exception e) {
	            e.printStackTrace();
	        }
	}

}
