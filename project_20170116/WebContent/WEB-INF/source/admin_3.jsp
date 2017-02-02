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
                <li><a href="/project_20170116/admin_1.jsp">기초 정보 관리</a></li>
                <li ><a href="/project_20170116/admin_2.jsp">강사 계정 관리</a></li>
				<li class="active"><a href="/project_20170116/admin_3.jsp">개설 과정 관리</a></li>
				<li><a href="/project_20170116/admin_4.jsp">개설 과목 관리</a></li>
				<li><a href="/project_20170116/admin_5.jsp">수강생 관리</a></li>
				<li><a href="/project_20170116/admin_6.jsp">성적 조회</a></li>
				<li><a href="/project_20170116/logout.jsp"><span class="glyphicon glyphicon-log-out"></span>Logout</a></li>
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
							<!-- <tr>
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
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#courseupdateModal">수정</button>
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
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#courseupdateModal">수정</button>
								<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#coursedelModal">삭제</button>
								</td>
							</tr> -->
						 <c:forEach var="d" items="${list1}">
						<tr>
							<td>${d.course_id}</td>
							<td>${d.coursename}</td>
							<td>${d.course_start}</td>
							<td>${d.course_end}</td>
							<td>${d.classroom_name}</td>
							<td>${d.count_subject}</td>
							<td>${d.accommodate}</td>	
							<td>${d.count_student}</td>
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
							<!-- 	<tr>
									<td>subject001</td>
									<td>자바</td>
									<td>20161101</td>
									<td>20161115</td>
									<td>모모</td>
									<td><a data-toggle="collapse" data-parent="#accordion" href="#book1" >이것이자바다</a></td>
								</tr>
								
								<tr>
									<td>subject002</td>
									<td>오라클</td>
									<td>20161116</td>
									<td>20161131</td>
									<td>사나</td>
									<td><a data-toggle="collapse" data-parent="#accordion" href="#book1">SQL</a></td>
								</tr> -->
						 	<%-- <c:forEach var="v" items="${list1}">
								<tr>
									<td>${v.subject_id}</td>
									<td>${v.sub_name}</td>
									<td>${v.subject_start}</td>
									<td>${v.subject_end}</td>
									<td>${v.teacher_name}</td>
									<td><a data-toggle="collapse" data-parent="#accordion" href="#book1">${v.bookname}</a></td>
								</tr>
							</c:forEach>  --%>
	
							</tbody>
						</table>
						<div id="book1" class="panel-collapse collapse">
						<img src ="/project_20170116/img/book.png" alt="">
						
						</div>
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
								<!-- <tr>
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
								</tr> -->
								
					<%-- 	<c:forEach var="s" items="${list2}">
						<tr>
							<td>${s.student_id}</td>
							<td>${s.student_name}</td>
							<td>${s.student_ssn}</td>
							<td>${s.student_phone}</td>
							<td>${s.register_date}</td>
							<td>${s.fail_date}</td>
						</tr>
					</c:forEach> --%>
	
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
						
							<div class="form-group">과정ID: course001<span id="sid3"></span></div>
							<div class="form-group">과정명: 빅데이터 응용SW개발<span id="name3"></span></div>
							<div class="form-group">현재 선택한 자료를 삭제할까요?</div>
							<br>
						<button type="submit" class="btn btn-default" >확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						
						</form>
			</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	
	<!-- 수정 Modal -->
	<div class="modal fade" id="courseupdateModal" role="dialog">
		<div class="modal-dialog modal-fullsize">

			<!-- Modal content-->
			<div class="modal-content modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과정 수정</h4>
				</div>
				<div class="modal-body">
				
				<form action="admin_3.jsp" method="post">
				
				<div class="form-group">
					<label for="sid2">과정명을 선택하세요</label> 
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="btn btn-default btn-xs" role="button">과정조회</a>
					<input type="text" class="form-control" id="id" name="id"  value = "빅데이터 응용SW개발"  readonly required >
				</div>
				
				<div id="collapse1" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="grade">
					
							<table class="table"  id="boardTable">
								<thead>
									<tr>
										<th>과정명ID</th>
										<th>과정명</th>
									</tr>
								</thead>
								
								<tbody>
									<tr class="link">
										<td>coursename001</td>
										<td>빅데이터 응용SW개발</td>
									</tr>
									
									<tr class="link">
										<td>coursename002</td>
										<td>파이톤 응용SW개발</td>
									</tr>
		
								</tbody>
							</table>
					</div>
				</div>
				</div>
				
				<div class="form-group">
					<label for="name2">강의실을 선택하세요</label> 
					<a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="btn btn-default btn-xs" role="button">강의실조회</a>
					<input type="text" class="form-control" id="name" name="name" value="강의실102" readonly required>
				</div>
				
				<div id="collapse2" class="panel-collapse collapse">
				<div class="panel-body">
					<div class="grade">
								<table class="table"  id="boardTable">
							<thead>
								<tr>
									<th>강의실ID</th>
									<th>강의실명</th>
									<th>정원</th>
								</tr>
							</thead>
							
							<tbody>
								<tr class="link">
									<td>classroom001</td>
									<td>강의실101</td>
									<td>30</td>
								</tr>
								
								<tr class="link">
									<td>classroom002</td>
									<td>강의실102</td>
									<td>20</td>
								</tr>
								
								<tr class="link">
									<td>classroom003</td>
									<td>강의실103</td>
									<td>20</td>
								</tr>
				
							</tbody>
						</table>
					</div>
				</div>
			</div>
				
				<div class="form-group">
					<label for="phone2">과정의 시작일</label> <span class="glyphicon glyphicon-calendar"></span>
					<input type="text" class="form-control" id="start" name="start" value="2017-01-01" required >
					
				</div>
				<div class="form-group">
					<label for="phone2">과정의 종료일</label> <span class="glyphicon glyphicon-calendar "></span>
					<input type="text" class="form-control" id="end" name="end" value="2017-02-28" required>
				</div>
				
				<button type="submit" class="btn btn-default" >확인</button>
				<button type="submit" class="btn btn-default">취소</button>
			</form>
			

	</div>
				<div class="modal-footer"></div>
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