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
<meta http-equiv="X-UA-Compatible" content="ie=edge">




	<!-- qna -->
	<link href="/resources/css/qna2.css" rel="stylesheet">	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"rel="stylesheet">
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
    
	   $("#btnWrite").on("click", function() {  //글쓰기 버튼
	      document.bbsForm.qnaSeq.value = "";
	      document.bbsForm.action = "/board/qnaWriteForm";
	      document.bbsForm.submit();
	   });
});
function fn_view(qnaSeq)
{
	document.bbsForm.qnaSeq.value = qnaSeq;  
	document.bbsForm.action = "/board/qnaView";
	document.bbsForm.submit();
}

function fn_list(curPage)
{
	document.bbsForm.qnaSeq.value = "";
	document.bbsForm.curPage.value = curPage;  
	document.bbsForm.action = "/board/qna";
	document.bbsForm.submit();
}

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
            

             <div class="container-xxl py-1 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-1 pb-4">
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">Q&A</h1>
                    </br></br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">홈</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">Q&A</li>
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
</svg> Q&A</h5>
                                </div>
                            </a>
                        </li>
                      </ul>                    
                </div>
                <div class="container" style="font-size: 18px">
                <div class="" data-wow-delay="0.1s">
                    <ul class="nav  d-inline-flex justify-content-center border-bottom mb-1">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">                    
                                <div class="ps-3">                                   
                                    <h5 class="mt-n1 mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
</svg> 자주찾는질문</h5>
                                </div>
                            </a>
                        </li>
                      </ul>                    
                </div>
                
 <ul class="qna">
            <li>
            &emsp;<i class="fa-solid fa-q" style="color:orange;"></i>&emsp;
                <input type="checkbox" id="qna-1">
                <label for="qna-1">다른 사람 명의의 계좌로 환불받을 수 있나요?</label>              
                <div>                
                    <p><i class="fa-solid fa-a" style="color:orange;"></i>&emsp;다른 사람 명의로는 환불할 수 없습니다. 고객님 본인 명의 계좌로만 환불이 가능합니다.</p>
                </div>
            </li>
            <li>
            &emsp;<i class="fa-solid fa-q" style="color:orange;"></i>&emsp;
                <input type="checkbox" id="qna-2">
                <label for="qna-2">냉장고안에 재료들은 넣을 수 있는데 조미료들은 따로 넣지 못하나요?</label>
                <div>
                    <p><i class="fa-solid fa-a" style="color:orange;"></i>&emsp;마이페이지에서 환불계좌 등록 및 수정이 가능합니다. 환불계좌는 주문자 명의의 본인 계좌만 등록할 수 있습니다.</p>
                    <p>&emsp;&nbsp;&nbsp;&nbsp;주문 진행 상태가 '환불진행중' 또는 '환불완료' 에서는 환불계좌를 변경할 수 없습니다.</p>
                </div>
            </li>
            <li>
            &emsp;<i class="fa-solid fa-q" style="color:orange;"></i>&emsp;
                <input type="checkbox" id="qna-3">
                <label for="qna-3">반품 신청을 철회하고 싶어요.</label>
                <div>
                    <p><i class="fa-solid fa-a" style="color:orange;"></i>&emsp;반품할 상품을 아직 보내지 않은 경우, 마이페이지에서 반품철회를 하실 수 있습니다.</p>
                    <p>&emsp;&nbsp;&nbsp;&nbsp;반품철회 후 택배사에서 상품 수거가 된 것으로 확인될 경우 해당 주문은 반품처리한 것으로 재 변경됩니다.</p>
                </div>
            </li>
            <li>
            &emsp;<i class="fa-solid fa-q" style="color:orange;"></i>&emsp;
                <input type="checkbox" id="qna-4">
                <label for="qna-4">배송된 상품이 부재중으로 반송된 경우 어떻게 하나요?</label>
                <div>
                    <p><i class="fa-solid fa-a" style="color:orange;"></i>&emsp;부재 등의 사유로 반송된 상품은 "마이페이지 > 주문 조회"]"에서 택배사 영업소, 또는 배송 담당 택배원 연락처를 통해 재배송 요청을 할 수 있습니다. 상품이 이미 반송되어 해당 업체로 입고된 경우, 왕복 배송비를 추가 부담하셔야 합니다.</p>
                </div>
            </li>
            <li>
            &emsp;<i class="fa-solid fa-q" style="color:orange;"></i>&emsp;
                <input type="checkbox" id="qna-5">
                <label for="qna-5">상품에 대해서 문의하려면 어떻게 해야 하나요?</label>
                <div>
                    <p><i class="fa-solid fa-a" style="color:orange;"></i>&emsp;상품에 관한 내용은 상품상세 화면에 자세히 안내되어 있습니다. 마이페이지 > 주문내역에서 주문한 상품을 선택하면 상세페이지로 이동합니다.</p>
                    <p>&emsp;&nbsp;&nbsp;&nbsp;상품 상세 내용에 표시되어 있지 않은 내용은 판매자에게 문의해 주십시오.</p>
                    <p>> 판매자에게 문의</p>
                    <p>&emsp;&nbsp;&nbsp;&nbsp;1. "마이페이지 > 주문내역에서 상품 선택 >  표기된 판매자 연락처로 문의</p>
                    <p>&emsp;&nbsp;&nbsp;&nbsp;2. "["마이페이지 > 1:1문의하기 > 문읜타입에서 판매자에게 문의하기"를 선택한 후 질의 내용 작성</p>
                </div>
            </li>
        </ul>
        </br>
        </br>
        </br>
        <div class="" data-wow-delay="0.1s">
                    <ul class="nav  d-inline-flex justify-content-center border-bottom mb-1">
                        <li class="nav-item">
                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">                    
                                <div class="ps-3">                                   
                                    <h5 class="mt-n1 mb-0"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
</svg> 문의하기</h5>
                                </div>
                            </a>
                        </li>
                      </ul>                    
                </div>
                </div>               
      <div class="container" style="font-size: 18px">          
      <table class="table table-hover">
      <thead>
      <tr style="background-color: #ffa500;color:black">
         <th scope="col" class="text-center" style="width:10%">번호</th>
         <th scope="col" class="text-center" style="width:55%">제목</th>
         <th scope="col" class="text-center" style="width:10%">작성자</th>
         <th scope="col" class="text-center" style="width:15%">등록일</th> 
         <th scope="col" class="text-center" style="width:15%">답변확인</th>      
      </tr>
      </thead>
      <tbody>
<c:if test ="${!empty qnaList}">  
	<c:forEach var = "qnaBoard" items = "${qnaList}" varStatus = "status">

      <tr>
      <c:choose>
         <c:when test = "${qnaBoard.qnaIndent eq 0}">
         <td class="text-center"style="color:black">${qnaBoard.qnaSeq}</td>  
         </c:when>
         <c:otherwise>
         <td class="text-center"></td>
         </c:otherwise>
	  </c:choose>
         <td>
            <a href="javascript:void(0)" onclick="fn_view(${qnaBoard.qnaSeq})"> <!-- 현재 게시물의 대한 번호를 가지고감 --> 
	  <c:if test ="${qnaBoard.qnaIndent > 0}">
	  		<img src = "/resources/images/sss.gif" style = "margin-left:${qnaBoard.qnaIndent}em" />
      </c:if>      
               <c:out value = "${qnaBoard.qnaTitle}" />  <!-- 제목 -->
            </a>

         </td>
       <td class="text-center" style="color:black">${qnaBoard.userName}</td> <!-- 작성자 -->
       <td class="text-center" style="color:black">${qnaBoard.regDate}</td> <!-- 등록일 -->
       <td class="text-center" style="color:black">${qnaBoard.ansStatus}</td> <!-- 답변확인 -->     
      </tr>
      </c:forEach>
</c:if>      
      </tbody>
      
      </table>
<%
	if(com.icia.web.util.CookieUtil.getCookie(request, (String)request.getAttribute("AUTH_COOKIE_NAME")) != null)//쿠키가 있을때(로그인 성공)
	{
%>      
      <div class="container" style="font-size: 18px">         
     <button type="button" id="btnWrite" class ="mybtn"><i class="fa-solid fa-pen"></i></button> 
     </div> 
<%
	}
%>
      <nav>
      <ul class="pagination justify-content-center">
<c:if test = "${!empty paging}">
	<c:if test = "${paging.prevBlockPage gt 0}">  
         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전</a></li>
	</c:if>
	
	<c:forEach var = "i" begin = "${paging.startPage}" end = "${paging.endPage}"> <!-- for문 -->
		<c:choose>
			<c:when test="${i ne curPage}"> <!-- 현재 페이지가 아닐때 -->
         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
         	</c:when>
         	<c:otherwise>
         <li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
         	</c:otherwise>	
        </c:choose>
   </c:forEach>
   <c:if test = "${paging.nextBlockPage gt 0}"> <!-- gt 0보다 크냐 -->
         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음</a></li>
   </c:if>
</c:if>
      </ul>
   </nav>
     
     
     
   <form name="bbsForm" id="bbsForm" method="post">
    <input type="hidden" name="qnaSeq" value="" />     
    <input type="hidden" name="curPage" value="${curPage}" />
   </form>  
      </div>              
                       
     <!-- footer 시작 -->  
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <!-- footer 종료 --> 
      
     
</body>
</html>