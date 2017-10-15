package com.wcy.pojo;




public class bookPojo {

	private String isbn;
	private String title;
	private String authorID;
	private String publisher;
	private String publishDate;
	private float price;
	
	
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
	
	

	
	
	
	@Override
	public String toString(){
		return "ISBN: " + isbn + "\n" +
				"title: " + title + "\n" +
				"AuthorID: " + authorID + "\n" +
				"publisher: " + publisher + "\n" +
				"publishDate" + publishDate + "\n" +
				"price" + this.price + "\n" ;
		
	}
	
	
}

