<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

  


<!DOCTYPE html>

<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="utf-8">
    <title>냉장고를 부탁해 - 로그인</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    
    <!-- login.css -->
	<link href="/resources/css/login.css" rel="stylesheet">
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
	
	   $("#btnIdFind").on("click",function(){
		   window.open("/user/idFindPage", "a", "width=1000, height=500, left=100, top=50"); 
	   });
	   
   
   $("#btnLogin1").on("click", function() {
      
   		fn_loginCheck();
      
   });
   
   $("#btnRegForm").on("click", function() {
   
   
   		location.href = "/user/regForm";
 
   });
   $("#btnLogin3").on("click", function(){
			
  		fn_adminLoginCheck();
  	});
});

	


function fn_loginCheck()
{
   if($.trim($("#userId").val()).length <= 0)
   {
      alert("아이디를 입력하세요");
      $("#userId").focus();
      return;
      
   }
   
   if($.trim($("#userPwd").val()).length <= 0)
   {
      alert("비밀번호를 입력하세요");
      $("#userPwd").focus();
      return;
      
   }
   $.ajax({  
      type:"POST",
      url:"/user/loginProc",
      data:{
         userId:$("#userId").val(),
         userPwd:$("#userPwd").val()
      },
      datatype:"JSON",
      beforeSend:function(xhr){  //서버에 보내기전에 호출되는 함수
         xhr.setRequestHeader("AJAX","true"); //RequestHeader 에 ajax통신정보를을 삽입
      },
      success:function(response){
         if(!icia.common.isEmpty(response))//응답이 있을 때
         {
            var code = icia.common.objectValue(response,"code",-500);
            if(code == 0)
            {
               location.href = "/index";
            }
            else
            {
               if(code == -1)
               {
                  alert("비밀번호가 틀렸습니다.");
                  $("#userPwd").focus();
               }
               else if(code == 404)
               {
                  alert("아이디와 일치하는 사용자 정보가 없습니다.");
                  $("#userId").focus();
               }
               else if(code == 400)
               {
                  alert("파라미터값이 올바르지 않습니다.");
                  $("#userId").focus();
               }
               else
               {
                  alert("오류가 발생했습니다.");
                  $("#userId").focus();
               }
            }
         }
         else
         {
            alert("오류가 발생했습니다.");
            $("#userId").focus();
         }
      },
      complete:function(data) //응답이 종료되면 실행
      {
         icia.common.log(data);
      },
      error:function(xhr , status , error)
      {
         icia.common.error(error);
      }
                           
   });
}

function fn_adminLoginCheck()
{
   if($.trim($("#adminId").val()).length <= 0)
   {
      alert("아이디를 입력하세요");
      $("#adminId").focus();
      return;
      
   }
   
   if($.trim($("#adminPwd").val()).length <= 0)
   {
      alert("비밀번호를 입력하세요");
      $("#adminPwd").focus();
      return;
      
   }
   $.ajax({  
      type:"POST",
      url:"/user/adminLoginProc",
      data:{
    	  adminId:$("#adminId").val(),
         adminPwd:$("#adminPwd").val()
      },
      datatype:"JSON",
      beforeSend:function(xhr){  //서버에 보내기전에 호출되는 함수
         xhr.setRequestHeader("AJAX","true"); //RequestHeader 에 ajax통신정보를을 삽입
      },
      success:function(ajaxResponse){
         if(!icia.common.isEmpty(ajaxResponse))//응답이 있을 때
         {
            var code = icia.common.objectValue(ajaxResponse,"code",-500);
            if(code == 0)
            {
               location.href = "/admin/adminIndex";
            }
            else
            {
               if(code == -1)
               {
                  alert("비밀번호가 틀렸습니다.");
                  $("#adminPwd").focus();
               }
               else if(code == 404)
               {
                  alert("아이디와 일치하는 사용자 정보가 없습니다.");
                  $("#adminId").focus();
               }
               else if(code == 400)
               {
                  alert("파라미터값이 올바르지 않습니다.");
                  $("#adminId").focus();
               }
               else
               {
                  alert("오류가 발생했습니다.");
                  $("#adminId").focus();
               }
            }
         }
         else
         {
            alert("오류가 발생했습니다.");
            $("#adminId").focus();
         }
      },
      complete:function(data) //응답이 종료되면 실행
      {
         icia.common.log(data);
      },
      error:function(xhr , status , error)
      {
         icia.common.error(error);
      }
                         
   });
   
}


</script>


</head>

<body>

<%@ include file="/WEB-INF/views/include/navigation.jsp" %> 
    <div class="container-xxl bg-white p-0">
        <!-- Spinner Start --
        <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                <span class="sr-only">Loading...</span>
            </div>
        </div>
        <!-- Spinner End -->


        <!-- Navbar & Hero Start --
        <div class="container-xxl position-relative p-0">
          <nav class="navbar navbar-expand-lg navbar-dark bg-dark px-4 px-lg-5 py-3 py-lg-0">
                <a href="" class="navbar-brand p-0">
                 <h1 class="text-primary m-0"><i class="fa fa-utensils me-3"></i>Restoran</h1>
                    <!-- <img src="img/logo.png" alt="Logo"> --
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0 pe-4">
                        <a href="index.html" class="nav-item nav-link">Home</a>
                        <a href="about.html" class="nav-item nav-link">About</a>
                        <a href="service.html" class="nav-item nav-link">Service</a>
                        <a href="menu.html" class="nav-item nav-link">Menu</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle active" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="booking.html" class="dropdown-item active">Login</a>
                                <a href="team.html" class="dropdown-item">Our Team</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a>
                    </div>
                    <a href="" class="btn btn-primary py-2 px-4">Book A Table</a>
                </div>
            </nav>
-->
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">login</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index.jsp">홈</a></li>         
                            <li class="breadcrumb-item"><a href="#">Pages</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">로그인/회원가입</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
        <div class="container-xxl py-0 px-0 wow fadeInUp"  data-wow-delay="0.1s"> 
            <div class="row g-0">
                <div class="col-md-6">
                 
                  <!-- <div class="image"> -->
                  <div class="container" >
                     <img src="/resources/img/bg-hero.jpg" alt="로그인 음식 이미지" width="800" height="804">
                            
                    </div>  
                </div>
                
                <div class="col-md-6 bg-dark d-flex align-items-center">
                    <div class="p-5 wow fadeInUp" data-wow-delay="0.2s">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal">Welcome Back</h4>
	<div class="login-wrap">
  	<div class="login-html">
    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label>
    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Admin</label>
    <div class="login-form">
      <div class="sign-in-htm">
    	<div class="group">
         	<label for="userId" class="label" >Your ID</label>
         	<input id="userId" type="text" class="input form-control" placeholder="Your ID">
        </div>
        <div class="group">
          	<label for="userPwd" class="label">Your Password</label>
          	<input id="userPwd" type="password" class="input form-control" name="userPwd" placeholder="Your Password">
        </div></br>
        <div class="col-12">
        	<button id="btnLogin1" class="btn btn-primary w-100 py-3" type="button">Login</button>
        </div>
        <div>----------------------------------------------OR----------------------------------------------</div>
        <div class="col-12">
        	<button id="btnRegForm" class="btn btn-primary w-100 py-3" type="button">sign up</button>
        	<br/><br/><br/>
<button id="btnIdFind" name= "btnIdFind" class="btn btn-primary w-20 py-1" type="button">아아디 및 비밀번호 찾기</button>
        </div>       
   </div>
    
    <!-- ------------------------------admin ------------------------------------------------->
    <div class="sign-up-htm"> 	   	
    <div class="group">
         <label for="adminId" class="label" >Admin ID</label>
         <input id="adminId" name ="adminId" type="text" class="input form-control" placeholder="Admin ID">
    </div>
    <div class="group">
         <label for="adminPwd" class="label">Admin Password</label>
         <input id="adminPwd" type="password" class="input form-control" name="adminPwd" placeholder="Admin Password">
    </div></br>
    <div class="col-12">
        <button id="btnLogin3" class="btn btn-primary w-100 py-3" type="button">Admin Login</button>
    </div>                 
    </div>
    </div>	
    </div>                                                                                                                                                                                                                                                      
     </div>
    </div>                                                                                           
                    </div>
                </div>
            </div>
        </div>




        <!-- Reservation Start -->
       

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container py-5">
                <div class="row g-5">
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Company</h4>
                        <a class="btn btn-link" href="">About Us</a>
                        <a class="btn btn-link" href="">Contact Us</a>
                        <a class="btn btn-link" href="">Reservation</a>
                        <a class="btn btn-link" href="">Privacy Policy</a>
                        <a class="btn btn-link" href="">Terms & Condition</a>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Contact</h4>
                        <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
                        <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
                        <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
                        <div class="d-flex pt-2">
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-twitter"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-facebook-f"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-youtube"></i></a>
                            <a class="btn btn-outline-light btn-social" href=""><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Opening</h4>
                        <h5 class="text-light fw-normal">Monday - Saturday</h5>
                        <p>09AM - 09PM</p>
                        <h5 class="text-light fw-normal">Sunday</h5>
                        <p>10AM - 08PM</p>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal mb-4">Newsletter</h4>
                        <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
                        <div class="position-relative mx-auto" style="max-width: 400px;">
                            <input class="form-control border-primary w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                            <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="copyright">
                    <div class="row">
                        <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                            &copy; <a class="border-bottom" href="#">냉장고를 부탁해</a>, All Right Reserved.
                     
                     <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                     Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a><br><br>
                            Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
                        </div>
                        <div class="col-md-6 text-center text-md-end">
                            <div class="footer-menu">
                                <a href="/index">홈</a>
                                <a href="">공지사항</a>
                                <a href="">즐겨찾기</a>
                                <a href="">Q&A</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
   

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/lib/wow/wow.min.js"></script>
    <script src="/resources/lib/easing/easing.min.js"></script>
    <script src="/resources/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/lib/counterup/counterup.min.js"></script>
    <script src="/resources/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/resources/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/resources/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/resources/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/js/main.js"></script>
   

</body>

</html>