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
					<li class="active"><a href="/project_20170116/admin_2.jsp">강사
							계정 관리</a></li>
					<li><a href="/project_20170116/admin_3.jsp">개설 과정 관리</a></li>
					<li><a href="/project_20170116/admin_4.jsp">개설 과목 관리</a></li>
					<li><a href="/project_20170116/admin_5.jsp">수강생 관리</a></li>
					<li><a href="/project_20170116/admin_6.jsp">성적 조회</a></li>
					<li><a href="/project_20170116/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id="content">

				<h1 style="margin-bottom: 20px">강사계정관리</h1>
				<div class="panel panel-default ss">
					<div class="panel-body">
						<form action="" method="post">
							<div class="scroll">
								<table class="table" id="boardTable">
									<thead>
										<tr>
											<th>강사ID</th>
											<th>강사명</th>
											<th>주민번호</th>
											<th>전화번호</th>
											<th>강의가능과목</th>
											<th>강사 조회/삭제</th>
										</tr>
									</thead>

									<tbody>
										<tr>
											<td>teacher001</td>
											<td>모모</td>
											<td>2121212</td>
											<td>010-1566-0924</td>
											<td>자바, 데이터베이스, 파이썬</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursesubModal">조회</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursestuModal">수정</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursedelModal">삭제</button>
											</td>
										</tr>

										<tr>
											<td>teacher002</td>
											<td>사나</td>
											<td>2112011</td>
											<td>010-1588-5588</td>
											<td>C++, C#, 네트워크</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursesubModal">조회</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursestuModal">수정</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursedelModal">삭제</button>
											</td>
										</tr>

										<tr>
											<td>teacher003</td>
											<td>쯔위</td>
											<td>2012012</td>
											<td>010-1577-1577</td>
											<td>자바, 데이터베이스, 파이썬</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursesubModal">조회</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursestuModal">수정</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursedelModal">삭제</button>
											</td>
										</tr>

										<tr>
											<td>teacher004</td>
											<td>나현</td>
											<td>2784568</td>
											<td>010-4567-8945</td>
											<td>자바, 데이터베이스, 파이썬</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursesubModal">조회</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursestuModal">수정</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#coursedelModal">삭제</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</form>

						<form method="post" class="form-inline">
							<div class="form-group">
								<a href="admin_2_insert.jsp">
									<button type="button" class="btn btn-default">강사등록</button>
								</a>
							</div>
							<div class="form-group">
								<button style="width: 100%; margin: auto" type="button"
									class="btn btn-default count">
									TotalCount <span class="badge" id="totalCount">4</span>
								</button>
							</div>


							<div class="form-group">

								<button type="button" class="btn btn-default count">
									Count <span class="badge" id="count">4</span>
								</button>
							</div>

							<div class="form-group">
								<select class="form-control" name="skey" id="skey">
									<option value="all">전체</option>
									<option value="name">강사명</option>
									<option value="tid">강사ID</option>
									<option value="phone">전화번호</option>
									<option value="availablesub">강의가능과목</option>
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
			</div>
		</div>
	</div>

	<div class="col-sm-2 sidenav">
		<div class="well">

			<p>관리자 admin님,</p>
			<p>환영합니다!</p>
		</div>
	</div>



	<!-- 강의상태 조회 Modal -->
	<div class="modal fade" id="coursesubModal" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강의 상태 조회</h4>
				</div>
				<div class="modal-body">
					<p>
					<form action="" method="post">


						<h4 style="margin-bottom: 20px">모모 강사님</h4>

						<div class="panel panel-default">
							<div class="panel-body">
								<div class="grade">
									<table class="table" id="boardTable">
										<thead>
											<tr>
												<th>개설 과목명</th>
												<th>과목시작일</th>
												<th>과목종료일</th>
												<th>과정명</th>
												<th>과정시작일</th>
												<th>과정종료일</th>
												<th>교재명</th>
												<th>강의실</th>
												<th>강의진행여부</th>
											</tr>
										</thead>

										<tbody>
											<tr>
												<td>자바</td>
												<td>20151101</td>
												<td>20151130</td>
												<td>빅데이터 응용 SW 개발</td>
												<td>20151101</td>
												<td>20151231</td>
												<td>이것이자바다</td>
												<td>101</td>
												<td>강의종료</td>
											</tr>

											<tr>
												<td>데이터베이스</td>
												<td>20151201</td>
												<td>20151231</td>
												<td>빅데이터 응용 SW 개발</td>
												<td>20151101</td>
												<td>20151231</td>
												<td>SQL</td>
												<td>101</td>
												<td>강의종료</td>
											</tr>

											<tr>
												<td>파이썬</td>
												<td>20161101</td>
												<td>20161130</td>
												<td>빅데이터 응용 SW 개발</td>
												<td>20161101</td>
												<td>20161231</td>
												<td>이것이자바다</td>
												<td>101</td>
												<td>강의중</td>
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

	<!--  강사 수정 Modal -->
	<div class="modal fade" id="coursestuModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강사 수정</h4>
				</div>
				<div class="modal-body">
					<p>
					<form method="post">
						<div class="form-group">


							<!-- <h4 style="margin-bottom:20px">빅데이터 응용SW개발(20161101~20161131)</h4> -->

							<label for="sid">강사ID(readonly):</label> <input type="text"
								class="form-control" id="sid2" name="name" required
								value="teacher001" readonly>

						</div>
						<div class="form-group">
							<label for="name">이름(readonly):</label> <input type="text"
								class="form-control" id="name2" name="phone" required value="모모"
								readonly>

						</div>
						<div class="form-group">
							<label for="subject1">주민번호(readonly):</label> <input type="text"
								class="form-control" id="subjectup_1" name="phone" required
								value="2121212" readonly>

						</div>
						<div class="form-group">
							<label for="subject2">전화번호:</label> <input type="text"
								class="form-control" id="subjectup_2" name="phone" required
								value="010-1566-0924">

						</div>
						<div class="form-group">
							<label for="subject3">강의가능과목 :<a data-toggle="collapse"
								data-parent="#accordion" href="#collapse2"
								class="btn btn-default btn-xs" role="button"> 선택</a></label>




							<div id="collapse2" class="panel-collapse collapse">
								<div class="panel-body">
									<div class="grade">
										<table class="table" id="boardTable">
											<thead>
												<tr>
													<th>과목ID</th>
													<th>과목명</th>
													<th>선택</th>
												</tr>
											</thead>

											<tbody>
												<tr>
													<td>subjectname001</td>
													<td>자바</td>
													<td><input type="checkbox" name="check_btn" value=""><br></td>
												</tr>

												<tr>
													<td>subjectname002</td>
													<td>오라클</td>
													<td><input type="checkbox" name="check_btn" value=""><br></td>
												</tr>
												<tr>
													<td>subjectname003</td>
													<td>데이터베이스</td>
													<td><input type="checkbox" name="check_btn" value=""><br></td>

												</tr>
												<tr>
													<td>subjectname004</td>
													<td>네트워크</td>
													<td><input type="checkbox" name="check_btn" value=""><br></td>

												</tr>


											</tbody>
										</table>
										<input type="text" class="form-control" id="subjectup_3"
											name="phone" required value="자바, 데이터베이스, 파이썬" readonly>
									</div>
								</div>
							</div>
						</div>
						<button type="submit" class="btn btn-default">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

					</form>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>



	<!--  삭제 Modal -->
	<div class="modal fade" id="coursedelModal" role="dialog">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강사 삭제</h4>
				</div>
				<div class="modal-body">
					<form action="admin_2.jsp" method="post">

						<input type="hidden" value="1" name="sid" id="sid4">

						<div class="form-group">
							강사ID: teacher001<span id="sid3"></span>
						</div>
						<div class="form-group">
							이름: 모모<span id="name3"></span>
						</div>
						<div class="form-group">현재 선택한 자료를 삭제할까요?</div>

						<button type="submit" class="btn btn-default">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

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
			Copyright ⓒ <a href="http://www.sist.co.kr/index.do">쌍용교육센터</a> All
			Rights Reserved.
		</p>


	</footer>
</body>
</html>