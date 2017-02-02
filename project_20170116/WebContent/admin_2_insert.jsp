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
					<li><a id="logo">성적처리 프로그램(관리자)</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/project_20170116/admin_1.jsp">기초 정보 관리</a></li>
					<li class="active"><a href="/project_20170116/admin_2.jsp">강사 계정 관리</a></li>
					<li ><a href="/project_20170116/admin_3.jsp">개설 과정 관리</a></li>
					<li><a href="/project_20170116/admin_4.jsp">개설 과목 관리</a></li>
					<li><a href="/project_20170116/admin_5.jsp">수강생 관리</a></li>
					<li><a href="/project_20170116/admin_6.jsp">성적 조회</a></li>
					<li><a href="/project_20170116/logout.jsp"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container-fluid text-center">
		<div class="row content">
			<div class="col-sm-1 sidenav"></div>
			<div class="col-sm-9 text-left" id="content">

				<h1 style="margin-bottom:20px">강사계정관리<small> 강사등록</small></h1> 
				<div class="panel panel-default ss">
					<div class="panel-body">
						<%--action="요청주소" method="post" JSP 프로그램 진행시 필수 속성 --%>
						<form action="admin_2.jsp" method="post">

							<div class="form-group">
								<%--
					 name="" 속성은 JSP 프로그램 진행시 필수 속성
					 식별자는 자료형 클래스의 멤버명으로 작성 할 것
					  --%>
								<label for="name">강사명:</label> <input type="text"
									class="form-control" id="name" name="name" required
									maxlength="20"> <span class="help-block">(max
									20)</span>
							</div>
							<div class="form-group">
								<label for="phone">주민번호 뒷자리:</label> <input type="text"
									class="form-control" id="phone" name="phone" required
									maxlength="7"> <span class="help-block">(max 7)</span>
							</div>
							<div class="form-group">
								<label for="phone">전화번호:</label> <input type="text"
									class="form-control" id="phone" name="phone" required
									maxlength="20"> <span class="help-block">(max
									20)</span>
							</div>
							<div class="form-group">
								<label for="phone">강의가능과목 : <button type="button"
										class="btn btn-default btn-xs" data-toggle="modal"
										data-target="#coursesubModal">조회</button></label> <input
									type="text" class="form-control" id="phone" name="phone"
									required readonly>

							</div>

							<%--
					submit 버튼은 JSP 프로그램 진행시 필수 요소이다.
					 폼태그 범위 안에 있어야한다.
					 type은 button이 아닌 submit이다
					 --%>
							<button type="submit" class="btn btn-default">확인</button>
							<a href="/project_20170116/admin_2.jsp" type="button" class="btn btn-default">취소</a>
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
	
	<div id="studentwrite" class="modal fade" role="dialog">
      <div class="modal-dialog">

         <!--수강생 입력 Modal-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">수강생 과정 등록</h4>
            </div>
            <div class="panel panel-default ">
               <div class="grade">
                  <div class="panel-body">
                     <table class="table table-default">
                        <thead>

                           <tr>
                              <th>No.</th>
                              <th>과정명</th>
                              <th>과정 시작일</th>
                              <th>과정 종료일</th>
                              <th>강의실</th>
                              <th>정원</th>
                              <th>등록 인원</th>
                              <th>선택</th>
                           </tr>
                        </thead>

                        <tbody>
                        <tr>
                           <td>1</td>
                           <td>빅데이터 응용 SW 개발</td>
                           <td>2016-11-01</td>
                           <td>2016-12-31</td>
                           <td>강의실-101</td>
                           <td>15</td>
                           <td></td>
                           <td><a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="btn btn-default btn-xs" role ="button"> 선택</a></td>
                        </tr>
                        
                        <tr>
                           <td>2</td>
                           <td>빅데이터 응용 SW 개발</td>
                           <td>2015-11-01</td>
                           <td>2015-12-31</td>
                           <td>강의실-201</td>
                           <td>15</td>
                           <td></td>
                           <td><a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="btn btn-default btn-xs" role ="button"> 선택</a></td>
                        </tr>
                        
                         <tr>
                           <td>3</td>
                           <td>파이톤 SW 개발</td>
                           <td>2016-11-01</td>
                           <td>2016-12-31</td>
                           <td>강의실-101</td>
                           <td>15</td>
                           <td></td>
                           <td><a data-toggle="collapse" data-parent="#accordion" href="#collapse2" class="btn btn-default btn-xs" role ="button"> 선택</a></td>
                        </tr>
   
                     </tbody>
                  </table>
                  
                  <div id="collapse2" class="panel-collapse collapse">
                    <div class="panel-body">
                    현재 선택한 과정으로 등록하시겠습니까?<br>
                    과정명: 빅데이터 응용 SW 개발  <br>
                    과정시작일: 2016-11-01 <br>
                    과정종료일: 2016-12-31 <br>
                    강의실: 강의실-101 <br>
                    정원: 15 <br>
                    <a href="adminSubject.jsp" class="btn btn-default btn-xs" role ="button">확인</a>
                  <a href="adminSubject.jsp" class="btn btn-default btn-xs" role ="button">취소</a>
                    </div>
                     </div>
                  </div>
               </div>
            </div>
         
            <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
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
				<div class="modal-body">
					<p>
					<form action="" method="post">


						<h4 style="margin-bottom: 20px"></h4>

						<div class="panel panel-default">
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
								</div>
							</div>
						</div>
						<button type="submit" class="btn btn-default">등록</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</form>
					
				</div>
				<div class="modal-footer">
					
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