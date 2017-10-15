<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0063)file:///F:/start/JAVA/BookLib/WebContent/WEB-INF/pages/home.htm -->

<html>
<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
 


<!-- 新 Bootstrap 核心 CSS 文件 -->
<link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 


<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<base href="<%=basePath%>">


<title>BOOK</title>


</head>
<body>

<div class="navbar navbar-fixed-top navbar" role="navigation">
	<div class="container">
	
		<div class="row-fluid" >
		<div class="col-md-12 column">
			<ul class="nav nav-tabs">
				<li  class="active" >
					 <a href="/home"><span class="glyphicon glyphicon-home"></span>首页</a>
				</li>
				<li >
					 <a href="/searchBook"><span class="glyphicon glyphicon-search"></span>查询图书</a>
				</li>
				<li class="disabled">
					 <a href="#">开发中</a>
				</li>
				<li class="dropdown pull-right">
					 <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
					<ul class="dropdown-menu">
						<li>
							 <a href="#">操作</a>
						</li>
						<li>
							 <a href="#">设置栏目</a>
						</li>
						<li>
							 <a href="#">更多设置</a>
						</li>
						<li class="divider">
						</li>
						<li>
							 <a href="#">分割线</a>
						</li>
					</ul>
				</li>
			</ul>
			<blockquote>
				<p>
					书籍是培养智慧的工具
				</p> <small>夸美绍斯 </small>
			</blockquote><img width="304" height="228" src="img/book.jpg" class="img-circle" />
			<div class="jumbotron">
				<h1>
					欢迎来到数字图书馆
				</h1>
				
				<p>
					 <a class="btn btn-primary btn-large" href="/searchBook">去看看</a>
				</p>
			</div>
		</div>
	</div>
		
	</div><!-- /.container -->
</div>


</body>

</html>




