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
					<li class="active"><a href="/project_20170116/teacher_3.jsp">배점관리</a></li>
					<li><a href="/project_20170116/teacher_4.jsp">성적관리</a></li>


					<li><a href="/project_20170116/login.jsp"><span class="glyphicon glyphicon-log-out"></span>
							Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

					

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id="content">
				<h1 style="margin-bottom: 20px">배점관리</h1>
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
											<th>과정시작일</th>
											<th>과정종료일</th>
											<th>출석배점</th>
											<th>필기배점</th>
											<th>실기배점</th>
											<th>시험날짜</th>
											<th>시험등록여부</th>
											<th>시험 등록/수정</th>
											<th>배점 등록/수정</th>

										</tr>
									</thead>
									<tbody>
										<tr>
											<td>자바</td>
											<td>2016-11-01</td>
											<td>2016-11-30</td>
											<td>빅데이터</td>
											<td>2016-11-01</td>
											<td>2016-12-31</td>
											<td>20</td>
											<td>40</td>
											<td>40</td>
											<td>2016-11-30</td>
											<td><a href ="#">test.zip</a></td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#" disabled>등록</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#workbookUpdateFormModal">수정</button></td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#" disabled>등록</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#scoreUpdateFormModal">수정</button>
										</tr>
										<tr>
											<td>파이썬</td>
											<td>2016-12-01</td>
											<td>2016-12-12</td>
											<td>자바기반 프레임워크</td>
											<td>2016-12-12</td>
											<td>2016-12-15</td>
											<td>X</td>
											<td>X</td>
											<td>X</td>
											<td>-</td>
											<td>X</td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#workbookInsertFormModal">등록</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#" disabled>수정</button></td>
											<td><button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#scoreInsertFormModal">등록</button>
												<button type="button" class="btn btn-default btn-xs"
													data-toggle="modal" data-target="#" disabled>수정</button></td>
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

	<!-- 배점관리 - 배점입력 모달 -->
	<div id="scoreInsertFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">배점 등록</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과목명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="파이썬" readonly>

						</div>
						<div class="form-group">
							<label for="period">과목기간(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								maxlength="20" value="2016-12-12 ~ 2016-12-15" readonly>

						</div>
						<hr>
						<div class="form-group">
							<label for="info">※ 출석/필기/실기 배점 총합은 100점 입니다.</label> 
						</div>
						<div class="form-group">
							<label for=attendance_score>출석배점</label> <input type="text"
								class="form-control" id="attendance_score"
								name="attendance_score" required
								maxlength="20" value=""> <span class="help-block">(min
								20)</span>
						</div>
						
						<div class="form-group">
							<label for="writing_score">필기배점</label> <input type="text"
								class="form-control" id="writing_score" name="writing_score"
								 required maxlength="20" value="">							
						</div>
						<div class="form-group">
							<label for="practice_score">실기배점</label> <input type="text"
								class="form-control" id="practice_score" name="practice_score"
								required maxlength="20" value="">
						</div>
						
						<button type="submit" class="btn btn-default" data-toggle="modal"
							data-target="#studentInsertFormComfirmModal">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

					</form>
				</div>
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div>

	<!-- 배점관리 - 배점수정 모달 -->
	<div id="scoreUpdateFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">배점 수정</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">

						<div class="form-group">
							<label for="name">과목명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="자바" readonly>

						</div>
						<div class="form-group">
							<label for="period">과목기간(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								maxlength="20" value="2016-11-01 ~ 2016-11-30" readonly>

						</div>
						<hr>
						<div class="form-group">
							<label for="info">※ 출석/필기/실기 배점 총합은 100점 입니다.</label> 
						</div>
						<div class="form-group">
							<label for=attendance_score>출석배점</label> <input type="text"
								class="form-control" id="attendance_score"
								name="attendance_score" placeholder="배점을 입력하세요" required
								maxlength="20" value="20"> <span class="help-block">(min
								20)</span>
						</div>
						<div class="form-group">
							<label for="writing_score">필기배점</label> <input type="text"
								class="form-control" id="writing_score" name="writing_score"
								placeholder="배점을 입력하세요" required maxlength="20" value="40">
							
						</div>
						<div class="form-group">
							<label for="practice_score">실기배점</label> <input type="text"
								class="form-control" id="practice_score" name="practice_score"
								placeholder="배점을 입력하세요" required maxlength="20" value="40">
							
						</div>
						<button type="submit" class="btn btn-default" data-toggle="modal"
							data-target="#studentInsertFormComfirmModal">확인</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

					</form>
				</div>
				<div class="modal-footer">
					
				</div>
			</div>
		</div>
	</div>

	<!-- 배점관리 - 시험문제등록 모달 -->
	<div id="workbookInsertFormModal" class="modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content modal-default">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">시험문제등록</h4>
				</div>

				<div class="modal-body">
					<form action="#" role="form" enctype="multipart/form-data"
						method="post" action="receive.jsp">
						<div class="form-group">
							<label for="name">과목명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="파이썬" readonly>

						</div>
						<div class="form-group">
							<label for="period">과목기간(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								maxlength="20" value="2016-12-12 ~ 2016-12-15" readonly>

						</div>
						<div class="form-group">
							<!-- <input>태그에서 type="file" 속성 지정 필요 -->
							<label for="fileName">시험문제등록 (only .zip, 10 mb 이내)</label> <input
								type="file" class="form-control" id="fileName" name="fileName">
						</div>
						<div class="form-group">
							<label for="exam_date" style="margin-right: 2px">시험날짜 </label><span
								class="glyphicon glyphicon-calendar"></span> <input type="text"
								class="form-control" id="exam_date" name="exam_date"
								placeholder="시험날짜을 입력하세요" required maxlength="20" value="">


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

	<!-- 배점관리 - 시험문제수정 모달 -->
	<div id="workbookUpdateFormModal" class="modal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content modal-default">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">시험문제수정</h4>
				</div>

				<div class="modal-body">
					<form action="#" role="form" enctype="multipart/form-data"
						method="post" action="receive.jsp">
						<div class="form-group">
							<label for="name">과목명(readonly)</label> <input type="text"
								class="form-control" id="name" name="name" required
								maxlength="20" value="자바" readonly>

						</div>
						<div class="form-group">
							<label for="period">과목기간(readonly)</label> <input type="text"
								class="form-control" id="period" name="period" required
								maxlength="20" value="2016-11-01 ~ 2016-11-30" readonly>

						</div>
						<div class="form-group">
							<!-- <input>태그에서 type="file" 속성 지정 필요 -->
							<label for="fileName">시험문제등록 (only .zip, 10 mb 이내)</label> <input
								type="file" class="form-control" id="fileName" name="fileName">
						</div>
						<div class="form-group">
							<label for="exam_date" style="margin-right: 2px">시험날짜 </label><span
								class="glyphicon glyphicon-calendar"></span> <input type="text"
								class="form-control" id="exam_date" name="exam_date"
								placeholder="시험날짜을 입력하세요" required maxlength="20" value="">


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
</body>
</html>