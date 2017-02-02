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
<link rel="stylesheet" type="text/css"
	href="/project_20170116/css/myStyle.css">
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
				<a class="navbar-brand"><img
					src="/project_20170116/img/sist_logo.png" alt="logo"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a id="logo">성적처리 프로그램(관리자)</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/project_20170116/admin_1.jsp">기초 정보 관리</a></li>
					<li><a href="/project_20170116/admin_2.jsp">강사 계정 관리</a></li>
					<li><a href="/project_20170116/admin_3.jsp">개설 과정 관리</a></li>
					<li class="active"><a href="/project_20170116/admin_4.jsp">개설
							과목 관리</a></li>
					<li><a href="/project_20170116/admin_5.jsp">수강생 관리</a></li>
					<li><a href="/project_20170116/admin_6.jsp">성적 조회</a></li>
					<li><a href="/project_20170116/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span>Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id="content">

				<h1 style="margin-bottom: 20px">개설과목관리</h1>
				<div class="panel panel-default ss">
					<div class="panel-body">
						<form action="" method="post">
							<div class="scroll">
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
											<th>과목 관리</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td>course001</td>
											<td>빅데이터 응용SW개발</td>
											<td>20161101</td>
											<td>20161131</td>
											<td>강의실101</td>
											<td>2</td>
											<td>30</td>
											<td>3</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="collapse" data-target="#demo">조회</button></td>
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
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="collapse" data-target="#demo">조회</button></td>
										</tr>
										<tr>
											<td>course001</td>
											<td>빅데이터 응용SW개발</td>
											<td>20161101</td>
											<td>20161131</td>
											<td>강의실101</td>
											<td>2</td>
											<td>30</td>
											<td>3</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="collapse" data-target="#demo">조회</button></td>
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
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="collapse" data-target="#demo">조회</button></td>
										</tr>
										<tr>
											<td>course001</td>
											<td>빅데이터 응용SW개발</td>
											<td>20161101</td>
											<td>20161131</td>
											<td>강의실101</td>
											<td>2</td>
											<td>30</td>
											<td>3</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="collapse" data-target="#demo">조회</button></td>
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
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="collapse" data-target="#demo">조회</button></td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>

						<form method="post" class="form-inline">

							<div class="form-group">
								<button type="button" class="btn btn-default  count">
									TotalCount <span class="badge" id="totalCount">2</span>
								</button>
							</div>


							<div class="form-group">

								<button type="button" class="btn btn-default  count">
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
								<input type="text" class="form-control" id="svalue"
									name="svalue">
							</div>

							<button type="submit" class="btn btn-default">
								<span class="glyphicon glyphicon-search"></span> Search
							</button>

						</form>


					</div>
				</div>

				<!--  과목 조회 collapse  -->
				<br> <br>
				<div id="demo" class="collapse">
					<div class="panel panel-default ss">
						<div class="panel-body">
							<h4 style="margin-bottom: 20px">빅 데이터 응용 SW 개발 (2016-11-01 ~
								2016-12-31)</h4>
							<div>
								<table class="table" id="boardTable">
									<thead>
										<tr>
											<th>과목ID</th>
											<th>과목명</th>
											<th>과목 시작일</th>
											<th>과목 종료일</th>
											<th>강사명</th>
											<th>교재명</th>
											<th>수정/삭제</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td>subject001</td>
											<td>자바</td>
											<td>2016-11-01</td>
											<td>2016-11-15</td>
											<td>모모</td>
											<td><a data-toggle="modal" href="#bookModal">이것이자바다</a></td>
											<td>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#courseupdateModal">
													수정</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursedelModal">삭제</button>
											</td>
										</tr>

										<tr>
											<td>subject002</td>
											<td>오라클</td>
											<td>2016-11-16</td>
											<td>2016-11-31</td>
											<td>사나</td>
											<td><a data-toggle="modal" href="#bookModal">SQL</a></td>
											<td>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#courseupdateModal">
													수정</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursedelModal">
													삭제</button>
											</td>
										</tr>

									</tbody>
								</table>
							</div>
							<form action="admin_4_insertForm.jsp" method="post"
								class="form-inline">



								<div class="form-group">
									<button type="submit" class="btn btn-default ">과목등록</button>
									<button type="button" class="btn btn-default count">
										Count <span class="badge">2</span>
									</button>
								</div>

							</form>
						</div>
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


	<!--  삭제 Modal -->
	<div class="modal fade" id="coursedelModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목 삭제</h4>
				</div>
				<div class="modal-body">
					<form action="admin_4.jsp" method="post">

						<input type="hidden" value="1" name="sid" id="sid4">

						<div class="form-group">
							과목ID: subject001<span id="sid3"></span>
						</div>
						<div class="form-group">
							과목명: 자바<span id="name3"></span>
						</div>
						<div class="form-group">현재 선택한 자료를 삭제할까요?</div>
						<br>
						<button type="submit" class="btn btn-default">확인</button>
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
			<div class="modal-content  modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목 수정</h4>
				</div>
				<div class="modal-body">

					<form>
						<div class="form-group">
							<label for="sid2">과정ID</label> <input type="text"
								class="form-control" id="id" name="id" value="course001"
								readonly required>
						</div>
						<div class="form-group">
							<label for="sid2">과정명</label> <input type="text"
								class="form-control" id="id" name="id" value="빅데이터 응용SW개발"
								readonly required>
						</div>
					</form>

					<form class="form-inline">
						<div class="form-group">
							<label for="sid2">과정기간</label> <input type="text"
								class="form-control" id="id" name="id" value="2016-11-01"
								readonly required>
						</div>
						<div class="form-group">
							<label for="sid2">~</label> <input type="text"
								class="form-control" id="id" name="id" value="2016-11-31"
								readonly required>
						</div>
					</form>
					<br>

					<form action="admin_4.jsp" method="post">
						<div class="form-group">
							<label for="sid2">과목명을 선택하세요</label> <a data-toggle="collapse"
								data-parent="#accordion" href="#collapse1"
								class="btn btn-default btn-xs" role="button">과목조회</a> <input
								type="text" class="form-control" id="id" name="id" value="자바"
								readonly required>
						</div>

						<div id="collapse1" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="grade">
									<table class="table" id="boardTable">
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
							</div>
						</div>

						<div class="form-group">
							<label for="sid2">강사명을 선택하세요</label> <a data-toggle="collapse"
								data-parent="#accordion" href="#collapse2"
								class="btn btn-default btn-xs" role="button">강사조회</a> <input
								type="text" class="form-control" id="id" name="id" value="모모"
								readonly required>
						</div>

						<div id="collapse2" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="grade">
									<table class="table" id="boardTable">
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
												<td>teacher001</td>
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
							</div>
						</div>

						<div class="form-group">
							<label for="name2">교재명을 선택하세요</label> <a data-toggle="collapse"
								data-parent="#accordion" href="#collapse3"
								class="btn btn-default btn-xs" role="button">교재조회</a> <input
								type="text" class="form-control" id="name" name="name"
								value="이것이자바다" readonly required>
						</div>

						<div id="collapse3" class="panel-collapse collapse">
							<div class="panel-body">
								<div class="grade">
									<table class="table" id="boardTable">
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
							</div>
						</div>

						<div class="form-group">
							<label for="phone2">과목의 시작일</label> <span
								class="glyphicon glyphicon-calendar"></span> <input type="text"
								class="form-control" id="start" name="start" value="2017-01-01"
								required>

						</div>
						<div class="form-group">
							<label for="phone2">과목의 종료일</label> <span
								class="glyphicon glyphicon-calendar "></span> <input type="text"
								class="form-control" id="end" name="end" value="2017-01-31"
								required>
						</div>

						<button type="submit" class="btn btn-default">확인</button>
						<button type="submit" class="btn btn-default">취소</button>
					</form>


				</div>
				<div class="modal-footer"></div>
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
					<h4 class="modal-title">교재 이미지</h4>
				</div>
				<div class="modal-body">
					<img src="/project_20170116/img/book.png" alt="">
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
			Copyright ⓒ <a href="http://www.sist.co.kr/index.do">쌍용교육센터</a> All
			Rights Reserved.
		</p>

	</footer>
</body>
</html>