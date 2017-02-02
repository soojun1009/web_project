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
					<li><a id="logo">성적처리 프로그램(강사)</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/project_20170116/teacher_1.jsp">내정보</a></li>
					<li><a href="/project_20170116/teacher_2.jsp">강의 스케줄</a></li>
					<li><a href="/project_20170116/teacher_3.jsp">배점관리</a></li>
					<li class="active"><a href="/project_20170116/teacher_4.jsp">성적관리</a></li>
					<li><a href="/project_20170116/login.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>

			</div>
		</div>
	</nav>


	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id="content">
				<h1 style="margin-bottom: 20px">성적관리</h1>
				<div class="panel panel-default ss">
					<div class="panel-body">
						<div class="grade">
							<table class="table table-default">
								<thead>

									<tr>
										<th>과목명</th>
										<th>과목시작일</th>
										<th>과목종료일</th>
										<th>과정명</th>
										<th>과목시작일</th>
										<th>과목종료일</th>
										<th>강의실</th>
										<th>출결배점</th>
										<th>필기배점</th>
										<th>실기배점</th>
										<th>성적 등록 여부</th>
										<th>조회</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>데이터베이스</td>
										<td>2016-11-30</td>
										<td>2016-12-31</td>
										<td>빅데이터 응용 SW개발</td>
										<td>2016-11-01</td>
										<td>2016-12-31</td>
										<td>강의실-101</td>
										<td>20</td>
										<td>40</td>
										<td>40</td>
										<td>X</td>
										<td><button type="button" class="btn btn-default btn-xs"
												data-toggle="collapse" data-target="#demo">조회</button></td>
									</tr>

									<tr>
										<td>C++</td>
										<td>2015-10-09</td>
										<td>2015-10-31</td>
										<td>빅데이터 응용 SW개발</td>
										<td>2015-10-09</td>
										<td>2015-12-31</td>
										<td>강의실-201</td>
										<td>20</td>
										<td>40</td>
										<td>40</td>
										<td>O</td>
										<td><button type="button" class="btn btn-default btn-xs"
												data-toggle="collapse" data-target="#demo">조회</button></td>
									</tr>


								</tbody>
							</table>

						</div>
						
							<form method="post" class="form-inline">
								<div class="form-group">
									<button type="button" class="btn btn-default count">
										TotalCount <span class="badge">2</span>
									</button>
								</div>
								<div class="form-group">
									<button type="button" class="btn btn-default count">
										Count <span class="badge">2</span>
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
				<br>
				<br>
				<div id="demo" class="collapse">
					<div class="panel panel-default ss">
						<div class="panel-body">


							<h4 style="margin-bottom: 20px">빅 데이터 응용 SW 개발 (2016-11-01 ~
								2016-12-31)</h4>
								<div class="grade">
							<table class="table table-default">
								<thead>
									<tr>
										<th>수강생 이름</th>
										<th>전화번호</th>
										<th>등록일</th>
										<th>중도탈락날짜</th>
										<th>출결성적</th>
										<th>필기성적</th>
										<th>실기성적</th>
										<th>성적 관리</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>이수준</td>
										<td>010-4734-3319</td>
										<td>2016-11-01</td>
										<td>-</td>
										<td>20</td>
										<td>30</td>
										<td>30</td>
										<td><button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeInsertFormModal"
												disabled>
												등록 <span class="badge"></span>
											</button>
											<button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeUpdateFormModal">
												수정 <span class="badge"></span>
											</button>
											<button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeDeleteFormModal">
												삭제 <span class="badge"></span>
											</button></td>
									</tr>

									<tr>
										<td>이우연</td>
										<td>010-4724-6112</td>
										<td>2016-11-01</td>
										<td>2016-12-01</td>
										<td>X</td>
										<td>X</td>
										<td>X</td>
										<td><button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeInsertFormModal"
												disabled>
												등록 <span class="badge"></span>
											</button>
											<button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeUpdateFormModal"
												disabled>
												수정 <span class="badge"></span>
											</button>
											<button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeDeleteFormModal"
												disabled>
												삭제 <span class="badge"></span>
											</button></td>
									</tr>

									<tr>
										<td>홍길동</td>
										<td>010-1234-1234</td>
										<td>2016-11-01</td>
										<td>-</td>
										<td>X</td>
										<td>X</td>
										<td>X</td>
										<td><button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeInsertFormModal">
												등록 <span class="badge"></span>
											</button>
											<button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeUpdateFormModal"
												disabled>
												수정 <span class="badge"></span>
											</button>
											<button type="button" class="btn btn-default btn-xs"
												data-toggle="modal" data-target="#gradeDeleteFormModal"
												disabled>
												삭제 <span class="badge"></span>
											</button></td>
									</tr>
								</tbody>
							</table>
							</div>
							<form method="post" class="form-inline">

								<div class="form-group">
									<button type="button" class="btn btn-default count">
										Count <span class="badge">3</span>
									</button>
								</div>


							</form>
						</div>

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
			Copyright ⓒ <a href="http://www.sist.co.kr/index.do">쌍용교육센터</a> All
			Rights Reserved.
		</p>


	</footer>
	
	<!-- 성적 등록 모달 -->
	<div id="gradeInsertFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">성적 등록</h4>
				</div>
				<div class="modal-body">

					<form action="teacher_4.jsp" method="post">


						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="name1">이름(readonly):</label> <input type="text"
								class="form-control" id="name" name="name" required readonly
								value="이수준">
						</div>

						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="name1">중도탈락 날짜(readonly):</label> <input type="text"
								class="form-control" id="b" name="b" required readonly value="-">
						</div>
						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="subjectname">과목명:</label> <input type="text"
								class="form-control" id="b" name="b" required readonly
								value="데이터베이스">
						</div>
						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="subjectnameperiod">과목기간:</label> <input type="text"
								class="form-control" id="b" name="b" required readonly
								value="2016-11-30 ~ 2016-12-31">
						</div>
						<div class="form-group">
							<label for="subject1">출결성적 :</label> <input type="number" min="0"
								max="100" class="form-control" id="c" name="c" required>
							<span class="help-block">(배점:20)</span>
						</div>
						<div class="form-group">
							<label for="subject2">필기성적 :</label> <input type="number" min="0"
								max="100" class="form-control" id="d" name="d" required>
							<span class="help-block">(배점:40)</span>
						</div>
						<div class="form-group">
							<label for="subject3">실기성적 :</label> <input type="number" min="0"
								max="100" class="form-control" id="e" name="e" required>
							<span class="help-block">(배점:40)</span>
						</div>
						<button type="submit" class="btn btn-default">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

					</form>

				</div>
				<div class="modal-footer">
					
				</div>
			</div>

		</div>
	</div>
	
	<!-- 성적 수정 모달 -->
	<div id="gradeUpdateFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-fullsize">

			<!-- Modal content-->
			<div class="modal-content modal-fullsize">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">성적 수정</h4>
				</div>
				<div class="modal-body">

					<form action="teacher_4.jsp" method="post">


						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="name1">이름(readonly):</label> <input type="text"
								class="form-control" id="name" name="name" required readonly
								value="이수준">
						</div>

						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="name1">중도탈락 날짜(readonly):</label> <input type="text"
								class="form-control" id="b" name="b" required readonly value="-">
						</div>
						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="subjectname">과목명:</label> <input type="text"
								class="form-control" id="b" name="b" required readonly
								value="데이터베이스">
						</div>
						<div class="form-group">
							<!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
							<label for="subjectnameperiod">과목기간:</label> <input type="text"
								class="form-control" id="b" name="b" required readonly
								value="2016-11-30 ~ 2016-12-31">
						</div>
						<div class="form-group">
							<label for="subject1">출결성적 :</label> <input type="number" min="0"
								max="100" class="form-control" id="c" name="c" required
								value="30"> <span class="help-block">(배점:20)</span>
						</div>
						<div class="form-group">
							<label for="subject2">필기성적 :</label> <input type="number" min="0"
								max="100" class="form-control" id="d" name="d" required
								value="40"> <span class="help-block">(배점:40)</span>
						</div>
						<div class="form-group">
							<label for="subject3">실기성적 :</label> <input type="number" min="0"
								max="100" class="form-control" id="e" name="e" required
								value="40"> <span class="help-block">(배점:40)</span>
						</div>
						<button type="submit" class="btn btn-default">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

					</form>

				</div>
				<div class="modal-footer">
					
				</div>
			</div>

		</div>
	</div>
	<!-- 성적 삭제 모달 -->
	<!-- 학생 삭제 Modal -->
	<div id="gradeDeleteFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog" style="width:500px; height:100%;">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">성적 삭제</h4>
				</div>
				<div class="modal-body">

					<form action="studentdelete.jsp" method="post">

						<%-- hidden form : 화면상에는 보이지 않지만 폼 전송시 사용하기 위해서 준비한 입력 폼 --%>
						<input type="hidden" value="1" name="sid" id="sid4">


						<div class="form-group">수강생 이수준님의 성적을 삭제할까요?</div>

						<!-- 서브밋 버튼 클릭시 hidden form의 데이터(번호)가 서버로 전송된다. -->
						<button type="submit" class="btn btn-default">확인</button>

						<!-- 취소 버튼 클릭시 현재 모달창을 닫는다. -->
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

					</form>

				</div>
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>