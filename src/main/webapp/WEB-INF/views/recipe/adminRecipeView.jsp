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
    
    <!-- 만개의 레시피 css -->
    <link href="/resources/css/man.css" rel="stylesheet">

<script type="text/javascript" sc="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>


<style type="text/css">
#oldContArea img {max-width:100%;height:auto;}
.view_step_cont .none {display:none;}
.view_step_cont .carousel.slide {border:none; box-shadow:none; margin:0; padding:0;}
.view_step_cont .media-right .carousel.slide {width:300px;}
.view_step_cont .media-right {width:300px;}
.view_step_cont .carousel-control {padding:0;}
.view_step_cont .carousel-indicators {bottom:-36px;}
.view_step_cont .carousel-indicators li {width:10px; height:10px;}
.centeredcrop { position: relative; width:100%; overflow: hidden; height:400px;}
.centeredcrop img {position: absolute;left:50%;top: 50%;width: 100%; height:auto;
  -webkit-transform: translate(-50%,-50%);-ms-transform: translate(-50%,-50%);transform: translate(-50%,-50%);}
.centeredcrop img.portrait {width: auto; height:100%;}
.modal-body .btn_list {text-align:center; padding:12px 0 0 0;}
.modal-body .btn_list a {text-align:center; font-size:11px; color:#444; width:23%; display:inline-block;}
.modal-body .btn_list a img {border-radius:50%; width:69px; height:69px;}
.centeredcrop2 {display: flex;flex-direction: column;flex-wrap: wrap;align-items: flex-start;width:100%;height: 400px;}
.centeredcrop2 img {object-fit:cover;width:600px;height:400px;}
.centeredcrop2 img.portrait {width: auto; height:100%;}

.swiper-slide {text-align: center;font-size: 18px;display: -webkit-box;display: -ms-flexbox;display: -webkit-flex;display: flex;-webkit-box-pack: center;-ms-flex-pack: center;-webkit-justify-content: center;justify-content: center;-webkit-box-align: center;-ms-flex-align: center;-webkit-align-items: center;align-items: center;}
.view2_box .swiper-substance span {position:absolute; font-size: 12px;color: #fff;text-shadow: 0.1em 0.1em 0.15em #333;margin-left:2px;z-index:100;}
.view2_box .swiper-substance img {max-width:180px; border-radius:6px;}
.sp_pdt_wrap .swiper-substance span {text-shadow:none}
</style>

<script type="text/javascript">
function fn_list(curPage)
{
   document.bbsForm.curPage.value = curPage;  //매개변수로 받은 curPage를 value curPage에 넘김
   document.bbsForm.action = "/recipe/recipeView";
   document.bbsForm.submit();
}


//등록버튼 클릭 시
$(document).ready(function(){
   $("#btnRecipeReply").on("click", function() {

      if($.trim($("#replyContent").val()).length <= 0)
      {
         alert("내용 입력하세요.");
         $("#replyContent").val("");
         $("#replyContent").focus();
         return;
      }
      
      var form = $("#replyForm")[0];
      var formData = new FormData(form);
      
      $.ajax({
         type:"POST",
         enctype:"multipart/form-data",
         url:"/recipe/recipeReplyProc",
         data:formData,
         processData:false,
         contentType:false,
         cache:false,
         beforeSend:function(xhr)
         {
            xhr.setRequestHeader("AJAX", "true");
         },
         success:function(response)
         {
            if(response.code == 0)
            {
               alert("댓글이 작성되었습니다.");
               location.reload(); // 현재 페이지 새로고침
                 $("#recipeReplyContent").focus(); // id가 recipeReplyContent인 곳으로 포커스 이동(추후 수정 예정)

            }
            else if(response.code == 400)
            {
               alert("로그인 후 이용해주세요.");
               
            }
            else if(response.code == 404)
            {
               alert("해당 레시피를 찾을수 없습니다.");
               location.href = "/recipe/bestRecipe";
            }
            else
            {
               alert("오류가 발생하였습니다.");
               
            }
         },
         error:function(error)
         {
            icia.common.error(error);
            alert("답변 등록중 오류가 발생하였습니다.");
            $("#btnRecipeReply").prop("disabled", false);
         }
      });

   });
   
   //추천버튼 클릭 시
   $("#btnRecipeRcm").on("click", function() {

      var form = $("#replyForm")[0];
      var formData = new FormData(form);
      
      $.ajax({
         type:"POST",
         enctype:"multipart/form-data",
         url:"/recipe/recipeRcmProc",
         data:formData,
         processData:false,
         contentType:false,
         cache:false,
         beforeSend:function(xhr)
         {
            xhr.setRequestHeader("AJAX", "true");
         },
         success:function(response)
         {
            if(response.code == 0)
            {
               alert("추천되었습니다.");
               location.reload(); // 현재 페이지 새로고침
                 

            }
            else if(response.code == 400)
            {
               alert("해당 레시피를 찾을 수 없습니다.");
               
            }
            else if(response.code == 404)
            {
               alert("로그인 후 이용해주세요.");
               
            }
            else
            {
               alert("로그인 후 이용해주세요.");
               
            }
         },
         error:function(error)
         {
            icia.common.error(error);
            alert("추천중 오류가 발생하였습니다.");
         }
      });

   });
   
});

//계량법 안내 클릭 시
function infomationView() 
{
    var imgWindow = window.open("", "ImageWindow", "width=580,height=700"); // 새 창 열기
     var img = document.createElement("img");
     img.src = "/resources/img/weighing.jpg";
     imgWindow.document.body.appendChild(img); // 새 창에 img 추가
}

</script>
</head>

<body>
       
        <!-- 네비게이션 시작 -->
         <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
        <div class="container-xxl position-relative p-0">
            

            <div class="container-xxl py-1 bg-dark hero-header mb-1">
                <div class="container text-center my-1 pt-1 pb-1">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">
                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
               <h3 class="section-title ff-secondary text-center text-primary fw-normal">Recipe View</h3>
                  
                </div>
               </h1>
                    <nav aria-label="breadcrumb">
                        
                    </nav>
                </div>
            </div>
        </div>
        <!-- 네비게이션 종료 -->
       
              
       <!-- 레시피 상세조회 시작-->
       <div class="container text-center my-1 pt-1 pb-1">      
       <img id="main_thumbs" src="${recipeInfo.recipeImage}" alt="main thumb" class="portrait">
       
       <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
</svg>
       <button type="button" id="btnRecipeRcm" class="btn btn-primary" title="추천">추천하기</button>
       
       
      </br></br>
      <h3>${recipeInfo.recipeName}</h3>
      <div class="view2_summary_in" id="recipeIntro">${recipeInfo.recipeIntro}<br>
        </div>        
                <div class="view2_summary_info">
                <span class="view2_summary_info1">${recipeInfo.recipeQnt}</span>
                <span class="view2_summary_info2">${recipeInfo.recipeTime}</span>
                </div>
                
             <div class="modal-body">
                <div class="btn_list">
                  <a href="javascript:void(0)" onclick="copyBbsUrl()"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_url_copy.gif" data-toggle="tooltip" title="" data-original-title="레시피 주소복사"></a>
                  <a id="kakao-link-btn" href="javascript:void(0)" onclick="snsWriter('kakaoTalk')"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_k.png" data-toggle="tooltip" title="" data-original-title="카카오톡"></a>
                  <a href="javascript:void(0)" onclick="snsWriter('facebook')"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_f.png" data-toggle="tooltip" title="" data-original-title="페이스북"></a>
                  <a href="javascript:void(0)" onclick="snsWriter('twitter')"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_t.png" data-toggle="tooltip" title="" data-original-title="트위터"></a>
                </div>
             </div>
                    </div>
        <div class="blank_bottom"></div>

        
                <div class="cont_ingre2">
            <div class="best_tit">
                <b>재료</b><span>Ingredients</span>
              <div class="best_tit_rmn">
                <button id="btnMeasureModal" type="button" class="btn btn-default" onclick="infomationView()">계량법 안내</button>
              </div>
            </div>
            
            <div class="ready_ingre3" id="divConfirmedMaterialArea">
                  <ul>
                    <b class="ready_ingre3_tt">[주재료]</b>
                 
                 
                 <!-- 레시피 코드가 있을 경우 -->
                <c:if test ="${!recipeIrdnt.recipeCode}">   
                    <c:forEach var = "recipeIrdnt" items = "${irdntList}" varStatus = "status">                                            
                          <li>${recipeIrdnt.irdntName}        
                           <span class="ingre_unit">${recipeIrdnt.irdntAmount}</span>
                        </li>
                          
                     </c:forEach> 
                 </c:if>                                                                                  
                  </ul>
                  
                 <ul>
                    <b class="ready_ingre3_tt">[부재료]</b>
                  <!-- 레시피 코드가 있을 경우 -->
                <c:if test ="${!recipeIrdnt2.recipeCode}">   
                    <c:forEach var = "recipeIrdnt2" items = "${irdntList2}" varStatus = "status">                                                        
                        <li>${recipeIrdnt2.irdntName}                                                      
                        <span class="ingre_unit">${recipeIrdnt2.irdntAmount}</span>
                  </li>
                  
                  </c:forEach>
            </c:if>
         
                   </ul>
                   
                 
             </div>  
 
    <div class="blank_bottom"></div>

        <div class="view_step">
            <div class="best_tit">
                <b>조리순서</b><span>Steps</span>               
            </div>
  
  

<c:forEach var = "recipeCooking" items = "${cookingList}" varStatus = "status">            
<div id="stepDiv1" class="view_step_cont media step1">${recipeCooking.cookingOrder}<div id="stepdescr1" class="media-body">${recipeCooking.cookingExplan}</div>
<div id="stepimg1" class="media-right"><img src="${recipeCooking.cookingImage}"></div></div>
</c:forEach>

        </div>   
 
 <!-- 레시피 상세조회 종료 -->   
 <div class="blank_bottom"></div>
 
     <!-- 댓글 시작 -->
     <form name="replyForm" id="replyForm" method="post" enctype="multipart/form-data">
      <div class="view_reply">
        <div class="reply_tit">댓글 <span id="recipeReplyCount">106</span></div>
<c:forEach var = "recipeReply" items = "${replyList}" varStatus = "status">      
 <div id="recipeCommentList_1">    
   <div class="media reply_list">
         
         
        <div class="media-left">
        <img id="userProfile" class="media-object" src="/resources/img/testimonial-4.jpg" data-holder-rendered="true">
        <div class="media-body">
        <b id="userNickname" class="info_name_f">${recipeReply.userNickname}</b>
        
        <c:if test="${boardMe eq 'Y'}">   
        <button type="button" id="btnRecipeReplyDelete" class="btn btn-primary" title="삭제">삭제</button>
        </c:if>
        
         <h4 id="regDate"class="media-heading">${recipeReply.regDate}</h4>
        <h6 id="recipeReplyContent">${recipeReply.replyContent}</h6>
        </div>
        </div>
            
    </div>
 </div> 
</c:forEach>  
      <div class="reply_write">
        <div class="input-group" style="width:1000px;">
          <textarea id="replyContent" name="replyContent" class="form-control" placeholder="댓글을 남겨보세요!" style="height:100px; width:100%; resize:none;"></textarea>
             <input type="hidden" id="recipeCode" name="recipeCode" value="${recipeInfo.recipeCode}" /> 
       </form>
     <!-- 댓글 종료 -->
       
       
       
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
       
          <span class="input-group-btn">
          
          <button type="button" id="btnRecipeReply" class="btn btn-primary" title="등록">등록</button>
          
          
          
          
          </span>
        </div>
      
      </div>
    </div>

       </div>       
     <!-- footer 시작 -->  
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <!-- footer 종료 --> 
      
     <form name="bbsForm" id="bbsForm" method="post">
     <input type="hidden" name="recipeCode" value="${recipeInfo.recipeCode}" /> 
     <input type="hidden" name="curPage" value="${curPage}" />
   </form>
      
</body>
 
</html>