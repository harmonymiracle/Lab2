package com.wcy.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
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



import java.util.ArrayList;


import com.wcy.models.Book;
import com.wcy.pojo.*;

public class doSomething {
	
	
	static String driver = "com.mysql.jdbc.Driver";
	
	public Boolean AddAuthor(String authorid){
		
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		
		System.out.println(authorid);
		
		Boolean existAuthor = false;
		
		try{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "select * from author where author.authorid=?";    
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, authorid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				existAuthor = true;
				System.out.println(rs.wasNull());
			}
			
			
			
			rs.close();
			conn.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		return existAuthor;
	}
	
	
	
	public Boolean AddBook(String authorid){
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		System.out.println(authorid);
		
		Boolean existAuthor = false;
		
		try{
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "select * from author where author.authorid=?";    
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, authorid);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()){
				existAuthor = true;
				System.out.println(rs.wasNull());
			}
			
			
			
			rs.close();
			conn.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		return existAuthor;
	}
	
	
	public String DeleteBook(String isbnTemp){
		//System.out.println(bookList.size());
		
		String username = System.getenv("ACCESSKEY");
		String password = System.getenv("SECRETKEY");
		
		String dbUrl = String.format("jdbc:mysql://%s:%s/%s", System.getenv("MYSQL_HOST"), System.getenv("MYSQL_PORT"), System.getenv("MYSQL_DB"));
		
		try{
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(dbUrl, username, password);
			
			if(!conn.isClosed())
				System.out.println("not close");
			
			
			String sql = "delete from book where isbn=?";   
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, isbnTemp);
			
			Boolean rs = ps.execute();
			
			System.out.println(rs);
			
			conn.close();
			
		}
		catch(Exception e){
			e.printStackTrace();
			
		}
		
		
		System.out.println(isbnTemp);
		return "É¾³ý³É¹¦";
	}
	

	
	
	
}
