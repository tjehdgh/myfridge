<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>




<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <title>마이페이지</title>
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


<script>

$(document).ready(function() {
	
	$("#ProfileFile").on("click", function() {
		
		href = "/uploadProfileImage";
	      document.myRecipeSearchForm.submit();
	   });
});


//레시피 이름 눌렀을 때 레시피 상세페이지(recipeView.jsp)로 가게하는 함수
function fn_bookMarkView(recipeCode)
{
   document.bookMarkSearchForm.recipeCode.value =  recipeCode  //myRecipeSearchForm 에 있는 레시피코드를 넘김
   document.bookMarkSearchForm.action = "/recipe/recipeView";
   document.bookMarkSearchForm.submit();
}



function fn_myRecipeView(recipeCode)
{
   document.myRecipeSearchForm.recipeCode.value =  recipeCode; //myRecipeSearchForm 에 있는 레시피코드를 넘김
   document.myRecipeSearchForm.action = "/recipe/recipeView";
   document.myRecipeSearchForm.submit();
}

</script>



</head>

<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
    <div class="container-xxl position-relative p-0">
            

             <div class="container-xxl py-1 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-1 pb-4">
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">My Page</h1></br></br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">홈</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">mypage</li>
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
                    <h1 class="mb-5">내 기본 정보</h1>
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
                       <a href="/myPage/myPageUpdateForm" class="list-group-item list-group-item-action">회원정보 수정</a>
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
	                                    <!-- 프로필 사진 --> 
	                                    
	                                    	<div>
	                                     		<br>
	                                        	<h4 class="mb-0">${user.userNickname}</h4>
	                                        	<h5>미키마우스@Disney.com</h5>
	                                        	<br>
	                                        </div>
	                                        
	                                    </div>
	                                </div>
	                            </div>
	                            
	                        </div>
	                        
	                        <!-- 내 프로필 사진 부분과 그 밑의 정보들과의 간격을 보기 좋게 띄어주기 위해 넣어준 div -->
	                         <div style ="padding: 30px 30px 30px 30px;"><!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->  
	                        </div>
	                        <!--프로필 부분과 내역들 사이 공간 끝-->
	                        
	                        
	                        <div class="content">
	                           <!-- 본문 내용 보여주기 : 사이드바에서 특정메뉴 누르면 그에 대한 정보만 가져와서 이부분만 바꾸기??
	                            또는 이 부분만 바꾸지 않으면 사이드바에서 특정메뉴 누르면 각각 마이페이지 사이트 다 만들어야함 -->
	                          <!--   <h1>환영합니다, 사용자 이름</h1>
	                            <p>마이 페이지 콘텐츠가 이 부분에 들어갑니다.</p>  -->
	                        </div>
	                        
	                        <!-- 개인 정보 수정 섹션 -->
						<!--  	나중에 쓸모있을것 같은 폼이여서 남겨놨습니다
								<div class="container mt-5">
							    <h2>개인 정보 수정</h2>
							    <form>
							        <div class="mb-3">
							            <label for="name" class="form-label">이름</label>
							            <input type="text" class="form-control" id="name" name="name">
							        </div>
							        <div class="mb-3">
							            <label for="email" class="form-label">이메일 주소</label>
							            <input type="email" class="form-control" id="email" name="email">
							        </div>
							        <div class="mb-3">
							            <label for="password" class="form-label">새 비밀번호</label>
							            <input type="password" class="form-control" id="password" name="password">
							        </div>
							        <button type="submit" class="btn btn-primary">저장</button>
							    </form>
							</div>
						-->
							
							
						<!-- 찜한 레시피 아이템을 반복적으로 표시 -->
						<div>
						<div class="team-item text-center rounded overflow-hidden"> <!-- 이게 바탕이 네모낳게 하얀색 + 테두리 그림자 있게 해주는 div -->
							<div class="container mt-5">
							    <h4>찜한 레시피</h4>
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
							        
							        <c:forEach var="item" items="${myPage}" varStatus="status"> 
							        <tbody>
							            <tr>
							            	<th scope="col"><img src="${item.recipeImage}" width="100" height="100" /></th> 
							                <td scope="col"  width="200" onclick="fn_bookMarkView(${item.recipeCode})"><u style="color:orange; cursor: pointer" >${item.recipeName}</u></td>
							                <td scope="col" >${item.recipeIntro}</td>    <!-- tr태그는 가운데 정렬이되고 td태그는 왼쪽 정렬됨 -->
							            </tr>
							        </tbody>
							     </c:forEach> 
							        
							       
							    </table>
							</div>
							
						<!-- 이게 바탕이 네모낳게 하얀색 + 테두리 그림자 있게 해주는 div -->
							        
							        
							        
							   <!-- 문의 내역 섹션 -->
							   <!--  나중에 쓸 수도 있는 폼이라 남겨놓았어요 --
							<div class="container mt-5">
							    <h2>문의 내역</h2>
							    <table class="table">
							        <thead>
							            <tr>
							                <th scope="col">날짜</th>
							                <th scope="col">제목</th>
							                <th scope="col">상태</th>
							            </tr>
							        </thead>
							        <tbody>
							            <!-- 문의 내역 아이템들을 반복적으로 표시 --
							            <tr>
							                <td>2023-08-26</td>
							                <td>문의 제목 1</td>
							                <td>처리 중</td>
							            </tr>
							            <!-- 다른 문의 내역 아이템들도 반복적으로 표시 --
							        </tbody>
							    </table>
							</div>
						-->	
							
							
							
							<!-- 테두리 적용한거 -->
							<div class="container mt-5">
							    <h4>최근 주문 내역</h4>
							    <table class="table table-bordered">
							        <thead>
							            <tr>
							                <th scope="col">주문 날짜</th>
							                <th scope="col">상품명</th>
							                <th scope="col">총 금액</th>
							            </tr>
							        </thead>
							        
							        <c:forEach var="item" items="${userOrder}" varStatus="status"> 
							        <tbody>
							            <tr>
							            	<td scope="col" width="500">${item.oderDate}</td> 
							                <td scope="col" width="300">${item.orderProductName}</td>
							                <td scope="col" width="300"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${item.orderProductPrice}" /></td>    <!-- tr태그는 가운데 정렬이되고 td태그는 왼쪽 정렬됨 -->
							            
							            </tr>
							        </tbody>
							     </c:forEach>
	
							       
							    </table>
							</div>
													
							
							
							
							<!-- 나의 최근 레시피 (최근에 내가 등록한 레시피 3개를표시) -->
							<div class="container mt-5">
							    <h4>최근 나만의 레시피</h4>
							    <table class="table table-bordered">
							    
							    
							        <thead>
							            <tr>
							            	<th scope="col">레시피 사진</th>
							                <th scope="col">레시피 이름</th>
							                <th scope="col">레시피 설명</th>
							            </tr>
							        </thead>
							   
							  
							  
							  <c:forEach var="item" items="${recipeInfo}" varStatus="status"> 
							        <tbody>
							            <tr>
							            	<th scope="col"><img src="${item.recipeImage}" width="100" height="100" /></th> 
							                <td scope="col" width="200"  onclick="fn_myRecipeView(${item.recipeCode})"><u style="color:orange; cursor: pointer" >${item.recipeName}</u></td>
							                <td scope="col">${item.recipeIntro}</td>    <!-- tr태그는 가운데 정렬이되고 td태그는 왼쪽 정렬됨 -->
							            </tr>
							        </tbody>
							     </c:forEach> 
							  
							    </table>
							</div>
							  <br> 
							 
	                    </div>
	                    
	                </div><!-- 이게 바탕이 네모낳게 하얀색 + 테두리 그림자 있게 해주는 div -->
	                </div><!-- div안에서 하얀바탕 div가 있어야 영역이 정확하게 지정됨 안그러면 하얀바탕이 끝도없이 계속 이어짐 -->
	         </div>
	</div>
          <!-- 본문 끝 -->  
						        
						        
						        
						        
						  
			</div> <!-- 사이드바 옆의 본문에 넣으려면 이 div안에 넣어야함 -->
		</div>
						
						

                </div>
            </div>
        </div>
        <!-- 마이페이지 사이드바와 본문 끝 -->



<!-- 내가찜한 레시피의 레시피 코드 보내는 form -->
<form name="bookMarkSearchForm" id="bookMarkSearchForm" method="post">
     <input type="hidden" name="recipeCode" value="${recipeCode}" />
     <input type="hidden" name="curPage" value="${curPage}" />
</form>
<!-- 내가찜한 레시피의 레시피 코드 보내는 form -->


<!-- 내가 등록한 레시피의 레시피 코드 보내는 form -->
<form name="myRecipeSearchForm" id="myRecipeSearchForm" method="post">
     <input type="hidden" name="recipeCode" value="${recipeCode}" />
     <input type="hidden" name="curPage" value="${curPage}" />
<!-- 내가 등록한 레시피의 레시피 코드 보내는 form -->

                      
       
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

   
</body>

</html>