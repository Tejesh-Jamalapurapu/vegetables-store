package com.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.utility.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@WebServlet("/addVegetable")
@MultipartConfig
public class AddVegetableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 String name = request.getParameter("name");
	        String price = request.getParameter("price");
	        

	        Part filePart = request.getPart("image");
	        String originalFileName = filePart.getSubmittedFileName();

	        // 🔥 Save in C drive permanently
	        String uploadPath = "C:/vegetable_uploads";

	        File uploadDir = new File(uploadPath);
	        if (!uploadDir.exists()) {
	            uploadDir.mkdirs();
	        }

	        // 🔥 Create unique filename
	        String fileName = System.currentTimeMillis() + "_" + originalFileName;

	        filePart.write(uploadPath + File.separator + fileName);

	        // 🔥 Save into database
	        try {
	        	DBConnection db=new DBConnection();
	            Connection con = db.getConnection();
	            PreparedStatement ps = con.prepareStatement(
	                    "INSERT INTO vegetables(name, price, image) VALUES(?,?,?)");

	            ps.setString(1, name);
	            ps.setString(2, price);
	            ps.setString(3, fileName);

	            ps.executeUpdate();
	            con.close();

	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        response.sendRedirect("home");
	    }

}
