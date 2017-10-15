package com.wcy.models;

import java.lang.*;

public class Author {

	private String authorID;
	private String name;
	private int age;
	private String country;
	
	public String getAuthorID() {
		return authorID;
	}
	public void setAuthorID(String authorID) {
		this.authorID = authorID;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	
	@Override
	public String toString(){
		return "ID: " + authorID + "\n" +
				"name: " + name + "\n" +
				"age: " + age + "\n" +
				"country: " + country + "\n";
		
	}
	
}
