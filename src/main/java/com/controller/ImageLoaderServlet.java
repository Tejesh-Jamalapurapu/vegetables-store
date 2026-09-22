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

    private String getUploadPath() {

        String os = System.getProperty("os.name").toLowerCase();

        if (os.contains("win")) {
            return "C:/vegetable_uploads";
        } else {
            return "/opt/vegetable_uploads";
        }
    }

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String fileName = request.getParameter("name");

        if (fileName == null || fileName.contains("..")
                || fileName.contains("/")
                || fileName.contains("\\")) {

            response.sendError(
                    HttpServletResponse.SC_BAD_REQUEST,
                    "Invalid file name"
            );

            return;
        }

        String imagePath = getUploadPath()
                + File.separator + fileName;

        File file = new File(imagePath);

        if (!file.exists() || !file.isFile()) {

            response.sendError(
                    HttpServletResponse.SC_NOT_FOUND,
                    "Image not found"
            );

            return;
        }

        String contentType = getServletContext()
                .getMimeType(fileName);

        if (contentType == null) {
            contentType = "application/octet-stream";
        }

        response.setContentType(contentType);
        response.setContentLengthLong(file.length());

        try (FileInputStream fis = new FileInputStream(file);
             ServletOutputStream os = response.getOutputStream()) {

            byte[] buffer = new byte[8192];
            int bytesRead;

            while ((bytesRead = fis.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }
    }
}