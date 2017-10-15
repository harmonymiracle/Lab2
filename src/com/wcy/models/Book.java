package com.wcy.models;

import java.util.Date;
import java.lang.*;
import java.util.*;


public class Book {
	
	private String isbn;
	private String title;
	private String authorID;
	private String publisher;
	private String publishDate;
	private float price;
	
	
	
	private String authorName;
	private int authorAge;
	private String authorCountry;
	
	public String getIsbn() {
		return isbn;
	}
	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAuthorID() {
		return authorID;
	}
	public void setAuthorID(String authorID) {
		this.authorID = authorID;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getPublishDate() {
		return publishDate;
	}
	public void setPublishDate(String publishDate) {
		this.publishDate = publishDate;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	
	public String getAuthorName() {
		return authorName;
	}
	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}
	public int getAuthorAge() {
		return authorAge;
	}
	public void setAuthorAge(int authorAge) {
		this.authorAge = authorAge;
	}
	public String getAuthorCountry() {
		return authorCountry;
	}
	public void setAuthorCountry(String authorCountry) {
		this.authorCountry = authorCountry;
	}

	
	
	
	@Override
	public String toString(){
		return "ISBN: " + isbn + "\n" +
				"title: " + title + "\n" +
				"AuthorID: " + authorID + "\n" +
				"publisher: " + publisher + "\n" +
				"publishDate" + publishDate + "\n" +
				"price" + this.price + "\n" +
				
				"name: " + authorName + "\n" +
				"age: " + authorAge + "\n" +
				"country: " + authorCountry + "\n";
		
	}
	
	
}
