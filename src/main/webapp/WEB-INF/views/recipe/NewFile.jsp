<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 

<%@ include file="/WEB-INF/views/include/taglib.jsp" %> 

<!DOCTYPE html>
<html>
 <%@ include file="/WEB-INF/views/include/head.jsp" %>
 <script> 
    var chkVal = "";
    $(document).ready(function() {
    	
    	$("#btnFridgeSearch").on("click", function() {	
    	
    		document.fridgeForm.fridgeSearch.value = $("#_fridgeSearch").val();
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
    		alert(chkVal);
    		
    		document.fridgeUpdateForm.irdntName.value=chkVal;
    		document.fridgeUpdateForm.action ="/user/fridgeDelete";
    		document.fridgeUpdateForm.submit();
    		
     	}); 
    	

    	
    	$("#btnIrdntsearch").on("click", function() {	
    		
    		document.irdntSearchForm.irdntSearch.value = $("#_irdntSearch").val();
    		document.irdntSearchForm.submit();
    		document.irdntSearchForm.action = "/user/fridge";
    	});
    }); 
	function fn_update(name, val)
	{
		var amount = val;
		var irdntName = name;
		
		
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
		            alert("성공");
		        	 
		         }   
		         else if(response.code == 100)
		         {
		            alert("실패");
		            
		         }   
		         else if(response.code == 400)
		         {
		            alert("실패 111");
		            
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
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">Recipe Searching</h1>
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
                    
                    
                    <!-- Menu Start -->
                    <div class="container-xxl py-5">
                        <div class="container">
                            <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                                <h5 class="section-title ff-secondary text-center text-primary fw-normal">My Fridge</h5>
                                <h1 class="mb-5">재료 검색하기</h1>
                            </div>                                               
                 <!-- 리스트 박스와 검색 상자를 같은 줄에 놓기 위해서 -->
               <div>                   
                                  <!-- 리스트 박스 -->                 
                        <!-- 검색 상자 -->
                     <div class="container mt-4">
                         <div class="input-group mb-3">
                         
                             <input id ="_irdntSearch" name="_irdntSearch" type="text" class="form-control" placeholder="검색어 입력" aria-label="검색어 입력" aria-describedby="basic-addon2">
                             <div class="input-group-append">
                                 <button class="btn btn-primary" type="button" id="btnIrdntsearch">검색</button>
                             </div>
                           
                         </div>
                     </div>
               </div>              
               <!-- 검색버튼 있는 리스트 목록 상자 이거는 구현하려면 자바스크립트 있어야함-->    
            <!-- 검색버튼 있는 리스트목록  -->                      
                            </div>
                        </div>
                        <!-- 본문 끝 -->

          
        </div>
    </div>
    
    
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
 재료이름:${MyFridge.irdntName}&nbsp; 수량:<input type = "text" 
 id="fridgeIrdntAmountUpdate<c:out value='${cnt}' />" name ="fridgeIrdntAmountUpdate<c:out value='${cnt}' />" value = "${MyFridge.fridgeIrdntAmount}">g  
 <button onclick="fn_update('${MyFridge.irdntName}', document.getElementById('fridgeIrdntAmountUpdate<c:out value='${cnt}' />').value)"	>수정</button>
 <div></div> 
  </a>

 

   </c:forEach>
   
   <div class="input-group-append">
		<button class="btn btn-primary" type="button" id="btnUpdate">수정</button>
 		<button class="btn btn-primary" type="button" id="btnDelete">삭제</button>
   </div>

  
   </c:if>


<input id ="_fridgeSearch" name="_fridgeSearch" type="text" class="form-control" 
placeholder="검색어 입력" aria-label="검색어 입력" aria-describedby="basic-addon2"
value = "${fridgeSearch}">
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
                                                <span>${irdnt.irdntName}</span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                     
						</div>
					</div>
					</c:forEach>
				</c:if>
				
       

        <!-- 내가 가진 재료로 만들 수 있는 레시피 리스트들 넣어줄 영역 -->
                  <h5>쌉가능 레시피</h5>
<!-- 레시피 스타트 -->   
<c:if test ="${!empty myRecipeList}">
                  <c:forEach var = "RecipeInfo" items = "${myRecipeList}">
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-6">
                                    <div class="d-flex align-items-center">
                                        <img class="flex-shrink-0 img-fluid rounded" src="../resources/irdntImages/${RecipeInfo.recipeImage}" alt="" style="width: 80px;">
                                        <div class="w-100 d-flex flex-column text-start ps-4">
                                            <h5 class="d-flex justify-content-between border-bottom pb-2">
                                                <span>${RecipeInfo.recipeName}</span>
                                            </h5>
                                        </div>
                                    </div>
                                </div>
                            </div>                                                     
						</div>
					</div>
					</c:forEach>
				</c:if>
				
				
        <!-- 레시피 --> 
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
   
 

  <form name="fridgeForm" id="fridgeForm" method="get">
	<input type="hidden" id="fridgeSearch" name="fridgeSearch" value ="${fridgeSearch}"/>
   </form>
   
   <form name="fridgeUpdateForm" id = "fridgeUpdateForm" method="post">
   	<input type ="hidden" id ="irdntName" name = "irdntName" value="">
   	<input type ="hidden" id ="fridgeIrdntAmount" name = "fridgeIrdntAmount">
   </form>
   
   <form name="irdntSearchForm" id="irdntSearch">
   		<input id="irdntSearch" name="irdntSearch" value = "">
   </form>
   
   

<!-- 레시피들 나오는 레시피 리스트와 footer 사이에 간격주기 위한 div -->
  <div style = "padding: 50px 50px 50px 50px;"><!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->  
  </div>
 <!-- 간격 끝 -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
    <form name="bbsForm" id="bbsForm" method="post">
      <input type="hidden" name="searchType" value="${searchType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>

        <!-- Footer + Template Javascript + JavaScript Libraries -->
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>