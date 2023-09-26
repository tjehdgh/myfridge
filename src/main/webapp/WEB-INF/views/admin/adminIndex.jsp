      <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<!--<%@ include file="/WEB-INF/views/include/taglib.jsp" %>  head에 빼놨으니까 익 없어도되지?-->


<!DOCTYPE html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="UTF-8">
    <title>My Fridge</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<meta http-equiv="X-UA-Compatible" content="ie=edge"> <!-- 내가추가함 -->

    <!-- Favicon -->
    <link href="/resources/img/fridgeFavicon.png" rel="icon">

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
   
<script type="text/javascript" sc="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>


<script type="text/javascript">
$(document).ready(function() {
   
   $("#btnLogin2").on("click", function(){
      location.href = "/user/login";
   });    
   
});



//레시피 제목 누르면 레시피 상세로 들어가는 함수
function fn_view(recipeCode)
{
	//alert("code : " + recipeCode);
   document.RecipeSearchForm.recipeCode.value =  recipeCode; 
   document.RecipeSearchForm.action = "/recipe/recipeView";
   document.RecipeSearchForm.submit();
}

</script>

</head>

<body>
<%@ include file="/WEB-INF/views/include/adminNavigation.jsp" %> 
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start -->
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
            
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        
   
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container my-5 py-5">
                    <div class="row align-items-center g-5">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="display-3 text-white animated slideInLeft">Discovery Your <br>Delicious Meal</h1>
                            <p class="text-white animated slideInLeft mb-4 pb-2">My Fridge는 요리에 관심과 고민이 있는 모든 사람들을 위한 레시피 사이트입니다. 내 냉장고 속에서 시작되는 모험에 참여해 보세요! 새로운 요리들과 창의력 가득한 레시피들을 경험하실 수 있습니다. </p>
              
   <%if(com.icia.web.util.CookieUtil.getCookie(request,"USER_ID") != null)//쿠키가 있을때(로그인 성공)
   {
%>
                            <a href="/user/fridge" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">MY Fridge</a>
   <%
    }
   else
   {
   %>
   							<a href="/user/login" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">MY Fridge</a>
   <%
    }
   %>
                        </div>
                        <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                            <img class="img-fluid" src="resources/img/hero.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Service Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="service-item rounded pt-3">
                            <div class="p-4">
                               <!--  <i class="fa fa-3x fa-user-tie text-primary mb-4"></i>--> 
                                <i class="fas fa-book text-primary mb-4 fa-3x"></i>
                                <a href="/recipe/recipeSearch" ><h5 style="color: skyblue;">레시피 찾기</h5></a>
                                <p>찾고 싶은 요리의 분류, 재료를 모르더라도 페이지의 카테고리를 따라가다보면 원하는 레시피를 만날 수 있어요!</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="service-item rounded pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-utensils text-primary mb-4"></i>
                                <a href="/recipe/bestRecipe" ><h5 style="color: skyblue;">베스트 레시피</h5></a>
                                <p>다른사람들은 어떤 요리를 좋아하는지 궁금하지 않으신가요?<br>어떤 요리가 인기가 많은지, 어떻게 만드는지 확인해보세요. </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="service-item rounded pt-3">
                            <div class="p-4">
                              <!--   <i class="fa fa-3x fa-cart-plus text-primary mb-4"></i> -->
                              <i class="fas fa-fish text-primary mb-4 fa-3x"></i>
                              
<%if(com.icia.web.util.CookieUtil.getCookie(request,"USER_ID") != null)//쿠키가 있을때(로그인 성공)
   {
%> 
                                <a href="/recipe/bestRecipe" ><h5 style="color: skyblue;">나만의 냉장고</h5></a>
<% 
}
else //로그인 안한 사람이면 로그인 페이지로 가
{
%>
								<a href="/user/login" ><h5 style="color: skyblue;">나만의 냉장고</h5></a>
<%
}
%>
                                <p>내가 가진 재료들을 사용한 맞춤 레시피들을 찾아보세요!<br>재료의 종류와 양에 따라 다양한 레시피들을 발견할 수 있어요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="service-item rounded pt-3">
                            <div class="p-4">
                                <i class="fa fa-3x fa-headset text-primary mb-4"></i>
                                <a href="/admin/qna" ><h5 style="color: skyblue;">QnA</h5></a>
                                <p>불편사항이나 제안사항이 있으신가요? <br>my fridge에 전하고 싶은 의견을 남겨주세요. </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Service End -->


        <!-- About Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-6">
                        <div class="row g-3">
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.1s" src="../resources/img/cutting-cucumber.jpg">
                            </div>
                            <div class="col-6 text-start">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.3s" src="../resources/img/fireDish.jpg" style="margin-top: 25%;">
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-75 wow zoomIn" data-wow-delay="0.5s" src="../resources/img/recipeBook.jpg" >
                            </div>
                            <div class="col-6 text-end">
                                <img class="img-fluid rounded w-100 wow zoomIn" data-wow-delay="0.7s" src="../resources/img/backing.jpg" >
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <h5 class="section-title ff-secondary text-start text-primary fw-normal">About Us</h5>
                        <h1 class="mb-4">Welcome to <i class="fa fa-utensils text-primary me-2"></i>My Fridge</h1>
                        <p class="mb-4">My Fridge는 요리에 관심과 고민이 있는 모든 사람들을 위한 레시피 사이트입니다. </p>
                        <p class="mb-4">매번 비슷한 반찬들로 아이들이 투정을 부리나요? 식사 시간이 지루해 지시나요? 재료는 있지만 특별한 메뉴가 떠오르지 않으시나요? <br>소중한 사람들을 위한 특별한 요리를 찾고 싶을 때, 나의 독창적인 레시피를 뽑내고 싶을 때 등등 언제든지 My Fridge에서 특별한 레시피를 찾으실 수 있습니다.<br>나만의 냉장고에 내가 가진 재료들로 원하는 요리 레시피를 찾고 만들어보세요!</p>
                        <div class="row g-4 mb-4">
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">112</h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Days of</p>
                                        <h6 class="text-uppercase mb-0">Study</h6>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="d-flex align-items-center border-start border-5 border-primary px-3">
                                    <h1 class="flex-shrink-0 display-5 text-primary mb-0" data-toggle="counter-up">896</h1>
                                    <div class="ps-4">
                                        <p class="mb-0">Hours of</p>
                                        <h6 class="text-uppercase mb-0">EFFORT</h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a class="btn btn-primary py-3 px-5 mt-2" href="/recipe/recipeSearch">Try Out</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->


        <!-- Menu Start -->
        <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Food Menu</h5>
                    <h1 class="mb-5">베스트 레시피</h1>
                </div>
                
                
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                
                <!-- 클릭 아이콘 시작 -->
                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
                              <!--  <i class="far fa-thumbs-up fa-2x text-primary"></i> -->
                                <i class="fas fa-thumbs-up  fa-2x text-primary"></i>
                                <div class="ps-3">                                   
                                    <h6 class="mt-n1 mb-0">베스트 레시피</h6>
                                </div>
                            </a>
                        </li>
                        
                        
                         <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="#tab-2">
                                <i class="fa fa-hamburger fa-2x text-primary"></i>
                                <!-- <i class="fas fa-pizza-slice fa-2x text-primary"></i> -->
                                <div class="ps-3">
                                    <h6 class="mt-n1 mb-0">메인 요리</h6>
                                </div>
                            </a>
                        </li>
                        
                   
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 me-0 pb-3" data-bs-toggle="pill" href="#tab-3">
                                <i class="fas fa-ice-cream fa-2x text-primary"></i>
                               <!-- <i class="fa fa-utensils fa-2x text-primary"></i> -->
                                <div class="ps-3">                                   
                                    <h6 class="mt-n1 mb-0">빵/떡/디저트</h6>
                                </div>
                            </a>
                        </li>
                       
                        
                    </ul>
                 <!-- 클릭 아이콘 끝 -->  
                    
                    
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                   
				                   <!-- 베스트 레시피 왼쪽 1~4 등 섹션 -->
				                   
				                      <c:forEach var="bestRecipeList" items="${indexBestRecipeList}" varStatus="status">
				                                <div class="col-lg-6">
				                                    <div class="d-flex align-items-center">
				                                        <img class="flex-shrink-0 img-fluid rounded" src="${bestRecipeList.recipeImage}" alt="" style="width: 80px;">
				                                        <div class="w-100 d-flex flex-column text-start ps-4">
				                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
				                                                <span onclick="fn_view(${bestRecipeList.recipeCode})" style="color:orange; cursor: pointer">${bestRecipeList.recipeName}</span>
				                                                <span style="color:black; font-size: 14px;">${bestRecipeList.rcmCnt}</span>
				                                            </h5>
				                                            <small class="fst-italic">${bestRecipeList.recipeIntro}</small>
				                                        </div>
				                                    </div>
				                                </div>
				                       </c:forEach>
				                     
				              <!-- 베스트 레시피 왼쪽 1~4 등 섹션 끝 --> 
				              
                            </div>
                        </div>
                        
                        
            
            
            		<!-- 메인요리 아이콘 눌렀을 떄 나오는 리스트 섹션 시작 -->
                        <div id="tab-2" class="tab-pane fade show p-0">
                            <div class="row g-4">
                            
                  			<!-- 메인요리 리스트 시작 -->
                                <c:forEach var="mainDishes" items="${indexMainDishesList}" varStatus="status">
				                                <div class="col-lg-6">
				                                    <div class="d-flex align-items-center">
				                                        <img class="flex-shrink-0 img-fluid rounded" src="${mainDishes.recipeImage}" alt="" style="width: 80px;">
				                                        <div class="w-100 d-flex flex-column text-start ps-4">
				                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
				                                                <span onclick="fn_view(${mainDishes.recipeCode})" style="color:orange; cursor: pointer">${mainDishes.recipeName}</span>
				                                                <span style="color:black; font-size: 14px;">${mainDishes.rcmCnt}</span>
				                                            </h5>
				                                            <small class="fst-italic">${mainDishes.recipeIntro}</small>
				                                        </div>
				                                    </div>
				                                </div>
				                       </c:forEach>
                  				<!-- 메인요리 리스트 끝 -->
                      
                            </div>
                        </div>
         			<!-- 메인요리 아이콘 눌렀을 떄 나오는 리스트 섹션 끝 -->   
                    
                    
                 	<!-- 디저트 아이콘 눌렀을 때 나오는 리스트 섹션 시작 -->
                        <div id="tab-3" class="tab-pane fade show p-0">
                            <div class="row g-4">
                            
                           	  <!-- 디저트 리스트 시작 -->
                                 <c:forEach var="Dessert" items="${indexDessertList}" varStatus="status">
				                                <div class="col-lg-6">
				                                    <div class="d-flex align-items-center">
				                                        <img class="flex-shrink-0 img-fluid rounded" src="${Dessert.recipeImage}" alt="" style="width: 80px;">
				                                        <div class="w-100 d-flex flex-column text-start ps-4">
				                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
				                                                <span onclick="fn_view(${Dessert.recipeCode})" style="color:orange; cursor: pointer">${Dessert.recipeName}</span>
				                                                <span style="color:black; font-size: 14px;">${Dessert.rcmCnt}</span>
				                                            </h5>
				                                            <small class="fst-italic">${Dessert.recipeIntro}</small>
				                                        </div>
				                                    </div>
				                                </div>
				                       </c:forEach>
                             <!-- 디저트 리스트 끝 -->
                            
                            </div>
                        </div>
                      <!-- 디저트 아이콘 눌렀을 때 나오는 리스트 섹션 시작 -->
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- Menu End -->

        <!-- Team Start -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Team Members</h5>
                    <h1 class="mb-5">베스트 쉐프들</h1>
                </div>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid" src="/resources/img/java-rabbit.png" alt="">
                            </div>
                            <h5 class="mb-0">김시형</h5>
                            <small>팀장</small>
                            <div class="d-flex justify-content-center mt-3">
                            <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-github"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid" src="/resources/img/oracle-rabbit.png" alt="">
                            </div>
                            <h5 class="mb-0">원종연</h5>
                            <small>부팀장</small>
                            <div class="d-flex justify-content-center mt-3">
                            <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-github"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid" src="/resources/img/spring-rabbit.png" alt="">
                            </div>
                            <h5 class="mb-0">서동호</h5>
                            <small>팀원</small>
                            <div class="d-flex justify-content-center mt-3">
                               <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-github"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 wow fadeInUp" data-wow-delay="0.7s">
                        <div class="team-item text-center rounded overflow-hidden">
                            <div class="rounded-circle overflow-hidden m-4">
                                <img class="img-fluid" src="/resources/img/git-rabbit.png" alt="">
                            </div>
                            <h5 class="mb-0">이한솔</h5>
                            <small>팀원</small>
                            <div class="d-flex justify-content-center mt-3">
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-youtube"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-github"></i></a>
                                <a class="btn btn-square btn-primary mx-1" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->


        <!-- Testimonial Start -->
        <div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
            <div class="container">
                <div class="text-center">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">Testimonial</h5>
                    <h1 class="mb-5">My Fridge 테스터들의 한마디</h1>
                </div>
                <div class="owl-carousel testimonial-carousel">
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>나만의 냉장고 기능이 있어서 레시피를 조회하는게 더 편리해서 자주 이용해요. 내가 가지고 있는 재료가 들어간 레시피 뿐만 아니라 재료의 용량까지 고려해 현재 만들 수 있는 레시피들을 바로 알 수 있어서 좋았어요.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="/resources/img/java-rabbit.png" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">자두엄마</h5>
                                <small>주부</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>기본 레시피들을 추천순 정렬, 단어 검색 등 내가 원하는 형태로 검색할 수 있을 뿐만 아니라 회원들이 직접 연구한 레시피들도 공유할 수 있어서 영감을 얻을 수 있는 창의적인 아이디어들을 접할 수 있어서 좋았습니다.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="/resources/img/oracle-rabbit.png" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">요리를 사랑하는 남자</h5>
                                <small>자영업자</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                        <p>래시피 랭킹으로 추천순, 조회순으로 인기있고 많이 찾는 레시피들을 한 눈에 알아볼 수 있어서 좋았어요. 레시피 랭킹과 별개로 위치한 레시피 찾기 부분은 어떤 분류의 음식을 찾을지 모르는 사람들도 조회항목의 도움을 받아 조회할 수 있어서 좋았어요.</p>
                        <div class="d-flex align-items-center">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="/resources/img/spring-rabbit.png" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">피치피치</h5>
                                <small>회사원</small>
                            </div>
                        </div>
                    </div>
                    <div class="testimonial-item bg-transparent border rounded p-4">
                        <i class="fa fa-quote-left fa-2x text-primary mb-3"></i>
                       
                        <p>나만의 냉장고 기능을 이용해 내가 가지고 있는 재료의 종류와 용량까지 따져서 만들 수 있는 레시피를 찾을 수 있어서 편리했어요. 다양한 레시피들과 요리과정, 재료, 요리 순서와 자세한 사진 설명까지 있어서 초보자가 따라하기 쉬웠습니다.</p>
                        <div class="d-flex align-items-center">
                             <img class="img-fluid flex-shrink-0 rounded-circle" src="https://img.freepik.com/premium-photo/homemade-delicious-and-juicy-cherry-pie-generative-ai_84130-12083.jpg?w=900" style="width: 50px; height: 50px;">
                            <img class="img-fluid flex-shrink-0 rounded-circle" src="/resources/img/git-rabbit.png" style="width: 50px; height: 50px;">
                            <div class="ps-3">
                                <h5 class="mb-1">요리 잘하고 싶은 자취생</h5>
                                <small>자취생</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Testimonial End -->
        
       
<form name="RecipeSearchForm" id="RecipeSearchForm" method="post">
      <input type="hidden" name="recipeCode" value="${list.recipeCode}" />
   </form>



        <!-- Footer Start -->
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/lib/wow/wow.min.js"></script>
    <script src="../resources/lib/easing/easing.min.js"></script>
    <script src="../resources/lib/waypoints/waypoints.min.js"></script>
    <script src="../resources/lib/counterup/counterup.min.js"></script>
    <script src="../resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="../resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="../resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="../resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="../resources/js/main.js"></script>
</body>

</html>