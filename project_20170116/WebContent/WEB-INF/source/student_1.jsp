<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.test.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grade Program</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="/project_20170116/css/myStyle.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script>
$(document).ready(function(){
  // Initialize Tooltip
  $('[data-toggle="tooltip"]').tooltip(); 
  
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a, footer a[href='#myPage']").on('click', function(event) {

    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {

      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
});

</script>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand"><img src="/project_20170116/img/sist_logo.png" alt="logo"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a id="logo">성적처리 프로그램(수강생)</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="project_20170116/student_1.jsp">내정보</a></li>
					<li><a href="/project_20170116/student_2.jsp">나의 강의실</a></li>


					<li><a href="/project_20170116/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center" >
      <div class="row content">
         <div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id="content">
				<h1 style="margin-bottom: 20px">내 정보</h1>

				<div class="panel panel-default ss">
					<div class="panel-body">
						<table class="table table-default">
							<thead>
								<tr>
									<td><b>이름</b></td>
									<td>LEE</td>
								</tr>
								<tr>
									<td><b>전화번호</b></td>
									<td>010-1234-1234</td>
								</tr>
								<tr>
									<td><b>주민번호</b></td>
									<td>2027744</td>
								</tr>
								<tr>
									<td><b>등록일</b></td>
									<td>2017-01-17 <span class="fa fa-calendar"></span></td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
				<form method="post" class="form-inline">
					<div class="form-group">
					 <button type="button" class="btn btn-default" data-toggle="modal"
						data-target="#studentUpdateFormModal">수정</button> 
					</div>
				</form>
			</div>

			<div class="col-sm-2 sidenav">
				<div class="well">

					<p>수강생 OOO님,</p>
					<p>환영합니다!</p>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="text-center">
		
		<br>
		<p>
			Copyright ⓒ <a
				href="http://www.sist.co.kr/index.do">쌍용교육센터</a> All Rights Reserved.
		</p>
	
		
	</footer>
	
	<!-- 수강생 수정 Modal -->
	<div id="studentUpdateFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수강생 정보 수정</h4>
				</div>
				<div class="modal-body">

					<form action="" method="post">

						<div class="form-group">
							<label for="name">이름: </label> <input type="text"
								class="form-control" id="name" name="name" value="LEE" required readonly>
							<span class="help-block">(readonly)</span>
						</div>
						<div class="form-group">
							<label for="password">비밀번호:</label> <input type="password"
								class="form-control" id="password" name="password" required value="1234566"
								maxlength="20"> <span class="help-block">(max 20)</span>
						</div>
						<div class="form-group">
							<label for="phone">전화번호:</label> <input type="text"
								class="form-control" id="phone" name="phone" required value="010-1234-1234"
								maxlength="20"> <span class="help-block">(max 20)</span>
						</div>
						
						 <button type="submit" class="btn btn-default" style = "align:right" >수정</button> 
						 

					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
</body>
</html>