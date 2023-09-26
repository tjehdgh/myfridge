<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>



       <!-- Navbar & Hero Start -->
       
        <div class="container-xxl position-relative p-0">
        
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
            
                <a href="/index" class="navbar-brand p-0">
                
                    <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>MY Fridge</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> -->
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="/adminIndex.jsp" class="nav-item nav-link active">홈</a>
                        <a href="/admin/adminBestRecipe" class="nav-item nav-link">레시피 랭킹</a>
                        <a href="/user/fridge" class="nav-item nav-link">나만의 냉장고</a>
                        <a href="/admin/adminRecipeSearch" class="nav-item nav-link">레시피찾기</a>
                        <a href="/recipe/recipeSave" class="nav-item nav-link">레시피등록</a>
                        <!--커뮤니티에 커서 올리면 드롭다운 시작 -->
                        <div class="nav-item dropdown">
                 		<a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                            <div class="dropdown-menu m-0">
                            	<a href="/admin/adminNotice" class="dropdown-item">공지사항</a>
                                <a href="/admin/event" class="dropdown-item">이벤트</a>
                                <a href="/admin/adminQna" class="dropdown-item">QnA</a>
                            </div>
                        </div>
                        
                        <!--마이페이지에  커서 올리면 드롭다운 시작 -->
 						<div class="nav-item dropdown">
                 		<a href="/myPage/myPage" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">마이페이지</a>
                            <div class="dropdown-menu m-0">
       							<a href="/myPage/myPage" class="dropdown-item">마이페이지</a>
                            	<a href="/myPage/myPageUpdateForm" class="dropdown-item">회원수정</a>
                                <a href="/user/dropOut" class="dropdown-item">회원탈퇴</a>
                                <a href="/myPage/bookMark" class="dropdown-item">즐겨찾기</a>
                                <a href="/myPage/userOrder" class="dropdown-item">주문내역</a>
                            </div>
                        </div>
                         
                
                 <c:if test="!cookieUserId=null">
                        <a href="/myPage/myPage" class="nav-item nav-link">My Page</a>
                 </c:if>
                        
                    </div>          
                      <a href="/adminLoginOut" class="btn btn-primary py-2 px-4">로그아웃</a>                      
                </div>
            </nav>
             

         <!--    <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container my-5 py-5">
                    <div class="row align-items-center g-5">
                        <div class="col-lg-6 text-center text-lg-start">
                            <h1 class="display-3 text-white animated slideInLeft">Discovery Your <br>Delicious Meal</h1>
                            <p class="text-white animated slideInLeft mb-4 pb-2">Tempor erat elitr rebum at clita. Diam dolor diam ipsum sit. Aliqu diam amet diam et eos. Clita erat ipsum et lorem et sit, sed stet lorem sit clita duo justo magna dolore erat amet</p>
                            <a href="" class="btn btn-primary py-sm-3 px-sm-5 me-3 animated slideInLeft">Login</a>
                        </div>
                        <div class="col-lg-6 text-center text-lg-end overflow-hidden">
                            <img class="img-fluid" src="resources/img/hero.png" alt="">
                        </div>
                    </div>
                </div>
            </div>
          -->   
            
        </div>
       
        

       <!-- Navbar & Hero Start -->
   
