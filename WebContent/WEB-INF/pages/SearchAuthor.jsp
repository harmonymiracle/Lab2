<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page language="java" import="java.util.*" %>


<!--  %@ page language="java" import="javax.servlet.jsp.jstl.*" %>-->

<%@ page isELIgnored="false"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js">
</script>

<script type="text/javascript">
function deleteBook(isbn){
	var xmlhttp;
	if(window.XMLHttpRequest){
		xmlhttp = new XMLHttpRequest;
	}
	else{
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		
	}
	
	xmlhttp.onreadystatechange=function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			document.getElementById("ps").innerHTML = xmlhttp.responseText;
			
		}
	}
	
	xmlhttp.open("post", "/isbn" +isbn + ".delete", true);
	xmlhttp.send();
	
}


</script>




<script type="text/javascript">
	$(document).ready(function(){
		$(".deleteBook").click(function(){
			
			$.ajax({
				type:"post",
				url:"/delete",
				dataType:"text",
				data:{
					isbn:$(this).attr("name")
				},
				
				success:function(){
					alert("i did it");
				}
			});
			//$.get("/controller/UserController.java/Delete");
			
			
			$(this).parent().parent().fadeOut("slow");
			
		})
		
	})
	
</script>


<script> 

$(document).ready(function(){
  $(".flip").click(function(){
	  $(this).siblings(".panel").slideToggle("slow");
  });
});
</script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>BOOK</title>
</head>

<body>

<style type="text/css"> 
.panel,.flip
{
	padding:5px;
	text-align:center;
	background-color:#e5eecc;
	border:solid 1px #c3c3c3;
}
.panel
{
	padding:50px;
	display:none;
}
</style>


<div style="background-color: #dbd6d3">


<div>
	<form action="home" method="post">
		<input type="submit" value="返回首页">
	</form>
	
	<form action="searchBook" method="post">
		<input type="submit" value="查询所有图书">
	</form>


</div>



<div>
	<h1 style="font-family: 'Adobe Arabic';  text-align: center;"  ><b>相关作者作品如下：</b></h1>

</div>










</div>


</body>
</html>