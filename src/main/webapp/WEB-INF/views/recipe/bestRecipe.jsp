<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %> <!-- head에 빼놨으니까 익 없어도되지?-->

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
    <meta charset="UTF-8">
    <title>냉장고를 부탁해</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
<meta http-equiv="X-UA-Compatible" content="ie=edge"> <!-- 내가추가함 -->

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
<script>
function fn_list(curPage)
{
   document.bbsForm.curPage.value = curPage;  //매개변수로 받은 curPage를 value curPage에 넘김
   document.bbsForm.action = "/recipe/bestRecipe";
   document.bbsForm.submit();
}

function fn_view(recipeCode)
{
   document.bbsForm.recipeCode.value = recipeCode;  //bbsform 에 있는 레시피코드를 넘김
   document.bbsForm.action = "/recipe/recipeView";
   document.bbsForm.submit();
}

function fn_recipeRead()
{
	location.href = "/recipe/bestRecipe";
}

function fn_recipeRcm()
{
	location.href = "/recipe/bestRecipe2";
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
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">Recipe Ranking</h1></br></br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">홈</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">레시피랭킹</li>
                        </ol>
                    </nav>
                    
                </div>
            </div>
        </div>
              <!-- 네비게이션 종료 -->



 <!-- 본문 시작 -->
 <!-- 흰색 배경 테두리 시작 -->
 <div class="col-12 text-center container">
<div class="col-12">
    <div class="wow fadeInUp" data-wow-delay="0.1s">
       <div class="team-item text-center rounded overflow-hidden">
       
        <!-- 내가 가진 재료로 만들 수 있는 레시피 리스트들 넣어줄 영역 -->
            <div class="container-xxl py-5">
              <div class="container">
                  <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                  <br>
                
                   <!-- 흰색 배경안에서 정렬 해줄 작은 영역 시작 -->
                   <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정가능. -->
					<div class="content section_delete"  >
                  
                  
                  
                  <!-- 추천순 조회순 시작 -->
		              </br>
		                <div class="tab-class text-center wow fadeInUp" data-wow-delay="0.1s">
		                    <ul class="nav nav-pills d-inline-flex justify-content-center border-bottom mb-5">
		                        <li class="nav-item">
		                            <a class="d-flex align-items-center text-start mx-3 ms-0 pb-3 active" data-bs-toggle="pill" href="#tab-1">
		                                
		                                <div class="ps-3">                                   
		                                    <h5 class="mt-n1 mb-0" onclick="fn_recipeRead()"><?xml version="1.0" ?><svg class="bi bi-eye" fill="currentColor" height="16" viewBox="0 0 16 16" width="16" xmlns="http://www.w3.org/2000/svg"><path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/><path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/></svg> 조회순</h5>
		                                </div>
		                            </a>
		                        </li>
		                        <li class="nav-item">
		                            <a class="d-flex align-items-center text-start mx-3 pb-3" data-bs-toggle="pill" href="" >                        
		                                <div class="ps-3">                                  
		                                    <h5 class="mt-n1 mb-0" onclick="fn_recipeRcm()"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
										  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
										</svg> 추천순 </h5>
		                                </div>
		                            </a>
		                        </li>
		                        
		                    </ul>
		                  </div>        
		        <!-- 레시피 리스트 시작 -->
		        <!-- 추천순 조회순 끝 -->
		        
		         
		   <tbody>
        
						<c:if test ="${!empty list}">  <!-- list 객체가 비어있지 않을때 -->
						  <c:forEach var = "recipeInfo" items = "${list}" varStatus = "status">   <!-- list를 가져올떄마다 recipeInfo에넣음 -->
						  <div class="container text-center my-1 pt-1 pb-1 text-center wow fadeInUp">
						      <div class="tab-content">
						           <div id="tab-1" class="tab-pane fade show p-0 active">
				                            <div class="row g-4">
			                                <div class="col-lg-20">
			                                
			                                    <div class="d-flex align-items-center">
			                                    
			                                        <img class="flex-shrink-0 img-fluid rounded" src="${recipeInfo.recipeImage}" alt="" style="width: 130px;"/>
			                                        <div class="w-100 d-flex flex-column text-start ps-4">
			                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
			                                            
			                                            
			                                               <a href="javascript:void(0)" onclick="fn_view(${recipeInfo.recipeCode})"> <!-- 현재 레시피 코드를 가지고감 -->
			                                                <span>${recipeInfo.recipeName}</span>
			                                                </a>
			                                                <span class="text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
			  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
			</svg> : ${recipeInfo.bbsReadCnt}</span>
			                                            </h5>
			                                            <small class="fst-italic">${recipeInfo.recipeIntro}</small>
			                                            
			                                        </div>
			                                    </div>
			                                </div>                             
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
			             <!--  <hr style="border: solid 2px pink;"> --> 
			     		 </c:forEach>   
					</c:if>      

				 
				      </tbody>
		      <!-- 레시피 리스트 종료 -->    
      
      						<!-- 페이징 처리 시작 -->
							      <tfoot>
							      <tr>
							            <td colspan="5"></td>
							      </tr>
							      </tfoot>
							       
							    <nav>
							      <ul class="pagination justify-content-center">
							<c:if test = "${!empty paging}">
							   <c:if test = "${paging.prevBlockPage gt 0}">  <!-- gt - 0보다 크냐,> -->
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
							<!-- 페이징 처리 끝 -->

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
  <!-- 본문 끝 -->

              
     <!-- footer 시작 -->  
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <!-- footer 종료 --> 
      
     <form name="bbsForm" id="bbsForm" method="post">
     <input type="hidden" name="recipeCode" value="${recipeInfo.recipeCode}" /> 
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>      
</body>
</html>