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
               <li><a id="logo">성적처리 프로그램(관리자)</a></li>
            </ul>



            <ul class="nav navbar-nav navbar-right">
               <li><a href="/project_20170116/admin_1.jsp">기초 정보 관리</a></li>
               <li><a href="/project_20170116/admin_2.jsp">강사 계정 관리</a></li>
               <li><a href="/project_20170116/admin_3.jsp">개설 과정 관리</a></li>
               <li><a href="/project_20170116/admin_4.jsp">개설 과목 관리</a></li>
               <li class="active"><a href="/project_20170116/admin_5.jsp">수강생
                     관리</a></li>
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
            <h1 style="margin-bottom: 20px">수강생 관리</h1>
            <div class="panel panel-default ss">
                  <div class="panel-body">
                  <div class="grade">
                     <table class="table table-default">
                        <thead>

                           <tr>
                              <th>수강생 ID</th>
                              <th>이름</th>
                              <th>주민번호</th>
                              <th>등록일</th>
                              <th>전화번호</th>
                              <th>수강 횟수</th>
                              <th>관리</th>
                              <th>신규 과정 등록</th>

                           </tr>
                        </thead>

                        <tbody>
                           <tr>
                              <td>student001</td>
                              <td>이수준</td>
                              <td>2027744</td>
                              <td>2016-11-01</td>
                              <td>010-7134-3319</td>
                              <td>1</td>
                              <td><button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentcheck">
                                    조회<span class="badge"></span>
                                 </button>
                                 <button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentupdate">
                                    수정<span class="badge"></span>
                                 </button>

                                 <button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentdelete">
                                    삭제<span class="badge"></span>
                                 </button></td>
                              <td>
                                 <button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentwrite">과정조회
                                 </button>
                              </td>

                           </tr>

                           <tr>
                              <td>student002</td>
                              <td>장민영</td>
                              <td>2254877</td>
                              <td>2015-10-09</td>
                              <td>010-6610-3345</td>
                              <td>2</td>
                              <td><button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentcheck">
                                    조회<span class="badge"></span>
                                 </button>
                                 <button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentupdate">
                                    수정<span class="badge"></span>
                                 </button>

                                 <button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentdelete">
                                    삭제<span class="badge"></span>
                                 </button></td>
                              <td>
                                 <button type="button" class="btn btn-default btn-xs"
                                    data-toggle="modal" data-target="#studentwrite">과정조회
                                 </button>
                              </td>

                           </tr>


                        </tbody>
                     </table>
				</div>

                     <form method="post" class="form-inline">

                        <div class="form-group">
                           <button type="button" class="btn btn-default"
                              data-toggle="modal" data-target="#studentplus">
                              수강생 등록 <span class="badge"></span>
                           </button>
                        </div>

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
            </div>

         </div>

         <div class="col-sm-2 sidenav">
            <div class="well">
               <p>관리자 OOO님,</p>
               <p>환영합니다!</p>
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

   <div id="studentplus" class="modal fade" role="dialog">
      <div class="modal-dialog">

         <!--수강생 등록 Modal-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">수강생 등록</h4>
            </div>
            <form action="" method="post">
               <div class="modal-body">
                  <div class="form-group">
                     <!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
                     <label for="name">이름:</label> <input type="text"
                        class="form-control" id="name1" name="name1" required
                        value="이우연">
                  </div>

                  <div class="form-group">
                     <!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
                     <label for="rrd">주민번호 뒷자리</label> <input type="text"
                        class="form-control" id="ggr1" name="ggr1" required
                        value="1687354">
                  </div>

                  <div class="form-group">
                     <label for="rrd">전화번호:</label> <input type="text"
                        class="form-control" id="phone1" name="phone1" required
                        value="010-1234-7862">
                  </div>
                  <button type="submit" class="btn btn-default">확인</button>
                  <button type="submit" class="btn btn-default">취소</button>
               </div>

            </form>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>


   <!-- 수강생 조회 Modal -->
   <div class="modal fade" id="studentcheck" role="dialog">
      <div class="modal-dialog modal-lg">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">수강생 과정 조회</h4>
               
            </div>
            <div class="modal-body">
               <p>
               <form action="" method="post">
				<h4 style="margin-bottom: 20px"> 이수준 수강생님</h4>
                  <div class="panel panel-default">
                     <div class="panel-body">
                        <div class="grade">
                           <table class="table" id="boardTable">
                              <thead>
                                 <tr>
                                    <th>과정명</th>
                                    <th>과정시작일</th>
                                    <th>과정종료일</th>
                                    <th>강의실</th>
                                    <th>수료/중도탈락 여부</th>
                                    <th>수료/중도탈락 날짜</th>
                                 </tr>
                              </thead>

                              <tbody>
                                 <tr>
                                    <td>빅데이터 응용 SW 개발</td>
                                    <td>20151101</td>
                                    <td>20151231</td>
                                    <td>강의실-101</td>
                                    <td>0</td>
                                    <td>-</td>
                                 </tr>
                                 <tr>
                                    <td>빅데이터 응용 SW 개발</td>
                                    <td>20151101</td>
                                    <td>20151231</td>
                                    <td>강의실-101</td>
                                    <td>0</td>
                                    <td>-</td>
                                 </tr>
                                 <tr>
                                    <td>빅데이터 응용 SW 개발</td>
                                    <td>20151101</td>
                                    <td>20151231</td>
                                    <td>강의실-101</td>
                                    <td>0</td>
                                    <td>-</td>
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

 <!--수강생 입력 Modal-->
   <div id="studentwrite" class="modal fade" role="dialog">
      <div class="modal-dialog modal-lg">        
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">수강생 신규 과정 등록</h4>
            </div>
            <div class ="modal-body">
            <form action="#" method="post">
            <h4 style="margin-bottom: 20px"> 이수준 수강생님</h4>
            <div class="panel panel-default ">               
                  <div class="panel-body">
                  <div class="grade">
                     <table class="table table-default">
                        <thead>

                           <tr>
                              <th>과정ID</th>
                              <th>과정명</th>
                              <th>과정 시작일</th>
                              <th>과정 종료일</th>
                              <th>강의실</th>
                              <th>정원</th>
                              <th>등록 인원</th>
                              <th>과정등록</th>
                           </tr>
                        </thead>

                        <tbody>
                           <tr>
                              <td>course001</td>
                              <td>빅데이터 응용 SW 개발</td>
                              <td>2016-11-01</td>
                              <td>2016-12-31</td>
                              <td>강의실-101</td>
                              <td>15</td>
                              <td>5</td>
                              <td><a data-toggle="collapse" data-parent="#accordion"
                                 href="#collapse2" class="btn btn-default btn-xs"
                                 role="button"> 등록</a></td>
                           </tr>

                           <tr>
                              <td>course002</td>
                              <td>빅데이터 응용 SW 개발</td>
                              <td>2015-11-01</td>
                              <td>2015-12-31</td>
                              <td>강의실-201</td>
                              <td>15</td>
                              <td>3</td>
                              <td><a data-toggle="collapse" data-parent="#accordion"
                                 href="#collapse2" class="btn btn-default btn-xs"
                                 role="button"> 등록</a></td>
                           </tr>

                           <tr>
                              <td>course003</td>
                              <td>파이톤 SW 개발</td>
                              <td>2016-11-01</td>
                              <td>2016-12-31</td>
                              <td>강의실-101</td>
                              <td>15</td>
                              <td>10</td>
                              <td><a data-toggle="collapse" data-parent="#accordion"
                                 href="#collapse2" class="btn btn-default btn-xs"
                                 role="button"> 등록</a></td>
                           </tr>

                        </tbody>
                     </table>

							<div id="collapse2" class="panel-collapse collapse">
								<div class="panel-body">
									과정명: 빅데이터 응용 SW 개발 <br> 과정시작일: 2016-11-01 <br> 과정종료일:
									2016-12-31 <br> 강의실: 강의실-101 <br> 정원: 15 <br> <br>
									<b> 선택한 과정으로 등록하시겠습니까?</b><br><br>
									<a href="" class="btn btn-default btn-xs" role="button">확인</a>
									<a href="" class="btn btn-default btn-xs" role="button">취소</a>
								</div>
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

   <!-- 수강생 수정 -->
   <div id="studentupdate" class="modal fade" role="dialog">
      <div class="modal-dialog">

         <!-- Modal content-->
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">수강생 정보 수정</h4>
            </div>
            <div class="modal-body">

               <!-- action ="" 속성의 주소 변경 -->
               <form action="" method="post">
               
                  <div class="form-group">
                     <!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
                     <label for="name">이름:</label> <input type="text"
                        class="form-control" id="name2" name="name2" readonly required
                        value="이수준">
                  </div>

                  <div class="form-group">
                     <!-- id="" 속성에서 식별자 작성시 현재 페이지 내에서 유일하도록 작성할 것. -->
                     <label for="rrg">주민번호 뒷자리:</label> <input type="text"
                        class="form-control" id="rrg2" name="rrg2" readonly required
                        value="2027744">
                  </div>

                  <div class="form-group">
                     <label for="phone">전화번호:</label> <input type="text"
                        class="form-control" id="phone2" name="phone2" required
                        value="010-7134-3319">
                  </div>
                  <button type="submit" class="btn btn-default">확인</button>
                  <button type="submit" class="btn btn-default">취소</button>
               </form>

  		</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

   <!-- 학생 삭제 Modal -->
	<div id="studentdelete" class="modal fade" role="dialog">
		<div class="modal-dialog modal-sm">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">수강생 정보 삭제</h4>
				</div>
				<div class="modal-body">
					<form action="" method="post">
						<%-- hidden form : 화면상에는 보이지 않지만 폼 전송시 사용하기 위해서 준비한 입력 폼 --%>
						<input type="hidden" value="1" name="sid" id="sid4">
						
						<div class="form-group">
							이름: <span id="name3">이수준</span>
						</div>

						<div class="form-group">
							주민번호: <span id="rrg3">2027744</span>
						</div>

						<div class="form-group">
							등록일: <span id="signup1">2016-11-01</span>
						</div>

						<div class="form-group">
							전화번호: <span id="phone3">010-7134-3319</span>
						</div>

						<div class="form-group">
							수강 횟수: <span id="number1">1</span>
						</div>

						<div class="form-group">현재 선택한 정보를 삭제할까요?</div>
						<br>

						<!-- 서브밋 버튼 클릭시 hidden form의 데이터(번호)가 서버로 전송된다. -->
						<button type="submit" class="btn btn-default">확인</button>

						<!-- 취소 버튼 클릭시 현재 모달창을 닫는다. -->
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>

					</form>

				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
</body>
</html>