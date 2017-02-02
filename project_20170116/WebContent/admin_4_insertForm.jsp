<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%
	request.setCharacterEncoding("UTF-8");
	
%>
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
				<li ><a href="/project_20170116/admin_3.jsp">개설 과정 관리</a></li>
				<li class="active"><a href="/project_20170116/admin_4.jsp">개설 과목 관리</a></li>
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

			<h1 style="margin-bottom:20px">개설과목관리<small> 과목등록</small></h1> 
			<div class="panel panel-default ss">
				<div class="panel-body">
				
				<form >
				<div class="form-group">
					<label for="sid2">등록할 과정ID</label> 
					<input type="text" class="form-control" id="id" name="id"  value = "course001"  readonly required >
				</div>
				<div class="form-group">
					<label for="sid2">등록할 과정명</label> 
					<input type="text" class="form-control" id="id" name="id"  value = "빅데이터 응용SW개발"  readonly required >
				</div>
				</form>
				
				<form class="form-inline">
				<div class="form-group">
					<label for="sid2" >과정기간</label> 
					<input type="text" class="form-control" id="id" name="id"  value = "2016-11-01"  readonly required >
				</div>
				<div class="form-group">
					<label for="sid2" >~</label>
					<input type="text" class="form-control" id="id" name="id"  value = "2016-11-31"  readonly required >
				</div>
				</form><br>
				
				<form action="admin_4.jsp" method="post">
				<div class="form-group">
					<label for="sid2">등록할 과목명을 선택하세요</label> 
					<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#subjectModal">과목조회</button>
					<input type="text" class="form-control" id="id" name="id"  value = "자바"  readonly required >
				</div>
				<div class="form-group">
					<label for="sid2">등록할 강사명을 선택하세요</label> 
					<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#teacherModal">강사조회</button>
					<input type="text" class="form-control" id="id" name="id"  value = "모모"  readonly required >
				</div>
				<div class="form-group">
					<label for="name2">등록할 교재명을 선택하세요</label> 
					<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#bookModal">교재조회</button>
					<input type="text" class="form-control" id="name" name="name" value="이것이자바다" readonly required>
				</div>
				<div class="form-group">
					<label for="phone2">과목의 시작일</label> <span class="glyphicon glyphicon-calendar"></span>
					<input type="text" class="form-control" id="start" name="start" value="2017-01-01" required >
					
				</div>
				<div class="form-group">
					<label for="phone2">과목의 종료일</label> <span class="glyphicon glyphicon-calendar "></span>
					<input type="text" class="form-control" id="end" name="end" value="2017-01-31" required>
				</div>
				
				<button type="submit" class="btn btn-default" >확인</button>
				<button type="submit" class="btn btn-default">취소</button>
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
	<div class="modal fade" id="subjectModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목명 조회</h4>
				</div>
				<div class="modal-body" >
					<form action="admin_4_insertForm.jsp" method="post">
				<div class="panel panel-default">
					<div class="panel-body">
					<div class="grade">
						<table class="table"  id="boardTable">
							<thead>
								<tr>
									<th>과목명ID</th>
									<th>과목명</th>
								</tr>
							</thead>
							
							<tbody>
								<tr class="link">
									<td>subjectname001</td>
									<td>자바</td>
								</tr>
								
								<tr class="link">
									<td>subjectname002</td>
									<td>오라클</td>
								</tr>
	
							</tbody>
						</table>
					</div>
				</div></div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--  강사 조회 Modal -->
	<div class="modal fade" id="teacherModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강사 조회</h4>
				</div>
				<div class="modal-body" >
					<form action="admin_4_insertForm.jsp" method="post">
				<div class="panel panel-default">
					<div class="panel-body">
					<div class="grade">
						<table class="table"  id="boardTable">
							<thead>
								<tr>
									<th>강사ID</th>
									<th>강사명</th>
									<th>주민번호</th>
									<th>전화번호</th>
									<th>강의가능과목</th>
								</tr>
							</thead>
							
							<tbody>
								<tr class="link">
									<td >teacher001</td>
									<td>모모</td>
									<td>2121212</td>
									<td>010-1566-1234</td>
									<td>자바, 오라클, 파이썬</td>
								</tr>
								
								<tr class="link">
									<td>teacher002</td>
									<td>사나</td>
									<td>2112019</td>
									<td>010-1577-1577</td>
									<td>자바, C++, 네트워크</td>
								</tr>
	
							</tbody>
						</table>
					</div>
				</div></div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!--  교재 조회 Modal -->
	<div class="modal fade" id="bookModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강의실 조회</h4>
				</div>
				<div class="modal-body" >
					<form action="admin_4_insertForm.jsp" method="post">
				<div class="panel panel-default">
					<div class="panel-body">
					<div class="grade">
						<table class="table"  id="boardTable">
							<thead>
								<tr>
									<th>교재ID</th>
									<th>교재명</th>
									<th>출판사</th>
								</tr>
							</thead>
							
							<tbody>
								<tr class="link">
									<td>bookname001</td>
									<td>이것이자바다</td>
									<td>hanbic</td>
								</tr>
								
								<tr class="link">
									<td>bookname002</td>
									<td>SQL</td>
									<td>hanbic</td>
								</tr>
								
								<tr class="link">
									<td>bookname003</td>
									<td>C++</td>
									<td>생능</td>
								</tr>
				
							</tbody>
						</table>
					</div>
				</div></div>
						
					</form>
				
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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