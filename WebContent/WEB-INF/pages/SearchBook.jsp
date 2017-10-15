<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page language="java" import="java.util.*" %>

<%@ page isELIgnored="false"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type='text/javascript' src='/dwr/engine.js'></script>
<script type='text/javascript' src='/dwr/interface/doSomething.js'></script>
<script type='text/javascript' src='/dwr/util.js'></script>



<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 
 <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
</script>

<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">


<script> 
$(document).ready(function(){
  $(".flip").click(function(){
	  $(this).siblings(".panel").slideToggle("slow");
  });
});

//border:solid 1px #c3c3c3;
</script>

<script>
$(document).ready(function(){
	  $("#addBook").click(function(){
		  var s = document.getElementById('authorid').value;
		  
		  doSomething.AddBook(s,function(existFlag){
			  
			  if(!existFlag){
				  alert("作者不存在，请添加作者以完成添加工作");
			  }
			  else{
				  alert("添加成功");
			  }
			  
		  });
		  
	  });
	  
	  
	  $("#editBook").click(function(){
		 
		  var isbn2 = document.getElementById('isbn2').value;
		  var title2 = document.getElementById('title2').value;
		  var authorid2 = document.getElementById('authorid2').value;
		  var publisher2 = document.getElementById('publisher2').value;
		  var publishDate2 = document.getElementById('publishDate2').value;
		  var price2 = document.getElementById('price2').value;

		  
			  
		  //});
		  
	  });
	  
	});
</script>
	




<script>
  function deleteBook(isbn){
	  
	  doSomething.DeleteBook(isbn,freshAndNotify);
	  $("#entry"+isbn).toggle("slow");
	  
  }

  
  
  function editBook(isbn,title,authorid,publisher,publishDate,price){
	  
	  document.getElementById('isbn2').value = isbn;
	  document.getElementById('title2').value = title;
	  document.getElementById('authorid2').value = authorid;
	  document.getElementById('publisher2').value = publisher;
	  document.getElementById('publishDate2').value = publishDate;
	  document.getElementById('price2').value = price;
  }
  

  
  function freshAndNotify(message){
	  alert(message);
  }
  
</script>

<script>
  $(function () { $('#bookModal').modal('hide')});
  
  
</script>




<style type="text/css"> 
.panel,.flip
{
	padding:5px;
	text-align:center;
	background-color:#e5eecc;
	border:solid 2px #c3c3c3;
}
.panel
{
	padding:50px;
	display:none;
}
</style>



<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK</title>
</head>

<body>
<div class="container">
	<div class="row">
		<div class="span12">
			<ul class="nav nav-tabs">
				<li >
					<a href="/home">首页</a>
				</li>
				<li class="active">
					<a href="/searchBook">图书查询</a>
				</li>
				<li class="disabled">
					<a href="#">开发中</a>
				</li>
				
			</ul>
			
			<h3 class="text-center">
				已有的图书列举如下，如需详细信息请点击图书名
			</h3>
		</div>
	</div>
	
	
	<div class="row-fluid">
		
		<div class="span6">
			<form class="form-search" action="searchAuthor" method="post">
				<input class="input-medium search-query" type="text" placeholder="请输入作者名" name="name" />
				<button class="btn btn-default" type="submit">
					<span class="glyphicon glyphicon-search"></span>搜索</button>
			</form>
		</div>
		<div class="span4">
			 <button class="btn btn-success btn-lg" type="button" data-toggle="modal" data-target="#bookModal">
			 	<span class="glyphicon glyphicon-plus"></span>添加书籍</button>
		 	<button class="btn btn-success btn-lg" type="button" data-toggle="modal" data-target="#authorModal">
			 	<span class="glyphicon glyphicon-plus"></span>添加作者</button>
		</div>
	</div>

<!-- 模态框（Modal） -->
<div class="modal fade" id="bookModal" tabindex="-1" role="dialog" aria-labelledby="bookModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="bookModalLabel">
					请输入书籍相关信息
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" action="addBook" method="post">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">ISBN</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="isbn" name="isbn"
								   placeholder="请输入ISBN">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title" name="title"
								   placeholder="请输入标题">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">作者ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="authorid" name="authorid"
								   placeholder="请输入作者ID">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">出版单位</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="publisher" name="publisher"
								   placeholder="请输入出版单位">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">出版日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="publishDate" name="publishDate"
								   placeholder="请输入出版日期">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">价格</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="price" name="price"
								   placeholder="请输入价格">
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="col-sm-offset-9 col-sm-3">
							<button type="submit" class="btn btn-default" id="addBook" >添加</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
						
					</div>
					
					
				</form>
				
				
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->



<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="editModalLabel">
					请输入书籍相关信息
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" action="editBook" method="post">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">ISBN</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="isbn2" name="isbn"
								   placeholder="ISBN" >
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">标题</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="title2" name="title"
								   placeholder="标题" >
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">作者ID</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="authorid2" name="authorid"
								   placeholder="请输入作者ID">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">出版单位</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="publisher2" name="publisher"
								   placeholder="请输入出版单位">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">出版日期</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="publishDate2" name="publishDate"
								   placeholder="请输入出版日期">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">价格</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="price2" name="price"
								   placeholder="请输入价格">
						</div>
					</div>
					
					
					<div class="form-group">
						<div class="col-sm-offset-9 col-sm-3">
							<button type="submit" class="btn btn-default" id="editBook" >提交</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
						
					</div>
					
					
				</form>
				
				
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->





<div class="modal fade" id="authorModal" tabindex="-1" role="dialog" aria-labelledby="authorModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
				</button>
				<h4 class="modal-title" id="authorModalLabel">
					作者不存在，请输入相关信息
				</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" role="form" action="addAuthor" method="post">
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="authorid" name="authorid"
								   placeholder="请输入作者ID">
						</div>
					</div>
					<div class="form-group">
						<label for="firstname" class="col-sm-2 control-label">姓名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								   placeholder="请输入姓名">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">年龄</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="age" name="age"
								   placeholder="请输入年龄">
						</div>
					</div>
					<div class="form-group">
						<label for="lastname" class="col-sm-2 control-label">国籍</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="country" name="country"
								   placeholder="请输入国籍">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-9 col-sm-3">
							<button type="submit" class="btn btn-default" id="addAuthor">添加</button>
							<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						</div>
						
					</div>
					
					
				</form>
				
				
			</div>
			
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->








	
	
	

	
	
	
	<c:forEach items="${bookList}" var="book">
		<div class = "entry" id="entry${book.isbn}">
			<div class="flip">
				<p > ${book.title} </p><br/>
			</div>
			
			<div class="panel">
				<table class="table table-striped">
			   <thead>
			      <tr>
			         <th>标题</th>
			         <th>ISBN</th>
			         <th>作者ID</th>
			         <th>出版者</th>
			         <th>出版日期</th>
			         <th>价格</th>
			         <th>修改</th>
			         <th>删除</th>
			      </tr>
			   </thead>
	   
			   <tbody style="text-align:left" >
			      <tr>
			         <td>${book.title}</td>
			         <td>${book.isbn}</td>
			         <td>${book.authorID}</td>
			         <td>${book.publisher}</td>
			         <td>${book.publishDate}</td>
			         <td>${book.price}</td>
			         <td>
			         	<button class="btn btn-warning" type="button" data-toggle="modal" data-target="#editModal" 
			         	onclick="editBook('${book.isbn}','${book.title}','${book.authorID}','${book.publisher}','${book.publishDate}','${book.price}')">
			         	<em class="icon-pencil"></em>
							
							<span class="glyphicon glyphicon-pencil"></span>编辑</button> 
			         </td>
			         <td>
			         	<button class="btn btn-danger" type="button"  onclick="deleteBook('${book.isbn}')">
			         	<em class=".glyphicon-plane"></em>
							<span class="glyphicon glyphicon-trash"></span>删除</button> 
			         </td>
			      </tr>
			      
			   </tbody>
			   </table>
			   
			   
			   <table class="table table-striped">
				   <thead>
				      <tr>
				         <th>作者姓名</th>
				         <th>作者年龄</th>
				         <th>作者国籍</th>
				      </tr>
				   </thead>
		   
				   <tbody style="text-align:left">
				      <tr>
				         <td>${book.authorName}</td>
				         <td>${book.authorAge}</td>
				         <td>${book.authorCountry}</td>
				      </tr>
				   </tbody>
			   </table>
			   
			   
			</div> <!--panel -->
			
			</div>
	   </c:forEach>
	
			
	
		
		
		
		
</div>

	


</body>
</html>