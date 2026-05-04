package com.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ImageLoaderServlet")
public class ImageLoaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String fileName = request.getParameter("name");

		String imagePath = "C:/vegetable_uploads/" + fileName;

		File file = new File(imagePath);

		if (file.exists()) {
			response.setContentType(getServletContext().getMimeType(fileName));
			FileInputStream fis = new FileInputStream(file);
			ServletOutputStream os = response.getOutputStream();


			byte[] buffer = new byte[1024];
			int bytesRead;

			while ((bytesRead = fis.read(buffer)) != -1) {
				os.write(buffer, 0, bytesRead);
			}
			fis.close();
			os.close();
		}
	}
}
