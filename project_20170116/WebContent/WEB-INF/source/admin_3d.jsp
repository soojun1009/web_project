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
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="/project_20170116/css/myStyle.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
               <li><a id="logo">성적처리 프로그램(관리자)</a></li>
            </ul>
              <ul class="nav navbar-nav navbar-right">
                <li><a href="admin_1.it">기초 정보 관리</a></li>
                <li ><a href="admin_2.it">강사 계정 관리</a></li>
				<li class="active"><a href="admin_3.it>개설 과정 관리</a></li>
				<li><a href="admin_4.it">개설 과목 관리</a></li>
				<li><a href="admin_5.it">수강생 관리</a></li>
				<li><a href="admin_6.it">성적 조회</a></li>
				<li><a href="logout.it"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center" >
		<div class="row content" >
			<div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id="content" >

			<h1 style="margin-bottom:20px">개설과정관리</h1>
			<div class="panel panel-default ss">
				<div class="panel-body">
					<table class="table" id="boardTable">
						<thead>
							<tr>
								<th>과정ID</th>
								<th>과정명</th>
								<th>과정시작일</th>
								<th>과정종료일</th>
								<th>강의실</th>
								<th>과목등록</th>
								<th>정원</th>
								<th>등록인원</th>
								<th>조회</th>
								<th>수정/삭제</th>
							</tr>
						</thead>
						
						<tbody>
					<!-- 		<tr>
								<td>course001</td>
								<td>빅데이터 응용SW개발</td>
								<td>20161101</td>
								<td>20161131</td>
								<td>강의실101</td>
								<td>2</td>
								<td>30</td>
								<td>3</td>
								<td><button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursesubModal">과목</button>
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursestuModal">수강생</button>
								</td>
								<td>
								<a href="admin_3_updateForm.jsp" class="btn btn-default btn-xs" role ="button">수정</a>
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursedelModal">삭제</button>
								</td>
							</tr>
							
							<tr>
								<td>course002</td>
								<td>파이톤 응용SW개발</td>
								<td>20151009</td>
								<td>20151231</td>
								<td>강의실102</td>
								<td>0</td>
								<td>20</td>
								<td>8</td>
								<td><button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursesubModal">과목</button>
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursestuModal">수강생</button>
								</td>
								<td>
								<a href="admin_3_updateForm.jsp" class="btn btn-default btn-xs" role ="button">수정</a>
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursedelModal">삭제</button>
								</td>
							</tr> -->
					  <c:forEach var="g" items="${list}">
						<tr>
							<td>${g.course_id}</td>
							<td>${g.coursename}</td>
							<td>${g.course_start}</td>
							<td>${g.course_end}</td>
							<td>${g.classroom_name}</td>
							<td>${g.count_subject}</td>
							<td>${g.accommodate}</td>	
							<td>${g.count_student}</td>
							<td><button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursesubModal">과목</button>
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursestuModal">수강생</button>
								</td>
								<td>
								<a href="admin_3_updateForm.jsp" class="btn btn-default btn-xs" role ="button">수정</a>
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursedelModal">삭제</button>
							</td>
						</tr>
					</c:forEach>
							
							
						</tbody>
					</table>
					
					
					<form method="post" class="form-inline">
						<div class="form-group">
						<a href="admin_3_insertForm.jsp" >
							<button type="button" class="btn btn-default">			 
								과정등록
							</button>
						</a>
						</div>

						<div class="form-group">
							<button type="button" class="btn btn-default count">
								TotalCount <span class="badge" id="totalCount">2</span>
							</button>
						</div>


						<div class="form-group">
						
							<button type="button" class="btn btn-default count">
								Count <span class="badge" id="count">2</span>
							</button>
						</div>

						<div class="form-group">
							<select class="form-control" name="skey" id="skey">
								<option value="all">전체</option>
								<option value="id">과정ID</option>
								<option value="name">과정명</option>
							</select>
						</div>

						<div class="form-group">
							<input type="text" class="form-control" id="svalue" name="svalue">
						</div>

						<button type="submit" class="btn btn-default">
						<span class="glyphicon glyphicon-search"></span> Search</button>

					</form>
					

					</div>
				</div>
			</div>

			<div class="col-sm-2 sidenav">
			<div class="well">

				<p>관리자 admin님,</p>
				<p>환영합니다!</p>
			</div>
		</div>
	</div>
	</div>


	<!--  과목 조회 Modal -->
	<div class="modal fade" id="coursesubModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목 조회</h4>
				</div>
				<div class="modal-body" >
					<p>
					<form action="admin_3.jsp" method="post">
						
						
				<h4 style="margin-bottom:20px">빅데이터 응용SW개발(20161101~20161131)</h4>
			
				<div class="panel panel-default">
					<div class="panel-body">
					<div class="grade">
						<table class="table"  id="boardTable">
							<thead>
								<tr>
									<th>과목ID</th>
									<th>과목명</th>
									<th>과목시작일</th>
									<th>과목종료일</th>
									<th>강사명</th>
									<th>교재명</th>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>subject001</td>
									<td>자바</td>
									<td>20161101</td>
									<td>20161115</td>
									<td>모모</td>
									<td><a href="/project_20170116/img/book.png" >이것이자바다</a></td>
									</tr>
								
								<tr>
									<td>subject002</td>
									<td>오라클</td>
									<td>20161116</td>
									<td>20161131</td>
									<td>사나</td>
									<td><a href="/project_20170116/img/book.png" >SQL</a></td>
								</tr>
	
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
				
	<!--  수강생 조회 Modal -->
	<div class="modal fade" id="coursestuModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수강생 조회</h4>
				</div>
				<div class="modal-body" >
					<p>
					<form action="admin_3.jsp" method="post">
						
						
				<h4 style="margin-bottom:20px">빅데이터 응용SW개발(20161101~20161131)</h4>
			
				<div class="panel panel-default">
					<div class="panel-body">
					<div class="grade">
						<table class="table"  id="boardTable">
							<thead>
								<tr>
									<th>수강생ID</th>
									<th>수강생명</th>
									<th>주민번호</th>
									<th>전화번호</th>
									<th>등록일</th>
									<th>중도탈락</th>
									
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td>student001</td>
									<td>이수준</td>
									<td>2227744</td>				
									<td>010-1234-1234</td>
									<td>20161101</td>
									<td></td>
								</tr>
								
								<tr>
									<td>student002</td>
									<td>이우연</td>
									<td>1227744</td>				
									<td>010-2222-1234</td>
									<td>20161030</td>
									<td></td>
								</tr>
								
								<tr>
									<td>student003</td>
									<td>홍길동</td>
									<td>1227554</td>				
									<td>010-1123-1234</td>
									<td>20161101</td>
									<td>20161108</td>
								</tr>
	
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</form>		
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
				
	<!--  삭제 Modal -->
	<div class="modal fade" id="coursedelModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">과정 삭제</h4>
					</div>
					<div class="modal-body">
						<form action="admin_3.jsp" method="post">
						
							<input type="hidden" value="1" name="sid" id="sid4">
						
							<div class="form-group">번호: course001<span id="sid3"></span></div>
							<div class="form-group">이름: 빅데이터 응용SW개발<span id="name3"></span></div>
							<div class="form-group">현재 선택한 자료를 삭제할까요?</div>
							<br>
						<button type="submit" class="btn btn-default" >확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						
						</form>
						
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
</body>
</html>