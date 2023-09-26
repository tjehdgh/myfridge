<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %> 

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<meta http-equiv="X-UA-Compatible" content="ie=edge"> <!-- 내가추가함 -->
	<!-- table link -->
	<link href = "/resources/css/qnatable.css" rel="stylesheet" />
    <!-- Favicon -->
    <link href="../resources/img/favicon.ico" rel="icon">

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



</script>   
<script type="text/javascript" sc="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>

</head>
<body>
       
        <!-- 네비게이션 시작 -->
         <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
        <div class="container-xxl position-relative p-0">
            

             <div class="container-xxl py-1 bg-dark hero-header mb-5" >
                <div class="container text-center my-5 pt-1 pb-4">
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">Inquiry</h1>
                    </br></br>                   
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">홈</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">문의내용</li>
                        </ol>
                    </nav>
                    
                </div>
            </div>
        </div>            
                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
                    <ul class="nav  d-inline-flex justify-content-center border-bottom mb-1">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">                    
                                <div class="ps-3">                                   
                                    <h5 class="mt-n1 mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
</svg> 공지내용</h5>
                                </div>
                            </a>
                        </li>
                      </ul>                    
                </div>

<div class="container" style="font-size: 18px">          
<table class="table table-hover">
<hr class = "subcontent_hr_bold" style = "color:black;">
<div style="font-size:30px;color:black;">My Fridge 정기점검안내(2023.09.06~2023.09.07)</div></br>
<span style="font-size:15px;color:black;">등록일 : 2023.09.06</span>&emsp;&emsp;
<span style="font-size:15px;color:black;">작성자 : 관리자</span>&emsp;&emsp;
<span style="font-size:15px;color:black;">조회수 : 151</span></br>
<hr class = "subcontent_hr_bold" style = "color:black;">
<span style="font-size:18px;color:black;">
안녕하세요. My Fridge입니다.</br></br></br>

My Fridge 웹서비스 안정화를 위한 정기점검 일정을 다음과 같이 알려드립니다.</br></br></br>


-----------------------------다 음 ------------------------------</br></br>

일 정 : 9월 06일 22:00 ~ 9월 07일 06:00</br></br></br>

점검대상 : My Fridge 전 웹사이트</br></br>

--------------------------------------------------------------------</br></br>


위 내용과 같이 해당시간에는 저희 한국디자인진흥원 전 웹사이트 이용이 불가능하오니</br></br>

착오없으시길 바랍니다.</br>

이용하시는데 불편을 드려 죄송합니다.</br></br>

저희 My Fridge 웹사이트를 이용해주셔서 감사합니다.
</span>
<hr class = "subcontent_hr_bold" style = "color:black;">
<div style="font-size:30px;color:black;">My Fridge 레시피 랭킹 업데이트</div></br>
<img class="flex-shrink-0 img-fluid rounded" src="/resources/upload/ranking1.jpg" alt="" style="width: 800px;height:700px"/>
<hr class = "subcontent_hr_bold" style = "color:black;">
<div style="font-size:30px;color:black;">My Fridge 레시피 추가 업데이트</div></br>
<img class="flex-shrink-0 img-fluid rounded" src="/resources/upload/search1.jpg" alt="" style="width: 800px;height:700px"/>
</table>
</div>
            
<form name="bbsForm" id="bbsForm" method="post">
   <input type="hidden" name="qnaSeq" value="${qnaSeq}" />  
   <input type="hidden" name="curPage" value="${curPage}" />
</form>
   
  
              
     <!-- footer 시작 -->  
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <!-- footer 종료 --> 
      
     
</body>
</html>