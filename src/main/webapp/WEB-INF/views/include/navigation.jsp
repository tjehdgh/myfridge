<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<%
	if(com.icia.web.util.CookieUtil.getCookie(request, (String)request.getAttribute("AUTH_COOKIE_NAME")) != null)//쿠키가 있을때(로그인 성공)
	{
%>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title><spring:eval expression="@env['site.title']" /></title>
<link href="/resources/img/fridgeFavicon.png" rel="icon">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">

<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>



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
                        <a href="/index.jsp" class="nav-item nav-link active">홈</a>
                        <a href="/recipe/bestRecipe" class="nav-item nav-link">레시피 랭킹</a>
                        <a href="/user/fridge" class="nav-item nav-link">나만의 냉장고</a>
                        <a href="/recipe/recipeSearch" class="nav-item nav-link">레시피찾기</a>
                        <a href="/recipe/recipeSave" class="nav-item nav-link">레시피등록</a>
                        <!--커뮤니티에 커서 올리면 드롭다운 시작 -->
                        <div class="nav-item dropdown">
                 		<a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                            <div class="dropdown-menu m-0">
                            	<a href="/board/notice" class="dropdown-item">공지사항</a>
                                <a href="/admin/event" class="dropdown-item">이벤트</a>
                                <a href="/board/qna" class="dropdown-item">QnA</a>
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
                            </div>
                        </div>
                         
                
                 <c:if test="!cookieUserId=null">
                        <a href="/myPage/myPage" class="nav-item nav-link">My Page</a>
                 </c:if>
                        
                    </div>          
                      <a href="/loginOut" class="btn btn-primary py-2 px-4">로그아웃</a>                      
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
       
        
<%
	}
	else
	{
%>
        
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>My Fridge</title>
<link href="/resources/img/fridgeFavicon.png" rel="icon">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">

<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>


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
                    
                        <a href="/index.jsp" class="nav-item nav-link active">홈</a>                       
                        <a href="/recipe/bestRecipe" class="nav-item nav-link">레시피 랭킹</a>
                        <a href="/board/notice" class="nav-item nav-link">공지사항</a>
                        <a href="/board/qna" class="nav-item nav-link">Q&A</a>
                        <a href="/recipe/recipeSearch" class="nav-item nav-link">레시피찾기</a>
                        
                       
                        
                 <c:if test="!cookieUserId=null">
                        <a href="/user/login" class="nav-item nav-link">My Page</a>
                 </c:if>
                        
                    </div>
                    <!-- <a href="" class="btn btn-primary py-2 px-4">Login</a>  -->
                    <button class="btn btn-primary py-2 px-4" type="button" id="btnLogin2" onclick="location.href='/user/login' ">로그인</button>
                   
                </div>
            </nav>

        
            
        </div>
<%
	}
%>
