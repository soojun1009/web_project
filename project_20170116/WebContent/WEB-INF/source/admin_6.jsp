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
					<li><a href="/project_20170116/admin_4.jsp">개설 과목 관리</a></li>
					<li><a href="/project_20170116/admin_5.jsp">수강생 관리</a></li>
					<li class="active"><a href="/project_20170116/admin_6.jsp">성적
							관리</a></li>
					<li><a href="/project_20170116/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container-fluid text-center">

		<div class="row content ">

			<div class="col-sm-1 sidenav "></div>
			<div class="col-sm-9 text-left myDIV" id="content">
				<h1 style="margin-bottom: 20px">성적관리</h1>
				<ul class="nav nav-tabs nav-justified">
					<li class="active"><a data-toggle="tab" href="#menu1"
						style="color: black; font-size: medium;">과정별 성적 조회</a></li>
					<li><a data-toggle="tab" href="#menu2"
						style="color: black; font-size: medium;">수강생별 성적 조회</a></li>

				</ul>

				<div class="tab-content">

					<!-- 과정별 성적 조회 -->
					<div  id="menu1" class="tab-pane fade in active ">
						<div class="panel panel-default ss">
							<div class="panel-body">
								<form action="" method="post">
									<div class="scroll">
										<table class="table table-default">
											<thead>
												<tr>
													<th>과정ID</th>
													<th>과정명</th>
													<th>과정 시작일</th>
													<th>과정 종료일</th>
													<th>강의실</th>
													<th>과목조회</th>
												</tr>
											</thead>

											<tbody>
												<tr>
													<td>course001</td>
													<td>빅 데이터 응용 SW 개발</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>강의실-101</td>
													<!-- <td><a href="#collapse" class="btn btn-default btn-xs" role ="button">조회</a></td> -->
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="collapse" data-target="#demo">조회</button>
													</td>
												</tr>

												<tr>
													<td>course002</td>
													<td>파이톤 응용 SW 개발</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>강의실-101</td>
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="collapse" data-target="#demo">조회</button>
													</td>

												</tr>

												<tr>
													<td>course003</td>
													<td>자바기반 프레임워크</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>강의실-101</td>
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="collapse" data-target="#demo">조회</button>
													</td>

												</tr>

												<tr>
													<td>course004</td>
													<td>빅데이터 응용 SW개발</td>
													<td>2017-01-05</td>
													<td>2016-02-28</td>
													<td>강의실-102</td>
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="collapse" data-target="#demo">조회</button>
													</td>

												</tr>

												<tr>
													<td>course005</td>
													<td>스마트웹,콘텐츠 개발</td>
													<td>2017-01-05</td>
													<td>2016-02-28</td>
													<td>강의실-102</td>
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="collapse" data-target="#demo">조회</button>
													</td>

												</tr>
											</tbody>
										</table>
									</div>
								</form>
							
								<form method="post" class="form-inline">
								
									<div class="form-group">
										<button type="button" class="btn btn-default count">
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
											<option value="name">과정ID</option>
											<option value="phone">과정명</option>
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
						<br> <br>
						<div id="demo" class="collapse">
							<div class="panel panel-default ss">
								<div class="panel-body">

									<h4 style="margin-bottom: 20px">빅 데이터 응용 SW 개발 (2016-11-01
										~ 2016-12-31)</h4>
									<div class="scroll">
										<table class="table table-default">
											<thead>
												<tr>
													<th>과목ID</th>
													<th>과목명</th>
													<th>과목 시작일</th>
													<th>과목 종료일</th>
													<th>강사명</th>
													<th>교재명</th>
													<th>성적 등록 여부</th>
													<th>시험 등록 여부</th>
													<th>성적 조회</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>subject001</td>
													<td>자바</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>모모</td>
													<td>이것이 자바다</td>
													<td>O</td>
													<td><a href="#">test.zip</a></td>
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="modal" data-target="#coursegradeFormModal">조회</button>
													</td>
												</tr>
												<tr>
													<td>subject003</td>
													<td>자바</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>모모</td>
													<td>이것이 자바다</td>
													<td>O</td>
													<td><a href="#">test.zip</a></td>
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="modal" data-target="#coursegradeFormModal">조회</button>
													</td>
												</tr>
												<tr>
													<td>subject005</td>
													<td>자바</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>모모</td>
													<td>이것이 자바다</td>
													<td>O</td>
													<td><a href="#">test.zip</a></td>
													<td>
														<button type="button" class="btn btn-default btn-xs"
															data-toggle="modal" data-target="#coursegradeFormModal">조회</button>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- 수강생 별 성적 조회 -->
					<div id="menu2" class="tab-pane fade">

						<div class="panel panel-default ss">

							<div class="panel-body">
								<form action="" method="post">
									<div class="scroll">
										<table class="table table-default">
											<thead>
												<tr>
													<th>수강생ID</th>
													<th>이름</th>
													<th>주민번호</th>
													<th>전화번호</th>
													<th>과정 조회</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>student001</td>
													<td>이수준</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<!-- <td><button type="button" class="btn btn-default btn-xs"
										data-toggle="modal" data-target="#studentgradeviewFormModal" >조회</button></td>
									 -->
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>

												</tr>
												<tr>
													<td>student001</td>
													<td>이수준</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<!-- <td><button type="button" class="btn btn-default btn-xs"
										data-toggle="modal" data-target="#studentgradeviewFormModal" >조회</button></td>
									 -->
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>

												</tr>
												<tr>
													<td>student001</td>
													<td>이수준</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<!-- <td><button type="button" class="btn btn-default btn-xs"
										data-toggle="modal" data-target="#studentgradeviewFormModal" >조회</button></td>
									 -->
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>

												</tr>
												<tr>
													<td>student001</td>
													<td>이수준</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<!-- <td><button type="button" class="btn btn-default btn-xs"
										data-toggle="modal" data-target="#studentgradeviewFormModal" >조회</button></td>
									 -->
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>

												</tr>
												<tr>
													<td>student001</td>
													<td>이수준</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<!-- <td><button type="button" class="btn btn-default btn-xs"
										data-toggle="modal" data-target="#studentgradeviewFormModal" >조회</button></td>
									 -->
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>

												</tr>
												<tr>
													<td>student001</td>
													<td>이수준</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<!-- <td><button type="button" class="btn btn-default btn-xs"
										data-toggle="modal" data-target="#studentgradeviewFormModal" >조회</button></td>
									 -->
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>

												</tr>
												<tr>
													<td>student002</td>
													<td>송재용</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<!-- <td><button type="button"
										class="btn btn-default btn-xs" data-toggle="modal"
										data-target="#studentgradeviewFormModal">조회</button></td> -->
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>

												</tr>

												<tr>
													<td>student003</td>
													<td>최병용</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>
												</tr>
												<tr>
													<td>student004</td>
													<td>이우연</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>
												</tr>
												<tr>
													<td>student005</td>
													<td>오진희</td>
													<td>2015464</td>
													<td>010-1234-1234</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="collapse"
															data-target="#demo1">조회</button></td>
												</tr>
											</tbody>

										</table>
									</div>
								</form>
								<form method="post" class="form-inline">
									<div class="form-group">
										<button type="button" class="btn btn-default count ">
											TotalCount <span class="badge">5</span>
										</button>
									</div>
									<div class="form-group">
										<button type="button" class="btn btn-default count ">
											Count <span class="badge">5</span>
										</button>
									</div>


									<div class="form-group">
										<%--name, phone, email 단일 선택하는 폼(select 태그) --%>
										<select class="form-control" name="skey" id="skey">
											<option value="all">전체</option>
											<option value="name">이름</option>
											<option value="phone">전화번호</option>
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
						<br> <br>

						<!-- 수강생 별->collapse 과정 조회 -->
						<div id="demo1" class="collapse">
							<div class="panel panel-default ss">
								<div class="panel-body">
									<h4 style="margin-bottom: 20px">
										이수준 수강생님 <small> 과정별 조회 </small>
									</h4>
									<div class="scroll">
										<table class="table table-default">
											<thead>
												<tr>
													<th>과정ID</th>
													<th>과정명</th>
													<th>과정 시작일</th>
													<th>과정 종료일</th>
													<th>강의실</th>
													<th>과목조회</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>course001</td>
													<td>빅 데이터 응용 SW 개발</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>강의실-101</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="modal"
															data-target="#studentgradeviewFormModal">조회</button></td>
												</tr>

												<tr>
													<td>course002</td>
													<td>파이톤 응용 SW 개발</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>강의실-101</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="modal"
															data-target="#studentgradeviewFormModal">조회</button></td>

												</tr>

												<tr>
													<td>course003</td>
													<td>자바기반 프레임워크</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>강의실-101</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="modal"
															data-target="#studentgradeviewFormModal">조회</button></td>

												</tr>

												<tr>
													<td>course004</td>
													<td>빅데이터 응용 SW개발</td>
													<td>2017-01-05</td>
													<td>2016-02-28</td>
													<td>강의실-102</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="modal"
															data-target="#studentgradeviewFormModal">조회</button></td>

												</tr>

												<tr>
													<td>course005</td>
													<td>스마트웹,콘텐츠 개발</td>
													<td>2017-01-05</td>
													<td>2016-02-28</td>
													<td>강의실-102</td>
													<td><button type="button"
															class="btn btn-default btn-xs" data-toggle="modal"
															data-target="#studentgradeviewFormModal">조회</button></td>

												</tr>
											</tbody>
										</table>
									</div>
									<form method="post" class="form-inline">

										<div class="form-group">
											<button type="button" class="btn btn-default count">
												Count <span class="badge">5</span>
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

	<!-- 과정별-과목별 성적 조회 모달 -->
	<div id="coursegradeFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">빅 데이터 응용 SW 개발(2016-11-01 ~
						2016-12-31)</h4>

				</div>

				<div class="modal-body">
					<form action="#" method="post">
						<h4 style="margin-bottom: 20px">자바 (2016-11-01 ~ 2016-11-31)</h4>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<div class="scroll">
										<table class="table table-default">
											<thead>
												<tr>
													<th>이름</th>
													<th>주민번호</th>
													<th>출석 <span style="color: grey">(배점:40)</span></th>
													<th>필기<span style="color: grey">(배점:40)</span></th>
													<th>실기<span style="color: grey">(배점:40)</span></th>

												</tr>
											</thead>
											<tbody>
												<tr>
													<td>이수준</td>
													<td>214578</td>
													<td>30</td>
													<td>30</td>
													<td>40</td>


												</tr>

												<tr>
													<td>이우연</td>
													<td>214578</td>
													<td>10</td>
													<td>40</td>
													<td>40</td>


												</tr>

												<tr>
													<td>송재용</td>
													<td>214578</td>
													<td>30</td>
													<td>20</td>
													<td>30</td>


												</tr>
												<tr>
													<td>오진희</td>
													<td>214578</td>
													<td>20</td>
													<td>40</td>
													<td>20</td>


												</tr>
												<tr>
													<td>최병용</td>
													<td>214578</td>
													<td>15</td>
													<td>20</td>
													<td>40</td>


												</tr>
											</tbody>
										</table>
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

	<!-- 수강생별 성적조회 모달 -->
	<div id="studentgradeviewFormModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 style="margin-bottom: 20px">이수준 수강생님</h4>
				</div>

				<div class="modal-body">
					<form action="#" method="post">
						<h4 style="margin-bottom: 20px">빅 데이터 응용 SW 개발(2016-11-01 ~
							2016-12-31)</h4>
						<div class="panel panel-default ss">
							<div class="grade">
								<div class="panel-body">
									<div class="scroll">
										<table class="table table-default">
											<thead>
												<tr>
													<th>과목명</th>
													<th>과목 시작일</th>
													<th>과목 종료일</th>
													<th>강사명</th>
													<th>출석 배점</th>
													<th>필기 배점</th>
													<th>실기 배점</th>
													<th>출석</th>
													<th>필기</th>
													<th>실기</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>프레임워크</td>
													<td>2016-11-01</td>
													<td>2016-11-30</td>
													<td>쯔위</td>
													<td>20</td>
													<td>40</td>
													<td>40</td>
													<td>16</td>
													<td>34</td>
													<td>36</td>

												</tr>

												<tr>
													<td>네트워크</td>
													<td>2016-11-01</td>
													<td>2016-12-31</td>
													<td>사나</td>
													<td>20</td>
													<td>40</td>
													<td>40</td>
													<td>16</td>
													<td>34</td>
													<td>36</td>

												</tr>

												<tr>
													<td>자바</td>
													<td>2016-11-01</td>
													<td>2016-11-30</td>
													<td>쯔위</td>
													<td>20</td>
													<td>40</td>
													<td>40</td>
													<td>16</td>
													<td>34</td>
													<td>36</td>

												</tr>
												<tr>
													<td>자바</td>
													<td>2016-11-01</td>
													<td>2016-11-30</td>
													<td>쯔위</td>
													<td>20</td>
													<td>40</td>
													<td>40</td>
													<td>16</td>
													<td>34</td>
													<td>36</td>

												</tr>
											</tbody>
										</table>
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

</body>
</html>