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
	
	var rcmChk = $("#rcmCount").val();
	var bookChk = $("#bookMark").val();
	
	if(rcmChk == 1)
	{
		 document.getElementById("btnRecipeRcm").setAttribute("class", "bi bi-hand-thumbs-up-fill");
	}
	else
	{
		document.getElementById("btnRecipeRcm").setAttribute("class", "bi bi-hand-thumbs-up");
	}
	
	if (bookChk == 1)
	{
		 document.getElementById("btnRecipeBookMark").setAttribute("class", "bi bi-heart-fill");
	}
	else
	{
		document.getElementById("btnRecipeBookMark").setAttribute("class", "bi bi-suit-heart");
	}

	
	
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
               //아이콘 변경             
               document.getElementById("btnRecipeRcm").setAttribute("class", "bi bi-hand-thumbs-up-fill");
            }
            else if(response.code == 400)
            {
               alert("로그인 후 이용해주세요.");              
            }
            else if(response.code == 404)
            {
               alert("해당 레시피를 찾을 수 없습니다..");           
            }
            
            else if(response.code == 401)
            {
            	alert("추천을 취소하셨습니다.");
            	//아이콘 변경
            	document.getElementById("btnRecipeRcm").setAttribute("class", "bi bi-hand-thumbs-up");
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
   
   //찜하기 버튼 클릭 시
   $("#btnRecipeBookMark").on("click", function() {

      var form = $("#replyForm")[0];
      var formData = new FormData(form);
      
      $.ajax({
         type:"POST",
         enctype:"multipart/form-data",
         url:"/recipe/recipeBookMarkProc",
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
               alert("찜하기가 되었습니다.");
               //아이콘 변경
               document.getElementById("btnRecipeBookMark").setAttribute("class", "bi bi-heart-fill");
            }
            else if(response.code == 400)
            {
               alert("로그인 후 이용해주세요.");              
            }
            else if(response.code == 404)
            {
               alert("해당 레시피를 찾을 수 없습니다..");           
            }
            
            else if(response.code == 401)
            {
            	alert("찜하기를 취소하셨습니다.");
            	//아이콘 변경
            	document.getElementById("btnRecipeBookMark").setAttribute("class", "bi bi-suit-heart");
            }
            else
            {
               alert("찜하기 중 오류가 발생하였습니다.");  
            }      
         },
         error:function(error)
         {
            icia.common.error(error);
            alert("찜하기 중 오류가 발생하였습니다.");
         }
      });

   });
   
});



//계량법 안내 클릭 시
function infomationView() 
{
     var imgWindow = window.open("", "ImageWindow", "width=580,height=700"); 		// 새 창 열기
     var img = document.createElement("img");
     img.src = "/resources/img/weighing.jpg";
     imgWindow.document.body.appendChild(img); 		// 새 창에 img 추가
}

//url복사 버튼 클릭 시
function urlCopy()
{
	prompt("아래 URL을 복사(Ctrl+C)하여 원하는 곳에 붙여넣기(Ctrl+V)하세요.", window.location.href);
}

//카카오톡 버튼 클릭 시
function kakaoLogin()
{
	 var imgWindow = window.open("https://accounts.kakao.com");	
}

//페이스북 버튼 클릭 시
function facebookLogin()
{
	var imgWindow = window.open("https://www.facebook.com");	
}

//트위터 버튼 클릭 시
function twitterLogin()
{
	var imgWindow = window.open("https://twitter.com");
}

</script>
</head>

<body>
       

<!-- 네비게이션 시작 -->
         <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
        <div class="container-xxl position-relative p-0">    
            

             <div class="container-xxl py-1 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-1 pb-4">
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">Recipe View</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">레시피</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">레시피 상세</li>
                        </ol>
                    </nav>
                    
                </div>
            </div>
        </div>
<!-- 네비게이션 끝 -->


<div>
  <div class="wow fadeInUp" data-wow-delay="0.1s">
     
      <!-- 내가 가진 재료로 만들 수 있는 레시피 리스트들 넣어줄 영역 -->
         <div class="container-xxl py-5">
            <div class="container">
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <br>
              
                  <!-- 흰색 배경안에서 정렬 해줄 작은 영역 시작 -->
                  <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정가능. -->
					<div class="content section_delete">
                     

       
			       <!-- 테스트 시작-->
			<div>
			  <div class="wow fadeInUp" data-wow-delay="0.1s">
			     <div class="team-item text-center rounded overflow-hidden">
			     
			      <!-- 내가 가진 재료로 만들 수 있는 레시피 리스트들 넣어줄 영역 -->
			        <div class="container-xxl py-5"> 
			            <div class="container">
			                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
			                <br>
			              
			                  <!-- 흰색 배경안에서 정렬 해줄 작은 영역 시작 -->
			                  <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정가능. -->
								<div class="content section_delete">
								
								
								<!-- 본문 시작 -->
								
								<!-- 맨위 레시피 이름, 추천, 인분, 시간 시작-->
								 <div class="container text-center my-1 pt-1 pb-1">      
							       <img id="main_thumbs" src="${recipeInfo.recipeImage}" width="400" height="300" alt="main thumb" class="portrait">
							       </br></br>
							       
							       
								   <div>
								   	<br>
								   <!-- 	<button id="btnRecipeBookMark">찜하기</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
	  								<button id="btnRecipeRcm">추천</button> -->
									  <button id="btnRecipeBookMark"  class="" style="border: 1px solid gray; background-color: #FF6666; color: white; width: 110px; height: 40px;">찜하기</button>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									  <button id="btnRecipeRcm"  class="" style="border: 1px solid gray; background-color: #FF9966; color: white; width: 80px; height: 40px;">추천</button>
									</div>
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
							                  <a href="javascript:void(0)" onclick="urlCopy()"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_url_copy.gif" data-toggle="tooltip" title="" data-original-title="레시피 주소복사"></a>
							                  <a id="kakao-link-btn" onclick="kakaoLogin()"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_k.png" data-toggle="tooltip" title="" data-original-title="카카오톡"></a>
							                  <a href="javascript:void(0)" onclick="facebookLogin()"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_f.png" data-toggle="tooltip" title="" data-original-title="페이스북"></a>
							                  <a href="javascript:void(0)" onclick="twitterLogin()"><img src="https://recipe1.ezmember.co.kr/img/mobile/icon_sns_t.png" data-toggle="tooltip" title="" data-original-title="트위터"></a>                           
							                </div>
							             </div>
							        </div>
							        <br>
							        <br>
							        <!-- 맨위 레시피 이름, 추천, 인분, 시간 끝-->
							        
							        
					        <!-- 주재료/ 부재료 시작-->
					        <div>
							  <div class="wow fadeInUp" data-wow-delay="0.1s">
							     <div class="team-item text-center rounded overflow-hidden">
							        
							        <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정가능. -->
										<div class="content section_delete">
										<br>
											
							            
							            <div class="blank_bottom"></div><!-- 회색 구분선 -->
							            <br>
							            <div class="best_tit">
							                <b>재료</b><span>Ingredients</span>
							              <div class="best_tit_rmn">
							                <button id="btnMeasureModal" type="button" class="btn btn-default" onclick="infomationView()">계량법 안내</button>
							              </div>
							            </div>
							            
							            <div class="blank_bottom"></div><!-- 회색 구분선 -->
							            <br>
							            <br>
							            
							            
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
									</div>
									</div>
									</div>
							        <!-- 주재료/ 부재료 끝-->
									        
							        <br>
							        <br>
							        
							        
							<!-- 조리과정 본문 시작 -->
							 <div>
							  <div class="wow fadeInUp" data-wow-delay="0.1s">
							     <div class="team-item text-center rounded overflow-hidden">
							     <br>
							     <div class="best_tit">
							      <br>
							        <h3>조리순서 <span>Steps</span></h3>               
							     </div>
							      <c:forEach var = "recipeCooking" items = "${cookingList}" varStatus = "status">            
										<!-- <div id="stepDiv1" class="view_step_cont media step1">${recipeCooking.cookingOrder}<div id="stepdescr1" class="media-body">${recipeCooking.cookingExplan}</div> -->
										<!-- <div id="stepimg1" class="media-right"><img src="${recipeCooking.cookingImage}"></div></div> -->
										<br>
										<br>
										<div style="text-align: left; color: orange; font-size:24px; font-weight: bold;">&nbsp;&nbsp;&nbsp;${recipeCooking.cookingOrder}</div>
										<br>
										<div><span style="text-align: left; font-size:19px;">${recipeCooking.cookingExplan}</span></div>
										<br>
										<div><img width="350" height="250" src="${recipeCooking.cookingImage}"></div>
									</c:forEach>
							      <br>
							      <br>
							     
							     </div>
							  </div>
							 </div>
							<!-- 조리과정 본문 끝 -->
							<!-- 조리과정 본문 하얀 배경 끝 -->
							        
							        <!-- 댓글은 바깥으로 빼면 어떻게 되나?? -->
							        <!-- 댓글 시작 -->
							<div>
							  <div class="wow fadeInUp" data-wow-delay="0.1s">
							        
								     <form name="replyForm" id="replyForm" method="post" enctype="multipart/form-data">
								      <div class="view_reply">
								        <div class="reply_tit" style="text-align: left;">댓글 <span id="recipeReplyCount">106</span></div>
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
										</div>
									
									
								      <div class="reply_write">
								          <textarea id="replyContent" name="replyContent" class="" placeholder="댓글을 남겨보세요!" style="height:100px; width:600px; resize:none;"></textarea>
								             <input type="hidden" id="recipeCode" name="recipeCode" value="${recipeInfo.recipeCode}" /> 
								      </div>
								      
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
								          <button type="button" id="btnRecipeReply" class="btn-primary" title="등록">등록</button>
								          </span>
								        </div>
								      
								      </div>
								    </div>
								
								       </div>
								       
				   </div>
				 </div>  
							        <!-- 댓글은 바깥으로 빼면 어떻게 되나?? -->
								<!-- 본문 시작 -->
								
					
                 </div>
             </div>
          </div>
       </div>
     </div>
  </div>
     
</div>      
 <!-- 테스트 끝-->
              
              
              
    <!-- footer 시작 -->  
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
    <!-- footer 종료 --> 
      
     <form name="bbsForm" id="bbsForm" method="post">
     <input type="hidden" name="recipeCode" value="${recipeInfo.recipeCode}" /> 
     <input type="hidden" name="curPage" value="${curPage}" />
     
     
   <input type="hidden" name ="bookMark" id = "bookMark" value="${recipeBookMarkCount}"/>
   <input type="hidden" name ="rcmCount" id= "rcmCount" value="${rcmCount}"/>
   </form>
      
</body>
 
</html>