<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Grade Program</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="/project_20170116/css/myStyle.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>

<script>
	$(document).ready(function() {
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
					scrollTop : $(hash).offset().top
				}, 900, function() {

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
					<li><a id="logo">성적처리 프로그램(강사)</a></li>
				</ul>
					<ul class="nav navbar-nav navbar-right">
					<li><a href="/project_20170116/teacher_1.jsp">내정보</a></li>
					<li class="active"><a href="/project_20170116/teacher_2.jsp">강의 스케줄</a></li>
					<li><a href="/project_20170116/teacher_3.jsp">배점관리</a></li>
					<li><a href="/project_20170116/teacher_4.jsp">성적관리</a></li>


					<li><a href="/project_20170116/login.jsp"><span class="glyphicon glyphicon-log-out"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center ">
		<div class="row content">
			<div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id ="content">
				<h1 style="margin-bottom: 20px">강의 스케줄<small> 강의중</small></h1>
				
				<div class="panel panel-default">
					<div class="panel-body">
						<div>
							<div class="grade">
								<table class="table table-default">
									<thead>
										<tr>
											<th>과정명</th>
											<th>과정시작일</th>
											<th>과정종료일</th>
											<th>강의실</th>
											<th>과목명</th>
											<th>과목시작일</th>
											<th>과목종료일</th>
											<th>교재명</th>
											<th>수강생등록인원</th>
											<th>강의상태</th>

										</tr>
									</thead>
									<tbody>

										<tr>
											<td>빅데이터 응용SW개발</td>
											<td>2016-11-01</td>
											<td>2016-12-31</td>
											<td>강의실-101</td>
											<td>자바</td>
											<td>2016-11-01</td>
											<td>2016-11-30</td>
											<td><a data-toggle="modal" data-target="#pictureListModal">이것이 자바다</a></td>
											<td>12</td>
											<td>종료</td>
										</tr>
										<tr>
											<td>스마트웹, 콘텐츠 개발</td>
											<td>2016-11-01</td>
											<td>2017-03-28</td>
											<td>강의실-301</td>
											<td>자바</td>
											<td>2017-01-02</td>
											<td>2017-03-28</td>
											<td><a data-toggle="modal" data-target="#pictureListModal">이것이 자바다</a></td>
											<td>10</td>
											<td>강의중</td>
										</tr>
										<tr>
											<td>자바기반 프레임워크</td>
											<td>2017-03-05</td>
											<td>2017-05-30</td>
											<td>강의실-101</td>
											<td>C++</td>
											<td>2017-03-05</td>
											<td>2017-04-30</td>
											<td><a data-toggle="modal" data-target="#pictureListModal">쉬운 C++</a></td>
											<td>5</td>
											<td>강의 예정</td>
										</tr>

									</tbody>

								</table>
							</div>
						</div>
						<form method="post" class="form-inline">
							<div class="form-group">
								<button type="button" class="btn btn-default count ">
									TotalCount <span class="badge">5</span>
								</button>
							</div>
							<div class="form-group">
								<button type="button" class="btn btn-default count">
									Count <span class="badge">5</span>
								</button>
							</div>
							<div class="form-group">
								<%--name, phone, email 단일 선택하는 폼(select 태그) --%>
								<select class="form-control" name="skey" id="skey">
									<option value="all">전체</option>
									<option value="sid">강의중</option>
									<option value="name">강의종료</option>
									<option value="name">강의예정</option>

								</select>
							</div>
							<div class="form-group">
								<%-- required 속성은 지정하면 전체 검색이 되지 않으므로 검색 기능에서는 required 속성은 생략해야 한다.
					Insert 할때는 들어가야한다. --%>
								<input type="text" class="form-control" id="svalue"
									name="svalue">
							</div>
							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span> Search
							</button>



						</form>
					</div>

				</div>
			</div>
			<div class="col-sm-2 sidenav">
				<div class="well">

					<p>강사 OOO님,</p>
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
	
	<!-- 기초정보관리 - 기초정보교재 - 교재이미지 조회모달 -->
	<div id="pictureListModal" class="modal fade" role="dialog">
		<!-- 모달 창의 크기 조절을 원하면 class="modal-lg" 속성 추가. 기본값은 중간 크기입니다. -->
		<div class="modal-dialog ">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">교재 이미지</h4>
				</div>
				<div class="modal-body">
					<div id="myCarousel" class="img-thumbnail">
						<div class="item active">
							<img src="/project_20170116/img/book.png"
								alt="bookimn001.png">
						</div>
					</div>
				</div>
				<div class="modal-footer">
				<div style="text-align:right">
					<button type="button" class="btn btn-default btn-sm"
						data-dismiss="modal">Close</button>
						</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>