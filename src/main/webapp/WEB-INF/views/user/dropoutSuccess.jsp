<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<!DOCTYPE html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원 탈퇴 완료</title>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">

    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>


<!-- 우리 나중에 navigation에 있는 Favicon이랑 계층형 게시판이라고 되어 잇는거,Google Web Fonts, Icon Font Stylesheet, Libraries Stylesheet 다 
/resources/ 붙여서 다시 수정해야되용 -->


    <!-- Favicon -->
    <link href="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9yvSwTMv-e__WFBRb2kj8lNsAX7PTGCR88w&usqp=CAU" rel="icon">

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

$(document).ready(function() {
	 
	 $("#btnHome").on("click", function(){
		 location.href ="/index";
	 });
	 
});

</script>



</head>


<body>


 <!-- Navbar & Hero Start -->
        <div class="container-xxl position-relative p-0">
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="/index" class="navbar-brand p-0">
                   <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>MY Fridge</h1>
                    
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                                   <a href="/index.jsp" class="nav-item nav-link active">홈</a>
                        <a href="/recipe/bestRecipe" class="nav-item nav-link">레시피 랭킹</a>
                        <a href="/recipe/recipeSearch" class="nav-item nav-link">레시피찾기</a>
                        
                        <!--커뮤니티에 커서 올리면 드롭다운 시작 -->
                        <div class="nav-item dropdown">
                 		<a href="" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                            <div class="dropdown-menu m-0">
                            	<a href="/admin/notice" class="dropdown-item">공지사항</a>
                                <a href="/admin/event" class="dropdown-item">이벤트</a>
                                <a href="/admin/qna" class="dropdown-item">QnA</a>
                            </div>
                        </div>
                        <!--커뮤니티에 커서 올리면 드롭다운끝  -->
                        
                
                    </div>          
                      <a href="/login" class="btn btn-primary py-2 px-4">로그인</a>                      
                </div>
            </nav>

            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">회원 탈퇴 완료</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">홈</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">회원 탈퇴 완료</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->




        <!-- 본문 테두리 Start -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
          
 
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">My Page</h5>
                    <h1 class="mb-5">회원 탈퇴 완료</h1>
                </div>
                
	             <!-- 본문 내용 시작 -->
				 <div class="container-xxl">
	             	<div class="row">
	             	<!-- 흰색배경 테두리 시작 -->
	             		 <div>
		                    <div class="col-lg-12 col-md-13 wow fadeInUp" data-wow-delay="0.1s"> 
		                        <div class="team-item text-center rounded overflow-hidden" d-flex justify-content-center>
		                            
	                           	<!-- 회원 탈퇴 본문 내용들을 가장큰 본문 흰테두리 안세서 옆에 여백을 줘서 깔끔하게 보이기 위한 더 작은 영역 시작-->
			                       <div class="col-12 wow fadeInUp justify-content-center" data-wow-delay="0.1s">
									    <div class="team-item text-center overflow-hidden">
									    	
								
										        <!-- 탈퇴안내 경고 영역 시작 -->
										        <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정할 수 있습니다. -->
										            <div class="content">
											             <br>
											             <br><!-- 흰색배경 맨 위와 본문내용 간의 공간위한 br -->
											             
											             <h6 style="text-align: left;"> <span style="color: orange; font-size: 19px; ">✔&nbsp</span>회원탈퇴 신청이 완료되었습니다.</h6>
											             <br>
											             <p style="text-align: left; font-size: 14px;">안녕하세요. My fridge입니다.
											             <br>
											             My fridge 계정 ${user.userId}의 탈퇴가 완료되었습니다.
											             </p>
											             <hr><!-- 가로선 넣는 태그 -->
													     
													     <br> 
													     <h5 style="text-align: left;"> <span style="color: orange; font-size: 24px; ">✔&nbsp</span>탈퇴된 회원 정보</h5>
													         <div style="border: 2px solid orange; padding: 10px;">
													             <table class="col-10" style="border: 1px solid gray;" >
																  <tbody>
																    <tr >
																      <td style="border: 1px solid gray; width: 140px; font-size: 14px; text-align: left; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden; ">사용자 아이디</td>
																      <td style="border: 1px solid gray; text-align:left; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${user.userId}</td>
																    </tr>
																    <tr>
																      <td style="border: 1px solid gray; width: 140px; text-align: left; font-size: 14px; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">사용자 이름</td>
																      <td style="border: 1px solid gray; text-align:left; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${user.userName}</td>
																    </tr>
																    <tr>
																      <td style="border: 1px solid gray; width: 130px; text-align: left; font-size: 14px; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">사용자 닉네임</td>
																      <td style="border: 1px solid gray; text-align:left; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${user.userNickname}  </td>
																    </tr>
																    <tr>
																      <td style="border: 1px solid gray; width: 130px; text-align: left; font-size: 14px; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">사용자 주소</td>
																      <td style="border: 1px solid gray; text-align:left; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;;">: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${user.userAddress}</td>
																    </tr>
																    <tr>
																      <td style="border: 1px solid gray; width: 130px; font-size: 14px; text-align: left; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">사용자 계좌번호</td>
																      <td style="border: 1px solid gray; text-align:left; border-right: hidden; border-top: hidden; border-left: hidden; border-bottom: hidden;">: &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ${user.userAccount} </td>
																    </tr>
																  </tbody>
																</table>
														</div>
												
														<hr><!-- 가로선 넣는 태그 -->
											             
											             <!-- 설명영역 시작 -->
											             <p style="text-align: left; font-size: 14px;"><span style="color: orange; font-size: 22px; ">• </span>계정이 탈퇴된 이후에는 서비스 이용기록(유저정보, 나의 냉장고 데이터 등)의 데이터 복원이 불가능합니다.
											             <br>
											             <span style="color: orange; font-size: 22px; ">• </span> My fridge 서비스 사용과 관련하여 궁금하신 사항이 있으시면 QnA 게시판을 확인해 보세요.
											             <br>
											             </p>
											             
											             <hr><!-- 가로선 넣는 태그 -->
											             
											             <p style="text-align: left; font-size: 14px;">
											             그 동안 My fridge 서비스를 이용해주셔서 감사합니다.
											             <br>
											             다시 My fridge를 찾아오실 땐 꼭 더 나은 서비스를 제공할 수 있도록 노력하겠습니다.
											             <br>감사합니다.
											             </p>
											              
											             <!-- 설명영역 끝 -->
											             
									             	    <!-- 버튼 -->
							                            <div class="input-group-append">
												        <button class="btn-warning" type="button" id="btnHome" name="btnHome" style="width: 120px; height: 40px;">홈으로 가기</button>
												        </div>
												        <br>
												        <br>
												       <!-- 버튼 -->
											  
										            </div>
			                               		</div>
			                               		<!-- 본문 내용 끝 -->
			                               	
		                               	</div>
		                           </div>
		                           <!-- 회원 탈퇴 본문 내용들을 가장큰 본문 흰테두리 안세서 옆에 여백을 줘서 깔끔하게 보이기 위한 더 작은 영역 끝-->
		                           
		                           
		                        </div>
		                    </div>
		                </div>
	             	  <!-- 흰색배경 테두리 끝 -->
	             	</div>
	             </div>
				 <!-- 본문 내용 끝-->                  
			</div><!-- 본문 테두리 바깥에서 두번째 div -->
						                    
	</div><!-- 이게 바탕이 네모낳게 하얀색 + 테두리 그림자 있게 해주는 div --> <!-- 본문 테두리 가장 바깥쪽 div  -->
	<!-- 본문 끝 -->  
						
						
        
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
        <!-- Footer End -->

        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

   
</body>

</html>