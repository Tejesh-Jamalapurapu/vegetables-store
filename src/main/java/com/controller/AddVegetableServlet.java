package com.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
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

    private String getUploadPath() {

        String os = System.getProperty("os.name").toLowerCase();

        if (os.contains("win")) {
            return "C:/vegetable_uploads";
        } else {
            return "/opt/vegetable_uploads";
        }
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String price = request.getParameter("price");

        Part filePart = request.getPart("image");

        String originalFileName = Paths.get(
                filePart.getSubmittedFileName()
        ).getFileName().toString();

        String uploadPath = getUploadPath();

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String fileName = System.currentTimeMillis()
                + "_" + originalFileName;

        filePart.write(
                uploadPath + File.separator + fileName
        );

        try {

            DBConnection db = new DBConnection();
            Connection con = db.getConnection();

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO vegetables(name, price, image) VALUES(?,?,?)"
            );

            ps.setString(1, name);
            ps.setString(2, price);
            ps.setString(3, fileName);

            ps.executeUpdate();

            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("home");
    }
}