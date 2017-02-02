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

					<li class="active"><a href="/project_20170116/admin_1.jsp">기초
							정보 관리</a></li>
					<li><a href="/project_20170116/admin_2.jsp">강사 계정 관리</a></li>
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
			<div class="col-sm-9 text-left myDIV" id="content">
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a data-toggle="tab" href="#menu1"
						style="color: black; font-size: medium;">기초 정보 과정</a></li>
					<li><a data-toggle="tab" href="#menu2"
						style="color: black; font-size: medium;">기초 정보 과목</a></li>
					<li><a data-toggle="tab" href="#menu3"
						style="color: black; font-size: medium;">기초 정보 강의실</a></li>
					<li><a data-toggle="tab" href="#menu4"
						style="color: black; font-size: medium;">기초 정보 교재</a></li>
				</ul>

				<div class="tab-content">
					<div id="menu1" class="tab-pane fade in active">

						<h1 style="margin-bottom: 20px">과정 정보 입력</h1>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<p>과정명 :</p>
									<input type="text" class="form-control" id="name" name="name"
										required maxlength="20" placeholder="과정명을 입력하세요" value="">
									<span class="help-block">(max 50)</span>

									
										<button type="submit" class="btn btn-default"
											data-toggle="modal" data-target="#courseRegCheckFormModal">등록</button>
									
								</div>
							</div>
						</div>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<table class="table table-default">
										<thead>
											<tr>
												<th>과정ID</th>
												<th>과정명</th>
												<th>과정 수정/삭제</th>

											</tr>
										</thead>
										<tbody>
											<tr>
												<td>course001</td>
												<td>빅데이터 응용SW개발</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#courseModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#courseDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>course002</td>
												<td>파이썬 응용 SW개발</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
											<tr>
												<td>course003</td>
												<td>자바기반 프레임워크</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
											<tr>
												<td>course004</td>
												<td>스마트웹, 컨텐츠 개발</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
										</tbody>
									</table>
									<form method="post" class="form-inline">
										<div class="form-group">
											<button type="button" class="btn btn-default count ">
												TotalCount <span class="badge">4</span>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>

					</div>
					<div id="menu2" class="tab-pane fade">
						<h1 style="margin-bottom: 20px">과목 정보 입력</h1>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<p>과목명 :</p>
									<input type="text" class="form-control" id="name" name="name"
										required maxlength="20" placeholder="과목명을 입력하세요" value="">
									<span class="help-block">(max 50)</span>
									
										<button type="submit" class="btn btn-default"
											data-toggle="modal" data-target="#subjectRegCheckFormModal">등록</button>
									
								</div>
							</div>
						</div>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<table class="table table-default">
										<thead>
											<tr>
												<th>과목ID</th>
												<th>과목명</th>
												<th>과목 수정/삭제</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>subject001</td>
												<td>자바</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>subject002</td>
												<td>데이터베이스</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>subject003</td>
												<td>파이썬</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>subject004</td>
												<td>C++</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>subject005</td>
												<td>C#</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>subject006</td>
												<td>네트워크</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>subject007</td>
												<td>프레임워크</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#subjectDeleteFormModal">삭제</button>
												</td>
											</tr>

										</tbody>
									</table>
									<form method="post" class="form-inline">
										<div class="form-group">
											<button type="button" class="btn btn-default count">
												TotalCount <span class="badge">7</span>
											</button>
										</div>
									</form>

								</div>
							</div>
						</div>

					</div>
					<div id="menu3" class="tab-pane fade">
						<h1 style="margin-bottom: 20px">강의실 정보 입력</h1>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<p>강의실명 :</p>
									<input type="text" class="form-control" id="name" name="name"
										required maxlength="20" placeholder="강의실명을 입력하세요" value="">
									<span class="help-block">(max 20)</span>
									<p>정원 :</p>
									<input type="text" class="form-control" id="name" name="name"
										required maxlength="20" placeholder="정원을 입력하세요" value="">
									<span class="help-block"></span>
									
										<button type="submit" class="btn btn-default"
											data-toggle="modal" data-target="#classroomRegCheckFormModal">등록</button>
									
								</div>
							</div>
						</div>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<table class="table table-default">
										<thead>
											<tr>
												<th>강의실ID</th>
												<th>강의실명</th>
												<th>정원</th>
												<th>강의실 수정/삭제</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>classroom001</td>
												<td>강의실-101</td>
												<td>15</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal"
														data-target="#classroomModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal"
														data-target="#classroomDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>classroom002</td>
												<td>강의실-102</td>
												<td>15</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
											<tr>
												<td>classroom003</td>
												<td>세미나실</td>
												<td>300</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
										</tbody>
									</table>
									<form method="post" class="form-inline">
										<div class="form-group">
											<button type="button" class="btn btn-default count">
												TotalCount <span class="badge">3</span>
											</button>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div id="menu4" class="tab-pane fade">
						<h1 style="margin-bottom: 20px">교재 정보 입력</h1>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<p>교재명 :</p>
									<input type="text" class="form-control" id="name" name="name"
										required maxlength="20" placeholder="교재명을 입력하세요" value="">
									<span class="help-block">(max 20)</span>
									<p>출판사명 :</p>
									<input type="text" class="form-control" id="name" name="name"
										required maxlength="20" placeholder="출판사명을 입력하세요" value="">
									<span class="help-block">(max 20)</span>
									<div class="form-group">
										<p>사진 업로드(선택 사항)</p>
									</div>
									<div class="form-group">

										<input type="file" class="form-control" id="fileName"
											name="fileName" required="required"> <span
											class="help-block">(only .jpg or .png, 500K byte 이내)</span>
									</div>
									
										<button type="submit" class="btn btn-default"
											data-toggle="modal" data-target="#booknameRegCheckFormModal">등록</button>
									
								</div>
							</div>
						</div>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<table class="table table-default">
										<thead>
											<tr>
												<th>교재ID</th>
												<th>교재명</th>
												<th>출판사명</th>
												<th>교재 수정/삭제</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>bookname001</td>
												<td><a data-toggle="modal"
													data-target="#pictureListModal">이것이 자바다</a></td>

												<td>Hanbit</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#bookModifyFormModal">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#bookDeleteFormModal">삭제</button>
												</td>
											</tr>
											<tr>
												<td>bookname002</td>
												<td><a data-toggle="modal"
													data-target="#pictureListModal">SQL</a></td>
												<td>Hanbit</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
											<tr>
												<td>bookname003</td>
												<td><a data-toggle="modal"
													data-target="#pictureListModal">스마트웹을 만들자</a></td>
												<td>Hanbit</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
											<tr>
												<td>bookname004</td>
												<td><a data-toggle="modal"
													data-target="#pictureListModal">프레임워크</a></td>
												<td>Hanbit</td>
												<td>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">수정</button>
													<button type="button" class="btn btn-default btn-xs"
														data-toggle="modal" data-target="#">삭제</button>
												</td>
											</tr>
										</tbody>
									</table>
									<form method="post" class="form-inline">
										<div class="form-group">
											<button type="button" class="btn btn-default count">
												TotalCount <span class="badge">4</span>
											</button>
										</div>
									</form>
								</div>
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
	<!-- 기초정보관리 - 기초정보과정 - 과정입력확인 모달 -->
	<div id="courseRegCheckFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과정 등록</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과정명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="신규과정" readonly>
						</div>
						<p>위 과정을 등록하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보과정 - 과정수정 모달 -->
	<div id="courseModifyFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과정 수정</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과정ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="course001" readonly>

						</div>
						<div class="form-group">
							<label for="period">과정명</label> <input type="text"
								class="form-control" id="period" name="period"
								placeholder="과정명을 입력하세요" required maxlength="20"
								value="빅데이터 응용SW개발">
						</div>
						<p>위 과정을 수정하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>

				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보과정 - 과정삭제 모달 -->
	<div id="courseDeleteFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과정 삭제</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과정ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="course001" readonly>

						</div>
						<div class="form-group">
							<label for="period">과정명(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								maxlength="20" value="빅데이터 응용SW개발" readonly>

						</div>
						<p>위 과정을 삭제하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
								
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

	<!-- 기초정보관리 - 기초정보과목 - 과목입력확인 모달 -->
	<div id="subjectRegCheckFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목 등록</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과목명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="신규과목" readonly>
						</div>
						<p>위 과목을 등록하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보과목 - 과목수정 모달 -->
	<div id="subjectModifyFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목 수정</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과목ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="subject001" readonly>

						</div>
						<div class="form-group">
							<label for="period">과목명</label> <input type="text"
								class="form-control" id="period" name="period" required
								placeholder="과목명을 입력하세요" maxlength="20" value="자바">

						</div>
						<p>위 과목을 수정하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보과목 - 과목삭제 모달 -->
	<div id="subjectDeleteFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">과목 삭제</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과목ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="subject001" readonly>

						</div>
						<div class="form-group">
							<label for="period">과목명(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								maxlength="20" value="자바" readonly>
						</div>

						<p>위 과목을 삭제하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보강의실 - 강의실입력확인 모달 -->
	<div id="classroomRegCheckFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강의실 등록</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">강의실명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="신규강의실" readonly>
						</div>
						<div class="form-group">
							<label for=attendance_score>정원(readonly)</label> <input
								type="text" class="form-control" id="attendance_score"
								name="attendance_score" placeholder="배점을 입력하세요" required
								maxlength="20" value="15" readonly>
						</div>
						<p>위 강의실을 등록하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						


					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보강의실 - 강의실수정 모달 -->
	<div id="classroomModifyFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강의실 수정</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">강의실ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="classroom001" readonly>

						</div>
						<div class="form-group">
							<label for="period">강의실명</label> <input type="text"
								class="form-control" id="period" name="period" required
								placeholder="강의실명을 입력하세요" maxlength="20" value="강의실-101">

						</div>
						<div class="form-group">
							<label for=attendance_score>정원</label> <input type="text"
								class="form-control" id="attendance_score"
								name="attendance_score" placeholder="정원을 입력하세요" required
								maxlength="20" value="15">
						</div>
						<p>위 강의실을 수정하시겠습니까?</p>

							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>


					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보강의실 - 강의실삭제 모달 -->
	<div id="classroomDeleteFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">강의실 삭제</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">강의실ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="classroom001" readonly>

						</div>
						<div class="form-group">
							<label for="period">강의실명(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								maxlength="20" value="강의실-101" readonly>
						</div>
						<div class="form-group">
							<label for="practice_score">정원(readonly)</label> <input
								type="text" class="form-control" id="practice_score"
								name="practice_score" placeholder="배점을 입력하세요" required
								maxlength="20" value="15" readonly>

						</div>
						<p>위 강의실을 삭제하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						
					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보교재 - 교재입력확인 모달 -->
	<div id="booknameRegCheckFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">교재 등록</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">교재명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="신규교재" readonly> <label for="name">교재출판사명(readonly)</label>
							<input type="text" class="form-control" id="name" name="name"
								required maxlength="20" value="출판사명" readonly>
						</div>
						<p>위 교재을 등록하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


	<!-- 기초정보관리 - 기초정보교재 - 교재수정 모달 -->
	<div id="bookModifyFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">교재 수정</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">교재ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="bookname001" readonly>

						</div>
						<div class="form-group">
							<label for="period">교재명</label> <input type="text"
								class="form-control" id="period" name="period" required
								placeholder="교재명을 입력하세요" maxlength="20" value="이것이 자바다">

						</div>
						<div class="form-group">
							<label for=attendance_score>출판사</label> <input type="text"
								class="form-control" id="attendance_score"
								name="attendance_score" placeholder="출판사를 입력하세요" required
								maxlength="20" value="Hanbit">
						</div>
						<div class="form-group">
							<label for=attendance_score>사진 업로드</label>
						</div>
						<div class="form-group">

							<input type="file" class="form-control" id="fileName"
								name="fileName" required="required"> <span
								class="help-block">(only .jpg or .png, 500K byte 이내)</span>
						</div>
						<p>위 교재를 수정하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- 기초정보관리 - 기초정보교재 - 교재삭제 모달 -->
	<div id="bookDeleteFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">교재 삭제</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">교재ID(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="bookname001" readonly>

						</div>
						<div class="form-group">
							<label for="period">교재명(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								placeholder="교재명을 입력하세요" maxlength="20" value="이것이 자바다" readonly>
						</div>
						<div class="form-group">
							<label for="period">출판사명(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								placeholder="교재명을 입력하세요" maxlength="20" value="hanbit" readonly>
						</div>
						<div class="form-group">
							<label for="period">파일명(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								placeholder="교재명을 입력하세요" maxlength="20" value="bookimg001.png"
								readonly>
						</div>
						<p>위 교재을 삭제하시겠습니까?</p>
						
							<button type="submit" class="btn btn-default" data-toggle="modal"
								data-target="#">확인</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
						

					</form>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

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
							<img src="/project_20170116/img/book.png" alt="bookimn001.png">
						</div>
					</div>
				</div>
				<div class="modal-footer">
					
						<button type="button" class="btn btn-default btn-sm"
							data-dismiss="modal">Close</button>
					
				</div>
			</div>

		</div>
	</div>
</body>
</html>