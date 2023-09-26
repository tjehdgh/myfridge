<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ include file="/WEB-INF/views/include/taglib.jsp" %> 

<!DOCTYPE html>
<html>
 <%@ include file="/WEB-INF/views/include/head.jsp" %>

 <script> 
	
	var chkVal = "";
	var numberCheck = /^[0-9]+$/; 
    $(document).ready(function() {
		 

    	$("#btnFridgeSearch").on("click", function() {	
    	
    		document.fridgeForm.myFridgeSearch.value = $("#_myFridgeSearch").val();
    		document.fridgeForm.submit();
    		document.fridgeForm.action = "/user/fridge";
    	}); 
    	  	
    	
    	$("#btnDelete").on("click", function() {
    		$('input:checkbox[name=horns]').each(function (index) {
    			if($(this).is(":checked")==true){
    				if(chkVal == "")
    				{
    					chkVal = $(this).val();
    				}
    				else
    				{
    					chkVal = chkVal + "," + $(this).val();
    				}	
    		    }
    		});
    		$.ajax({
			      type:"POST",
			      url:"/user/fridgeDelete",
			      data:{
			    	 irdntName:chkVal
			      },
			      datatype:"JSON",
			      beforeSend:function(xhr)
			      {
			         xhr.setRequestHeader("AJAX","true");
			      },
			      success:function(response)
			      {
			         if(response.code == 0)
			         {
			            alert("재료 삭제 성공");
			        	location.href ="/user/fridge";
			         }   
			         else if(response.code == 500)
			         {
			            alert("재료 삭제시 에러 발생");
			            
			         }   
			         else
			         {
			            alert("실패 222");
			         }   
			      },
			      error:function(xhr, status, error)
			      {
			         icia.common.error(error);    
			      }
			   });
    	
    		
     	}); 
    	

    	
    	$("#btnIrdntsearch").on("click", function() {	
    		
    		document.fridgeForm.irdntSearch.value = $("#_irdntSearch").val();
    		document.fridgeForm.submit();
    		document.fridgeForm.action = "/user/fridge";
    	});
    	
    	$("#btnRecipeSearch").on("click",function()
		{
    		document.fridgeForm.myRecipeSearch.value = $("#_myRecipeSearch").val();
    		document.fridgeForm.submit();
    		document.fridgeForm.action = "/user/fridge";
		});
    }); 
	function fn_update(name, val)
	{
		var amount = val;
		var irdntName = name;
		
		if(numberCheck.test($("#val").val()))
		{		
			alert ("숫자만 입력 가능합니다.")
			return;
		}
		
		 if (confirm("수정 하시겠습니까 ?"))
			 {
				 $.ajax({
				      type:"POST",
				      url:"/user/fridgeUpdate",
				      data:{
				    	 irdntName:irdntName,
				         fridgeIrdntAmount:amount
				      },
				      datatype:"JSON",
				      beforeSend:function(xhr)
				      {
				         xhr.setRequestHeader("AJAX","true");
				      },
				      success:function(response)
				      {
				         if(response.code == 0)
				         {
				            alert("재료 수정 성공");
				        	location.href ="/user/fridge";
				         }   
				         else if(response.code == 500)
				         {
				            alert("재료 수정 시 에러 발생");
				            
				         }   
				         else
				         {
				            alert("알 수 없는 에러 발생");
				        
				         }   
				      },
				      error:function(xhr, status, error)
				      {
				         icia.common.error(error);    
				      }
				   });
				
			 }
			 else
			 {
				 return;
			 }
	}
	
	function fn_fridgeList (myFridgeCurPage)
    {
		document.fridgeForm.myFridgeSearch.value = $("#_myFridgeSearch").val();
		document.fridgeForm.myFridgeCurPage.value = myFridgeCurPage;  //매개변수로 받은 curPage를 value curPage에 넘김
		document.fridgeForm.action = "/user/fridge";
		document.fridgeForm.submit();
    }
	
	function fn_irdntList(irdntCurPage)
	{
		document.fridgeForm.irdntSearch.value = $("#_irdntSearch").val();
		document.fridgeForm.irdntCurPage.value = irdntCurPage;  //매개변수로 받은 curPage를 value curPage에 넘김
		document.fridgeForm.action = "/user/fridge";
		document.fridgeForm.submit();
	}
	
	function fn_recipeList(myRecipeCurPage)
	{
		document.fridgeForm.myRecipeSearch.value = $("#_myRecipeSearch").val();
		document.fridgeForm.myRecipeCurPage.value = myRecipeCurPage;  //매개변수로 받은 curPage를 value curPage에 넘김
		document.fridgeForm.action = "/user/fridge";
		document.fridgeForm.submit();
	}
		
	function fn_recipeView(recipeCode)
	{
	   document.fridgeUpdateForm.recipeCode.value = recipeCode;  //bbsform 에 있는 레시피코드를 넘김
	   document.fridgeUpdateForm.action = "/recipe/recipeView";
	   document.fridgeUpdateForm.submit();
	}
	
	function fn_insertIrdnt(irdntName)
	{ 
		
		var value = prompt('무게를 입력해주세요 (단위는g 입니다)');

		document.fridgeUpdateForm.irdntName.value = irdntName;
		document.fridgeUpdateForm.fridgeIrdntAmount.value = value;
		$.ajax({
		      type:"POST",
		      url:"/user/myFridgeInsert",
		      data:{
		    	  fridgeIrdntAmount:value,
		    	  irdntName:irdntName
		      },
		      datatype:"JSON",
		      beforeSend:function(xhr)
		      {
		         xhr.setRequestHeader("AJAX","true");
		      },
		      success:function(response)
		      {
		         if(response.code == 0)
		         {
		            alert("재료 넣기 성공");
		        	location.href ="/user/fridge";
		         }   
		         else if(response.code == 100)
		         {
		            alert("중복된 재료는 넣을 수 없습니다.");
		            
		         }   
		         else if(response.code == 300)
		         {
		            alert("재료 추가시 에러 발생");
		        
		         }   
		      },
		      error:function(xhr, status, error)
		      {
		         icia.common.error(error);    
		      }
		   });
	}
    	
    </script>
<head>
    <meta charset="UTF-8">
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
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">Recipe Searching</h1></br></br>
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
              
             <div class="container-xxl pt-5 pb-3">
    <div class="container">
        <div class="row">
            <!-- 본문 시작 -->
            <div class="col-lg-9">
                <div class="content">
                    <!-- 본문 콘텐츠 -->
                    
                    <!-- 흰색 배경 테두리 시작 -->
                    <div class="wow fadeInUp" data-wow-delay="0.1s">
                       <div class="team-item text-center rounded overflow-hidden">
                       
                       
				                    <!-- Menu Start -->
				                    <div class="container-xxl py-5">
				                        <div class="container">
				                            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				                                <h5 class="section-title ff-secondary text-center text-primary fw-normal">My Fridge</h5>
				                                <h2 class="mb-5">재료 검색하기</h2>
				                            </div>                                               
				                 <!-- 리스트 박스와 검색 상자를 같은 줄에 놓기 위해서 -->
								               <div>                   
								                                  <!-- 리스트 박스 -->                 
								                        <!-- 검색 상자 -->
								                     <div class="container mt-4">
								                         <div class="input-group mb-3">
								                             <input id ="_irdntSearch" name="_irdntSearch" type="text" class="form-control" placeholder="검색어 입력" aria-label="검색어 입력" aria-describedby="basic-addon2"
								                             value ="${irdntSearchValue}">
								                             <div class="input-group-append">
								                                 <button class="btn-primary" type="button" id="btnIrdntsearch" style="color: white; height: 40px;" >검색</button>
								                             </div>
								                  
								                         </div>
								                     </div>
								               </div>               
						           				 <!-- 검색버튼 있는 리스트목록  -->                      
				                            </div>
				                        </div>
				     
				     <!-- 재료 목록 가운데 정렬하기 위한 테두리 div 시작-->             
				        <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정가능. -->
							<div class="content section_delete" style="text-align: left;  font-size: 14px;">
				               
				                <c:if test ="${!empty irdntInfoList}">
				                  <c:forEach var = "irdnt" items = "${irdntInfoList}">
				                  
					                    <div class="tab-content">
					                        <div id="tab-1" class="tab-pane fade show p-0 active">
					                            <div class="row g-4">
					                                <div class="col-lg-6">
					                                    <div class="d-flex align-items-center">
					                                        <img class="flex-shrink-0 img-fluid rounded" src="../resources/irdntImages/${irdnt.irdntImage}" alt="" style="width: 80px;">
					                                        <div class="w-100 d-flex flex-column text-start ps-4">
					                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
					                                           <a href="javascript:void(0)" onclick="fn_insertIrdnt('${irdnt.irdntName}')">
					                                                <span>${irdnt.irdntName}</span>
					                                               </a>
					                                            </h5>
					                                        </div>
					                                    </div>
					                                </div>
					                            </div>                                                     
											</div>
										</div>
										<br>
										
								  </c:forEach>
								</c:if>
							</div>	
						</div>
						<!-- 가운데 정렬하기 위한 테두리 div 끝-->
										  				    <nav>
						      <ul class="pagination justify-content-center">
						<c:if test = "${!empty irdntPaging}">
						   <c:if test = "${irdntPaging.prevBlockPage gt 0}">  <!-- gt - 0보다 크냐,> -->
						         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_irdntList(${irdntPaging.prevBlockPage})">이전</a></li>
						   </c:if>
						   
						   <c:forEach var = "i" begin = "${irdntPaging.startPage}" end = "${irdntPaging.endPage}"> <!-- for문 -->
						      <c:choose>
						         <c:when test="${i ne curPage}"> <!-- 현재 페이지가 아닐때 -->
							         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_irdntList(${i})">${i}</a></li>
							     </c:when>
							     <c:otherwise>
							         <li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
						         </c:otherwise>   
						       </c:choose>
						   </c:forEach>
						   <c:if test = "${irdntPaging.nextBlockPage gt 0}"> <!-- gt 0보다 크냐 -->
						         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_irdntList(${irdntPaging.nextBlockPage})">다음</a></li>
						   </c:if>
						</c:if>
						      </ul>
						   </nav> 
                        <!-- 본문 끝 -->
				
				</div> <!-- 흰색 배경 -->
			  </div> <!-- 흰색배경 -->
          
        </div> <!-- 본문 안쪽 테두리 -->
    </div> <!-- 본문 가장 바깥 테두리 -->
    
    
    <!-- 사이드바 -->
                                        
      <!-- 사이드바 시작 -->
    <aside class="col-lg-3 order-first order-lg-last">
        <div class="sidebar">
            <!-- 사이드바 내용 -->
                <div class="list-group list-group-flush">        
                      <div class="card-header bg-primary text-white">내가 가지고 있는 재료</div>
                        <div class="list-group list-group-flush">
                           
                          <c:if test ="${!empty myFridgeList}">  <!-- list 객체가 비어있지 않을때 -->
								   	<c:forEach var = "MyFridge" items = "${myFridgeList}">
								   		<c:set var="cnt" value="${cnt + 1}" />
								   
										 <a  class="list-group-item list-group-item-action">
										  <input type="checkbox" id="horns" name="horns" value="${MyFridge.irdntName}"/>
										 재료이름:${MyFridge.irdntName}&nbsp;<div></div> 수량: ${MyFridge.fridgeIrdntAmount}g<div></div>
										 <input type = "text" 
										 id="fridgeIrdntAmountUpdate<c:out value='${cnt}' />" name ="fridgeIrdntAmountUpdate<c:out value='${cnt}' />" value = "${MyFridge.fridgeIrdntAmount}">g  
										 <button onclick="fn_update('${MyFridge.irdntName}', document.getElementById('fridgeIrdntAmountUpdate<c:out value='${cnt}' />').value)"	>수정</button>
										 <div></div> 
										  </a>
										
								   	</c:forEach>
								   
								   				    <nav>
								<ul class="pagination justify-content-center">
									<c:if test = "${!empty myFridgePaging}">
									 	  <c:if test = "${myFridgePaging.prevBlockPage gt 0}">  <!-- gt - 0보다 크냐,> -->
									         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_fridgeList(${myFridgePaging.prevBlockPage})">이전</a></li>
									   	  </c:if>
									   
										   <c:forEach var = "i" begin = "${myFridgePaging.startPage}" end = "${myFridgePaging.endPage}"> <!-- for문 -->
										      <c:choose>
										         <c:when test="${i ne curPage}"> <!-- 현재 페이지가 아닐때 -->
										         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_fridgeList(${i})">${i}</a></li>
										            </c:when>
										            <c:otherwise>
										         <li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
										            </c:otherwise>   
										        </c:choose>
										   </c:forEach>
									   
										   <c:if test = "${myFridgePaging.nextBlockPage gt 0}"> <!-- gt 0보다 크냐 -->
										         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_fridgeList(${myFridgePaging.nextBlockPage})">다음</a></li>
										   </c:if>
									</c:if>
								<button class="btn btn-primary" type="button" id="btnDelete">삭제</button>
						      </ul>
						   </nav> 
		   
				   <div class="input-group-append">
				   </div>
   			</c:if>


			<input id ="_myFridgeSearch" name="_myFridgeSearch" type="text" class="form-control" 
			placeholder="검색어 입력" aria-label="검색어 입력" aria-describedby="basic-addon2"
			value = "${myFridgeSearchValue}">
             <div class="input-group-append">
               <button class="btn btn-primary" type="button" id="btnFridgeSearch">냉장고 검색</button>
             </div>          
                   
              </div>
       </div>
     
     </div>
 </aside>
    <!-- 사이드바 끝 -->
</div>


        <!-- 사이드바랑 본문 있는 영역 밑의 새로운 영역 -->
                  
		 <!-- 레시피들 나오는 레시피 리스트와 footer 사이에 간격주기 위한 div -->
		  <div style = "padding: 20px 20px 20px 20px;"><!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->  
		  </div>
		 <!-- 간격 끝 -->

   
       
<!-- 흰색 배경 테두리 시작 -->
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
					<div class="content section_delete"  >
                     
                     
                         <h5 class="section-title ff-secondary text-center text-primary fw-normal">Find Recipe</h5>
                         <h2 class="mb-5">현재 만들 수 있는 레시피</h2>
                     </div>     
                            
                <div>                   
                    <!-- 리스트 박스 -->                 
                     <!-- 검색 상자 -->
                  <div class="container mt-4">
                      <div class="input-group mb-3">
                          <input id ="_myRecipeSearch" name="_myRecipeSearch" type="text" class="form-control" 
                          placeholder="검색어 입력" aria-label="레시피 검색 " aria-describedby="basic-addon2"
                          value = "${myRecipeSearchValue}" style="width: 150px;">
                          <div class="input-group-append">
                              <button class="btn-primary" type="button" id="btnRecipeSearch" style="color: white; height: 40px;" >검색</button>
                          </div>
						
                      </div>
                  </div>
             </div>                    
<!-- 레시피 스타트 -->   

        <tbody>
        
<!-- 레시피 리스트 시작 -->
   <div class="container text-center my-1 pt-1 pb-1 text-center wow fadeInUp">
     <div class="tab-content">
                     <div id="tab-1" class="tab-pane fade show p-0 active">
                        <br>
	                <c:if test ="${!empty myRecipeList}">
	                  <c:forEach var = "RecipeInfo" items = "${myRecipeList}"> <!-- list를 가져올떄마다 recipeInfo에넣음 -->     
                            <div class="row g-4">
                                <div class="col-lg-20">
                          
                                    <div class="d-flex align-items-center">
                                    
                                        <img class="flex-shrink-0 img-fluid rounded" src="${RecipeInfo.recipeImage}" alt="" style="width: 130px;"/>
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                            
                                            
                                               <a href="javascript:void(0)" onclick="fn_recipeView(${RecipeInfo.recipeCode})"> <!-- 현재 레시피 코드를 가지고감 -->
                                                <span>${RecipeInfo.recipeName}</span>
                                                </a>
                                                <span class="text-primary"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
												  <path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
												</svg> : ${RecipeInfo.bbsReadCnt}</span>
                                            </h5>
                                            <small class="fst-italic">${RecipeInfo.recipeIntro}</small>
                                            
                                        </div>
                                    </div>
                                </div>                             
                               </div>
                                <br>
                           </c:forEach>   
						</c:if>
                                        
                        </div>
                    </div>
                </div>
                
               <!-- 흰색 테두리 안에서 가운데로 정렬 맞추기 위한 더 적은 영역 끝 --> 
               
            </div>
        </div>
                 
      </tbody>
      
		 <!-- 페이징 처리 시작 -->
		 <nav>
		      <ul class="pagination justify-content-center">
				<c:if test = "${!empty myRecipePaging}">
				   <c:if test = "${myRecipePaging.prevBlockPage gt 0}">  <!-- gt - 0보다 크냐,> -->
				         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_recipeList(${myRecipePaging.prevBlockPage})">이전</a></li>
				   </c:if>
				   
				   <c:forEach var = "i" begin = "${myRecipePaging.startPage}" end = "${myRecipePaging.endPage}"> <!-- for문 -->
				      <c:choose>
				         <c:when test="${i ne curPage}"> <!-- 현재 페이지가 아닐때 -->
				         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_recipeList(${i})">${i}</a></li>
				            </c:when>
				            <c:otherwise>
				         <li class="page-item active"><a class="page-link" href="javascript:void(0)" style="cursor:default;">${i}</a></li>
				            </c:otherwise>   
				        </c:choose>
				   </c:forEach>
				   <c:if test = "${myRecipePaging.nextBlockPage gt 0}"> <!-- gt 0보다 크냐 -->
				         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_recipeList(${myRecipePaging.nextBlockPage})">다음</a></li>
				   </c:if>
				</c:if>
		      </ul>
		   </nav> 
		 <!-- 페이징 처리 끝 -->
 
 	</div>    
  </div>
<div>

</div>
</div>
<!-- 흰색 배경 끝 -->
        <!-- 레시피 --> 



  <form name="fridgeForm" id="fridgeForm" method="get">
	<input type="hidden" id="myFridgeSearch" name="myFridgeSearch" value ="${myFridgeSearchValue}"/>
	<input type="hidden" id="myFridgeCurPage" name = "myFridgeCurPage" value = "${myFridgeCurPage}">
	<input type="hidden" id="irdntSearch" name="irdntSearch" value = "${irdntSearchValue}">
  	<input type="hidden" id="irdntCurPage" name = "irdntCurPage" value = "${irdntCurPage}">
  	<input type="hidden" id="myRecipeSearch" name = "myRecipeSearch" value = "${myRecipeSearchValue}">
  	<input type="hidden" id="myRecipeCurPage" name = "myRecipeCurPage" value="${myRecipeCurPage}">
   </form>
   
   <form name="fridgeUpdateForm" id = "fridgeUpdateForm" method="post">
   	<input type ="hidden" id ="irdntName" name = "irdntName" value="">
   	<input type ="hidden" id ="fridgeIrdntAmount" name = "fridgeIrdntAmount" value ="">
   	<input type="hidden" name="recipeCode" value="${RecipeInfo.recipeCode}" /> 
   </form>
   
   
   

   

<!-- 레시피들 나오는 레시피 리스트와 footer 사이에 간격주기 위한 div -->
  <div style = "padding: 50px 50px 50px 50px;"><!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->  
  </div>
 <!-- 간격 끝 -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>


    <!-- Template Javascript -->
    <script src="js/main.js"></script>

        <!-- Footer + Template Javascript + JavaScript Libraries -->
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>