package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.Vegetable;
import com.utility.DBConnection;

public class VegetableDAO implements VegetableDAOIn {
	public void addVegetable(Vegetable v) {

		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("INSERT INTO vegetables(name,price,image) VALUES(?,?,?)");

			ps.setString(1, v.getName());
			ps.setDouble(2, v.getPrice());
			ps.setString(3, v.getImage());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List<Vegetable> getAllVegetables() {

		List<Vegetable> list = new ArrayList<>();

		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM vegetables");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Vegetable v = new Vegetable();
				v.setId(rs.getInt("id"));
				v.setName(rs.getString("name"));
				v.setPrice(rs.getDouble("price"));
				v.setImage(rs.getString("image"));

				list.add(v);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public void deleteVegetable(int id) {
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("DELETE FROM vegetables WHERE id = ?");
			ps.setInt(1, id);
			ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateVegetable(int id, String name, double price) {
		try {
			DBConnection db = new DBConnection();
			Connection con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("update vegetables set name=?,price=? where id=?");
			ps.setString(1, name);
			ps.setDouble(2, price);
			ps.setInt(3, id);
			ps.executeUpdate();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
