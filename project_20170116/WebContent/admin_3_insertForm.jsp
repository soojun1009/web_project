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

			<h1 style="margin-bottom:20px">개설과정관리<small> 과정등록</small></h1> 
			<div class="panel panel-default ss">
				<div class="panel-body">
				
				<form action="admin_3.jsp" method="post">
				
				<div class="form-group">
				<NOBR>	<label for="sid2">등록할 과정명을 선택하세요</label> 
					<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#courseModal">과정조회</button>
					<input type="text" class="form-control" id="id" name="id"  value = "빅데이터 응용SW개발"  readonly required >
				</NOBR></div>
				<div class="form-group">
					<label for="name2">강의실을 선택하세요</label> 
					<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#classModal">강의실조회</button>
					<input type="text" class="form-control" id="name" name="name" value="강의실102" readonly required>
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


	<!--  과정 조회 Modal -->
	<div class="modal fade" id="courseModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과정명 조회</h4>
				</div>
				<div class="modal-body" >
					<form action="admin_3_insertForm.jsp" method="post">
				<div class="panel panel-default">
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
				</div></div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>
	
	
	<!--  강의실 조회 Modal -->
	<div class="modal fade" id="classModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강의실 조회</h4>
				</div>
				<div class="modal-body" >
					<form action="admin_3_insertForm.jsp" method="post">
				<div class="panel panel-default">
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