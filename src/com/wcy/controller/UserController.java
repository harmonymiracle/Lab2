//for git test 211


package com.wcy.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.validation.BindException;  
import org.springframework.web.servlet.ModelAndView;  



import java.lang.*;
import java.util.*;
import java.sql.*;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;


import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.sql.Statement;

import java.sql.PreparedStatement;



import org.gjt.mm.mysql.*;
import com.mysql.jdbc.Driver;

import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
  
import javax.sql.DataSource;
import org.apache.tomcat.dbcp.dbcp2.datasources.*;

import com.wcy.models.*;


@Controller
public class UserController {

	
	
	static String driver = "com.mysql.jdbc.Driver";
	
	@RequestMapping("")
	
	public String Home(Model model) {
		
		return "home";
	}
	
	@RequestMapping("/home")
	public String Home2(Model model){
		
		return "home";
	}
	
	
	
	@RequestMapping("/addAuthor")
	public String AddAuthor(HttpServletRequest request, Model model){
		
		String authorid = request.getParameter("authorid");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String country = request.getParameter("country");
		
		//String username = "root";
		//String password = "qwe789";
		//String dbUrl = "jdbc:mysql://localhost:3306/bookdb";
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		
		
		//INSERT INTO `bookdb`.`book` (`ISBN`, `Title`, `AuthorID`, `Publisher`, `PublishDate`, `Price`) VALUES ('213154687', '本人测试书籍1', '4', '666出版方', '2017.10', '6.66');
		
		
		
		try{
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "insert into author values (?, ?, ?,?)";    
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, authorid);
			ps.setString(2, name);
			ps.setInt(3, age);
			ps.setString(4, country);
			
			
			Boolean rs = ps.execute();
			System.out.println(rs);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:searchBook";
	}
	
	
	
	
	@RequestMapping("/editBook")
	public String EditBook(HttpServletRequest request, Model model){
		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		String authorid = request.getParameter("authorid");
		String publisher = request.getParameter("publisher");
		String publishDate = request.getParameter("publishDate");
		float price =  Float.parseFloat(request.getParameter("price"));   
		
		System.out.println(isbn);
		System.out.println(title);
		System.out.println(authorid);
		System.out.println(publisher);
		System.out.println(publishDate);
		System.out.println(price);
		
		
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		try{
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "update book set AuthorID=?, Publisher=?, PublishDate=?, Price=? where ISBN=?";    
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, authorid);
			ps.setString(2, publisher);
			ps.setString(3, publishDate);
			ps.setFloat(4, price);
			ps.setString(5, isbn);
			
			
			Boolean rs = ps.execute();
			System.out.println(rs);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:searchBook";
	}
	
	
	
	
	@RequestMapping("/addBook")
	public String AddBook(HttpServletRequest request, Model model){
		
		String isbn = request.getParameter("isbn");
		String title = request.getParameter("title");
		String authorid = request.getParameter("authorid");
		String publisher = request.getParameter("publisher");
		String publishDate = request.getParameter("publishDate");
		float price =  Float.parseFloat(request.getParameter("price"));   
		
		System.out.println("get the input data");
		
		
		//INSERT INTO `bookdb`.`book` (`ISBN`, `Title`, `AuthorID`, `Publisher`, `PublishDate`, `Price`) VALUES ('213154687', '本人测试书籍1', '4', '666出版方', '2017.10', '6.66');
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		try{
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "insert into book values (?, ?, ?,?, ?, ?)";    
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, isbn);
			ps.setString(2, title);
			ps.setString(3, authorid);
			ps.setString(4, publisher);
			ps.setString(5, publishDate);
			ps.setFloat(6, price);
			
			Boolean rs = ps.execute();
			System.out.println(rs);
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return "redirect:searchBook";
	}
	
	
	
	
	
	
	@RequestMapping("/searchAuthor")
	public String SearchAuthor(HttpServletRequest request, Model model){
		
		String name = request.getParameter("name");
		
		System.out.println(name);
		
		ArrayList<Book> bookList = new ArrayList<Book>();
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		
		try{
			
			Class.forName(driver);  //driver = "com.mysql.jdbc.Driver"
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "select * from author where author.name=?";    
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()){
				String sqlBook = "select * from book where authorid=?"; 
				PreparedStatement ps2 = conn.prepareStatement(sqlBook);
				
				ps2.setString(1, rs.getString("authorid"));
				ResultSet rsBook = ps2.executeQuery();
				
				
				while(rsBook.next()){
					
					Book book = new Book();
					book.setAuthorID(rsBook.getString("authorid"));
					book.setIsbn(rsBook.getString("isbn"));
					book.setPrice(rsBook.getFloat("price"));
					book.setPublishDate(rsBook.getString("publishDate"));
					book.setPublisher(rsBook.getString("publisher"));
					book.setTitle(rsBook.getString("title"));
					
					book.setAuthorName(rs.getString("name"));
					book.setAuthorAge(rs.getInt("age"));
					book.setAuthorCountry(rs.getString("country"));
					
					
					bookList.add(book);
				}
				rsBook.close();
				
			}
			rs.close();
			conn.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		model.addAttribute("bookList",bookList);
		
		System.out.println(bookList.size());
		
		return "SearchBook";
	}
	//不用再加载applicationContext.xml文件,因为在web.xml中配置了,在程序中启动是就有
    // UserService userService = (UserService) SpringContextUtil.getBean("dataSource");
	
	
	
	
	
	
	@RequestMapping("/searchBook")
	public String SearchBook(Model model){
		
		ArrayList<Book> bookList;
		
		bookList = SearchAllBook();
		
		System.out.println(bookList.size());
		model.addAttribute("bookList",bookList);
		
		//System.out.println(bookList.size());
		
		return "SearchBook";
	}
	
	public ArrayList<Book> SearchAllBook(){
		
		ArrayList<Book> bk = new ArrayList<Book>();
		
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		try{
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "select * from author";   
			PreparedStatement ps = conn.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			
			
			while(rs.next()){
				String sqlBook = "select * from book where authorid=?"; 
				PreparedStatement ps2 = conn.prepareStatement(sqlBook);
				
				ps2.setString(1, rs.getString("authorid"));
				ResultSet rsBook = ps2.executeQuery();
				
				
				while(rsBook.next()){
					
					Book book = new Book();
					book.setAuthorID(rsBook.getString("authorid"));
					book.setIsbn(rsBook.getString("isbn"));
					book.setPrice(rsBook.getFloat("price"));
					book.setPublishDate(rsBook.getString("publishDate"));
					book.setPublisher(rsBook.getString("publisher"));
					book.setTitle(rsBook.getString("title"));
					
					book.setAuthorName(rs.getString("name"));
					book.setAuthorAge(rs.getInt("age"));
					book.setAuthorCountry(rs.getString("country"));
					
					
					bk.add(book);
				}
				rsBook.close();
				
			}
			rs.close();
			conn.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		return bk;
	}
	
	
	

	
}
