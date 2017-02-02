<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="com.test.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
               <li><a id="logo">성적처리 프로그램(수강생)</a></li>
            </ul>
				<ul class="nav navbar-nav navbar-right">
					<li ><a href="/project_20170116/student_1.jsp">내정보</a></li>
					<li class="active"><a href="/project_20170116/student_2.jsp">나의 강의실</a></li>


					<li><a href="/project_20170116/logout.jsp"><span
							class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				</ul>
			</div>
      </div>
   </nav>

   <div class="container-fluid text-center" >
      <div class="row content" >
         <div class="col-sm-1 sidenav"></div>
         <div class="col-sm-9 text-left" id="content" >

         <h1 style="margin-bottom:20px">나의 강의실</h1>
         <div class="panel panel-default ss">
            <div class="panel-body">
               <table class="table" id="boardTable">
                  <thead>
                     <tr>
                        <th>과정명</th>
                        <th>과정시작일</th>
                        <th>과정종료일</th>
                        <th>강의실</th>
                        <th>성적</th>
                     </tr>
                  </thead>
                  
                  <tbody>
                     <!-- <tr>
                        <td>빅데이터 응용SW개발</td>
                        <td>20161101</td>
                        <td>20161131</td>
                        <td>강의실-101</td>
                        <td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#gradeModal">조회</button></td>
                     </tr> -->
                     <c:forEach var="g" items="${list}">
						<tr>
							<td>${g.coursename}</td>
							<td>${g.course_start}</td>
							<td>${g.course_end}</td>
							<td>${g.classroom_name}</td>
							<td><button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#gradeModal">조회</button></td>
						</tr>
					</c:forEach>

                  </tbody>
               </table>
               
               
               <form method="post" class="form-inline">

                  <div class="form-group">
                     <button type="button" class="btn btn-default count">
                        TotalCount <span class="badge" id="totalCount">1</span>
                     </button>
                  </div>

               </form>
               

               </div>
            </div>
         </div>

         <div class="col-sm-2 sidenav">
         <div class="well">

            <p>수강생 OOO님,</p>
            <p>환영합니다!</p>
         </div>
      </div>
   </div>
   </div>


   <!--  성적 조회 Modal -->
   <div class="modal fade" id="gradeModal" role="dialog">
      <div class="modal-dialog modal-lg">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">성적 조회</h4>
            </div>
            <div class="modal-body" >
               <p>
               <form action="gradeinsert.jsp" method="post">
                  
                  
            <h4 style="margin-bottom:20px">빅데이터 응용SW개발(20161101~20161131)</h4>
         
            <div class="panel panel-default">
               <div class="panel-body">
               <div class="grade">
                  <table class="table"  id="boardTable">
                     <thead>
                        <tr>
                           <th>과목명</th>
                           <th>과목시작일</th>
                           <th>과목종료일</th>
                           <th>출석배점</th>
                           <th>필기배점</th>
                           <th>실기배점</th>
                           <th>출석점수</th>
                           <th>필기점수</th>
                           <th>실기점수</th>
                           <th>강사명</th>
                           <th>강사 전화번호</th>
                           <th>시험파일</th>
                        </tr>
                     </thead>
                     
                     <tbody>
                        <tr>
                           <td>자바</td>
                           <td>20161101</td>
                           <td>20161115</td>
                           <td>20</td>
                           <td>40</td>
                           <td>40</td>
                           <td>15</td>
                           <td>35</td>
                           <td>38</td>
                           <td>모모</td>
                           <td>010-1234-1234</td>
                           <td><a href="#">.zip</a></td>
                        </tr>
                        
                        <tr>
                           <td>오라클</td>
                           <td>20161116</td>
                           <td>20161131</td>
                           <td>20</td>
                           <td>40</td>
                           <td>40</td>
                           <td>20</td>
                           <td>28</td>
                           <td>35</td>
                           <td>사나</td>
                           <td>010-2222-1111</td>
                           <td><a href="#">.zip</a></td>
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