<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>



<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <title>마이페이지 - 내가 찜한 레시피</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

<%@ include file="/WEB-INF/views/include/head.jsp" %>



<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">

<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>


<!-- 우리 나중에 navigation에 있는 Favicon이랑 계층형 게시판이라고 되어 잇는거,Google Web Fonts, Icon Font Stylesheet, Libraries Stylesheet 다 
/resources/ 붙여서 다시 수정해야되용 -->


    <!-- Favicon -->
    <link href="/resources/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/resources/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/css/style.css" rel="stylesheet">
    
    
    
<script type="text/javascript">


//레시피 제목 값 검색 시
$(document).ready(function() {
    
   
   $("#btnSearchType").on("click", function() {
      //document.myRecipeSearchForm.hiBbsSeq.value = ""; 
      document.myRecipeSearchForm.searchType.value = $("#_searchType").val();
      document.myRecipeSearchForm.searchValue.value = $("#_searchValue").val();
      document.myRecipeSearchForm.curPage.value = "1";
      document.myRecipeSearchForm.action = "/myPage/bookMark";
      document.myRecipeSearchForm.submit();
   });




	//레시피 설명 검색 시
	$("#btnSearchValue").on("click", function() {
      document.myRecipeSearchForm.searchType.value = $("#_searchType").val();
      document.myRecipeSearchForm.searchValue.value = $("#_searchValue").val();
      document.myRecipeSearchForm.curPage.value = "1";
      document.myRecipeSearchForm.action = "/myPage/bookMark";
      document.myRecipeSearchForm.submit();
   });

});



//페이징 처리 위한 함수
function fn_list(curPage)
{
	//document.myRecipeSearchForm.hiBbsSeq.value = "";
	document.myRecipeSearchForm.curPage.value = curPage;
	document.myRecipeSearchForm.action = "/myPage/bookMark";
	document.myRecipeSearchForm.submit();
	
}


//레시피 이름 눌렀을 때 레시피 상세페이지(recipeView.jsp)로 가게하는 함수
function fn_view(recipeCode)
{
   document.myRecipeSearchForm.recipeCode.value =  recipeCode //recipeCode;  //myRecipeSearchForm 에 있는 레시피코드를 넘김
   document.myRecipeSearchForm.action = "/recipe/recipeView";
   document.myRecipeSearchForm.submit();
}





</script>



    
</head>

<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        
        <!-- Spinner End -->


        <!-- Navbar & Hero Start -->

            <div class="container-xxl position-relative p-0">
            

             <div class="container-xxl py-1 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-1 pb-4">
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">My Page</h1></br></br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/myPage/myPage">My Page</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">My Recipe</li>
                        </ol>
                    </nav>
                    
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->






        <!-- Team Start -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
          
 
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">My Page</h5>
                    <h1 class="mb-5">내가 찜한 레시피</h1>
                </div>
                
                
		  <!-- 마이페이지 왼쪽 사이드바와 본문 시작 -->
		        	<div class="container-xxl pt-5 pb-3">
		           		 <div class="container">
		               		 <div class="row">
		                    <!-- 사이드바 시작 -->
		                    	<aside class="col-lg-3">
		                        	<div class="sidebar">
		                            <!-- 사이드바 내용 -->
		                           	 <div class="card-header bg-primary text-white">마이페이지</div>
					                    <div class="list-group list-group-flush">
					                        <a href="/myPage/myPage" class="list-group-item list-group-item-action">내 기본 정보</a>
					                        <a href="/myPage/myPageUpdateForm" class="list-group-item list-group-item-action">개인정보 수정</a>
					                        <a href="/myPage/bookMark" class="list-group-item list-group-item-action">찜한 레시피</a>
					                        <a href="/myPage/userQnA" class="list-group-item list-group-item-action">문의내역</a>
					                        <a href="/myPage/myRecipe" class="list-group-item list-group-item-action">나만의 레시피 내역</a> 
					                        <a href="/user/dropOut" class="list-group-item list-group-item-action">회원 탈퇴</a>
					                        
					                        
					                        <div class="card-header bg-primary text-white">고객 센터</div>
							                    <div class="list-group list-group-flush">
							                        <a href="/board/qna" class="list-group-item list-group-item-action">QnA</a>
							                        <a href="/board/notice" class="list-group-item list-group-item-action">공지사항</a>
							                        <a href="/admin/event" class="list-group-item list-group-item-action">이벤트</a> <!-- 이벤트는 공지사항이랑 같이 쓰이니까 같은 컨트롤러 사용 -->
							                   </div>
							                
					                     </div>
		                    </aside>
		                    <!-- 사이드바 끝 -->
		
		                    <!-- 본문 시작 -->
		                    <div class="col-lg-9">
		                        <div class="content">
		                            <!-- 본문 콘텐츠 - 위쪽에 프로필사진과 간략한 기본 정보 보여주는곳 -->
		                             
			                         <div  >
						                <div class="wow fadeInUp" data-wow-delay="0.1s">
						                        <div class="team-item text-center rounded overflow-hidden">
						                            
						                          
						                 	<!-- 프로필 사진 -->
									              <br>
									              <br>
			                                        <c:if test="${user.fileExt eq ''}">
			                                        	<img src = "/resources/upload/basic.jpg" class = "profile-photo "  width="200", height="200">
			                                       	</c:if>	
			                                       	<c:if test="${user.fileExt ne ''}">
			                                       		<img src = "/resources/upload/${user.userId}.${user.fileExt}" class = "profile-photo"  width="200", height="200">
			                                       	</c:if>
			                                       <br>
									    	<!-- 프로필 사진 -->   
						                           
						                           <div>
						                            <br>
						                            <h4 class="mb-0">${user.userNickname}</h4>
						                            <h5>미키마우스@Disney.com</h5>
						                           </div> 
						                          </div>
						                    </div>
				               		 </div>
		                            
		                        </div>
		                        
		                        <!-- 내 프로필 사진 부분과 그 밑의 정보들과의 간격을 보기 좋게 띄어주기 위해 넣어준 div -->
		                         <div style = "padding: 30px 30px 30px 30px;"><!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->  
		                        </div>
		                        <!--프로필 부분과 내역들 사이 공간 끝-->
		                        
		                        
		                        <div class="content">
		                           
		                        </div>
		                        
		                       
								<!-- 흰배경 시작-->
								<!-- 찜한 레시피 아이템을 반복적으로 표시 -->
								 	<div>
						                <div class="wow fadeInUp" data-wow-delay="0.1s">
						                        <div class="team-item text-center  overflow-hidden">
						                        
						                        <!--검색 상자 시작 -->
						                        <!-- 검색 상자1 레시피 제목 -->
												<div class="container mt-4" style="display: flex; justify-content: center;">
												    <div class="input-group mb-3" style="width: 500px;">
												        <input type="text" name="_searchType" id="_searchType" value="${searchType}" class="form-control" placeholder="제목" aria-label="검색어 입력" aria-describedby="basic-addon2" >
												        <div class="input-group-append">
												        <!-- <button class="btn-warning" type="button" id="btnSearchType" style="width: 60px; height: 40px;">검색</button> -->
												        <button class="btn-primary" type="button" id="btnSearchType" style="color: white; width: 60px; height: 40px;" >검색</button>
												        </div>
												    </div>
												</div>
												
							
										
												<!-- 검색 상자2  레시피 내용 -->
												<div class="container mt-4" style="display: flex; justify-content: center;">
												    <div class="input-group mb-3" style="width: 500px;">
												        <input type="text" name="_searchValue" id="_searchValue" value="${searchValue}" class="form-control" placeholder="레시피 설명" aria-label="검색어 입력" aria-describedby="basic-addon2">
												        <div class="input-group-append">
														<!-- <button class="btn-warning" type="button" id="btnSearchValue" style="width: 60px; height: 40px;">검색</button>  -->
														<button class="btn-primary" type="button" id="btnSearchValue" style="color: white; width: 60px; height: 40px;" >검색</button>
												        </div>
												    </div>
												</div>
												
												<!-- 검색 상자 끝 -->
						                        
						                            <div class="container mt-5">
														    <h3>내가 찜한 레시피</h3>
														    <table class="table table-bordered">
														    
														    	<thead>
														            <!-- 찜한 레시피들을 반복적으로 표시 -->
														            <tr>
														                <th scope="col">레시피 이미지</th>
														                <th scope="col">레시피 이름</th>
														                <th scope="col">레시피 설명</th>
														            </tr>
														            <!-- 찜한 레시피들도 반복적으로 표시 -->
														        </thead>
													
													
																 <c:forEach var="items" items="${bookMarklist}" varStatus="status"> 
															        <tbody>
															            <tr>
															            	<th scope="col"><img src="${items.recipeImage}" width="100" height="100" /></th> 
															                <td scope="col" width="200" onclick="fn_view(${items.recipeCode})"><u style="color:orange; cursor: pointer" >${items.recipeName}</u></td>
															               
															                <td scope="col">${items.recipeIntro}</td>    <!-- tr태그는 가운데 정렬이되고 td태그는 왼쪽 정렬됨 -->
															            </tr>
															        </tbody>
															     </c:forEach>		
														    </table>
														</div>    
														
														<!-- 페이징 처리 시작 -->
														 <ul class="pagination justify-content-center">
															<c:if test="${!empty paging}">      
															   <c:if test="${paging.prevBlockPage gt 0}">
															         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전블럭</a></li>
															   </c:if>
															   
															   <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
															      <c:choose>
															         <c:when test="${i ne curPage}">
															         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li> <!-- 현제페이지 번호를 가져감 -->
															         </c:when>
															         <c:otherwise>
															         <li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
															         </c:otherwise>
															      </c:choose>
															   </c:forEach>
															   
															   <c:if test="${paging.nextBlockPage gt 0}">
															         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음블럭</a></li>
															   </c:if>
															</c:if>
														 </ul>
														 <!-- 페이징 처리 끝 -->
														 
														 
								                    </div>
						                     </div>
						             </div>
				           </div>
								<!-- 흰 배경 끝 -->
								
		                    </div>
		                    <!-- 본문 끝 -->  
								        
						        
					</div> <!-- 사이드바 옆의 본문에 넣으려면 이 div안에 넣어야함 -->
				</div>
						

                </div>
            </div>
        </div>
        <!-- 마이페이지 사이드바와 본문 끝 -->


<form name="myRecipeSearchForm" id="myRecipeSearchForm" method="post">
     <!--  <input type="hidden" name="hiBbsSeq" value="" />  -->
     <input type="hidden" name="recipeCode" value="${recipeSearch.recipeCode}" />
      <input type="hidden" name="searchType" value="${searchType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>


        
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>