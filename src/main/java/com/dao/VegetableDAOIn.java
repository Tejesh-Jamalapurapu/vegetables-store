package com.dao;

import java.util.List;

import com.model.Vegetable;

public interface VegetableDAOIn {
	public void addVegetable(Vegetable v);
	public List<Vegetable> getAllVegetables();
	public void updateVegetable(int id, String name, double price);
}
