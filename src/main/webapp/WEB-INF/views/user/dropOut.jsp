<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>



<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <title>마이페이지 - 회원 탈퇴</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

<%@ include file="/WEB-INF/views/include/head.jsp" %>



<link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">

<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>



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
	 
	 $("#btnDropOut").on("click", function(){
		 
		 /*$('#ckBox').is(':checked');
		.is(':checked') 를 이용하여 체크되어 있는지 아닌지를 알 수 있다.
		true : 체크되어 있음, false : 체크되어 있지 않음*/
	     
		//체크박스가 체크되지 않았을 때 알림창 표시
		if (!($('#dropoutAgreeCheck').is(':checked')))
		{
		    alert("약관에 동의해주세요.");
		    $("#dropoutAgreeCheck").focus();
		    return;
		}
		
		
		 if($.trim($("#userPwd1").val()).length <=0)
	       {
	          alert("비밀번호를 입력하세요.");
	          $("#userPwd1").val("");
	          $("#userPwd1").focus();
	          return;
	       }
		 
		 
		 if($.trim($("#userPwd2").val()).length <=0)
	       {
	          alert("비밀번호 확인을 입력하세요.");
	          $("#userPwd2").val("");
	          $("#userPwd2").focus();
	          return;
	       }
		 
		 
		  //비밀번호와 비밀번호 확인이 일치하는지 확인
	       if($("#userPwd1").val() != $("#userPwd2").val())
	       {
	          alert("비밀번호가 일치하지 않습니다.");
	          $("#userPwd2").val("");
	          $("#userPwd2").focus();
	          return;
	       }
	       
		  
		 
		
		//confirm창 띄워서 확인버튼 누르면 탈퇴 진행, 취소 누르면 회원 탈퇴 취소
		if(confirm("정말로 탈퇴하시겠습니까?"))
		{
            // 확인 버튼을 눌렀을 때의 동작
            
	       $("#userPwd").val($("#userPwd1").val());   //hidden 타입인 userPwd에 비밀번호값을 넣어서 서버로 보내기 위함
	      
	       $.ajax({
	          type:"POST",
	          url:"/user/dropoutProc",
	          data:{   
	              userPwd:$("#userPwd").val()
	          },
	          datatype:"JSON",
	          beforeSend:function(xhr){
	             xhr.setRequestHeader("AJAX", true);
	          },
	          success:function(response) 
	          {                     
	       	    if(response.code == 0)
	      			{
	      				alert("회원 탈퇴가 완료되었습니다.");
	      				
	      				//dropoutSuccess으로 가져갈 정보들 form에 담아서 보내주기
	      				document.dropoutForm.action = "/user/dropoutSuccess";
	      				document.dropoutForm.submit();
	      				
	      			}
	      			
	      			else if(response.code == 400)
	      			{
	      				alert("파라미터 값이 올바르지 않습니다.");
	      			}
	      			else if(response.code == 404)
	      			{
	      				alert("회원 정보가 존재하지 않습니다.");
	      				location.href = "/index";   //첫페이지로 이동
	      			
	      			}
	      			else if(response.code == 500)
	      			{
	      				alert("회원 탈퇴 중 오류가 발생하였습니다.");
	      			}
	      			else if(response.code == -1)
	      			{
	      				alert("비밀번호가 일치하지 않습니다. 비밀번호를 정확하게 입력해주세요.");
	      			}
	      			else
	      			{
	      				alert("회원 탈퇴 중 오류가 발생했습니다. 다시 시도해주세요.");
	      				location.href = "/user/dropOut";
	      			}
	      			
	          },
	          error:function(xhr, status, error)
	          {
	             icia.common.error(error);
	          }
	       });   //이건 ajax끝 부분
            
		}
		else
		{
			//취소 눌렀을때
			alert("회원 탈퇴가 취소되었습니다.");
			return;
		}
		
	       
		 
		 
	 }); //버튼 onclick 끝
	 
	 
 });  //document.ready 끝
 </script>   
    

    
</head>

<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
    <div class="container-xxl position-relative p-0">
            

             <div class="container-xxl py-1 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-1 pb-4">
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">My Page</h1></br></br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/myPage/myPage">My Page</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">Sign Drop</li>
                        </ol>
                    </nav>
                    
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->






        <!-- Team Start -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
          
 
                <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">My Page</h5>
                    <h1 class="mb-5">회원 탈퇴</h1>
                </div>
                
                
  <!-- 마이페이지 왼쪽 사이드바와 본문 시작 -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
                <div class="row">
                    <!-- 사이드바 시작 -->
                    <aside class="col-lg-3">
                        <div class="sidebar">
                            <!-- 사이드바 내용 -->
                            <div class="card-header bg-primary text-white">회원 탈퇴</div>
			                    <div class="list-group list-group-flush">
			                        <a href="/myPage/myPage" class="list-group-item list-group-item-action">내 기본 정보</a>
			                        <a href="/myPage/myPageUpdateForm" class="list-group-item list-group-item-action">개인정보 수정</a>
			                        <a href="/myPage/bookMark" class="list-group-item list-group-item-action">찜한 레시피</a>
			                        <a href="/myPage/userQnA" class="list-group-item list-group-item-action">문의내역</a>
			                        <a href="/myPage/myRecipe" class="list-group-item list-group-item-action">나만의 레시피 내역</a> 
			                        <a href="/user/dropOut" class="list-group-item list-group-item-action">회원 탈퇴</a>
			                        
			                        
			                        <div class="card-header bg-primary text-white">고객 센터</div>
					                    <div class="list-group list-group-flush">
					                        <a href="/board/qna" class="list-group-item list-group-item-action">QnA</a>
					                        <a href="/board/notice" class="list-group-item list-group-item-action">공지사항</a>
					                        <a href="/admin/event" class="list-group-item list-group-item-action">이벤트</a> <!-- 이벤트는 공지사항이랑 같이 쓰이니까 같은 컨트롤러 사용 -->
					                   </div>					                   					                	                        
			                     </div>
                    </aside>
                    <!-- 사이드바 끝 -->

                    <!-- 본문 시작 -->
                    <div class="col-lg-9">
                        <div class="content">
                            <!-- 본문 콘텐츠 - 위쪽에 프로필사진과 간략한 기본 정보 보여주는곳 -->
                             
	                         <div>
				                <div class="wow fadeInUp" data-wow-delay="0.1s">
				                        <div class="team-item text-center rounded overflow-hidden">
				                        
				                           
					                           
					                        <!-- 회원 탈퇴 본문 내용들을 가장큰 본문 흰테두리 안세서 옆에 여백을 줘서 깔끔하게 보이기 위한 더 작은 영역-->
					                       <div class="col-12 wow fadeInUp justify-content-center" data-wow-delay="0.1s">
											    <div class="team-item text-center overflow-hidden">
											        <!-- 탈퇴안내 경고 영역 시작 -->
											        <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정할 수 있습니다. -->
											            <div class="content">
											                <br>
											                <br>
											                <h2 style="text-align: left;">탈퇴 안내</h2>
											                <p style="text-align: left;">회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
											                <br>
											            </div>
											        </div>
											        <!-- 탈퇴안내 경고 영역 끝 -->
											
											        <!-- 두번째 영역 -->
											        <!-- col-lg-8 : 대형 (Large) 디스플레이 크기 (일반적으로 데스크톱 컴퓨터)에서 9개의 그리드 열을 차지하도록 요소를 조정 -->
											        <!-- col-md-8: 중간 크기 (Medium) 디스플레이 (일반적으로 태블릿)에서 8개의 그리드 열을 차지하도록 요소조정 -->
											        <!-- col-sm-10: 작은 크기 (Small) 디스플레이 (일반적으로 스마트폰)에서 10개의 그리드 열을 차지하도록 요소조정 -->
											        <!-- col-12: 모든 화면 크기에서 12개의 그리드 열을 차지하도록 요소조정, 모든 화면 크기에서 요소가 꽉 채우도록함-->
											        <!-- mx-auto: 이 클래스는 요소를 가로 방향으로 가운데로 정렬함, 요소가 부모 컨테이너의 중앙에 위치하도록 도와줌 -->
											        <div class="col-lg-9 col-md-10 col-sm-11 col-12 mx-auto"> <!-- 여기서 col-12는 필요에 따라 조정가능. -->
											            <div class="content section_delete" style="text-align: left;  font-size: 14px;">
											                <p> <span style="color: orange; font-size: 24px;">⚠</span>&nbsp; 사용하고 계신 아이디( <em>${user.userId} </em> )는 탈퇴할 경우 재사용 및 복구가 불가능합니다.</p>
											                <p style="color: red;"> <span style="color: orange; font-size: 24px;">⚠</span>&nbsp; 탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</p>
											                <p> <span style="color: orange; font-size: 24px;">⚠</span>&nbsp; 필요한 데이터는 미리 백업을 해주세요.</p>
											                <br>
											                <br>
											                
											                <h6> <span style="color: orange; font-size: 24px;">✔</span> 탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</h6>
							                        	<p style="font-size: 14px;">나만의 레시피, QnA 등에 올린 게시글 및 댓글은 탈퇴 시 자동으로 삭제되지 않고 그대로 남아 있습니다.
							                        	<br>
							                        	삭제를 원하는 게시글이 있다면
							                        	<span style="color: orange; font-size: 14px;">반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</span>
							                        	<br>
							                        	탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
							                        	<br>
							                        	</p>
							                        	
							                        	
							                        	<!-- 표 시작 -->
							                        	<table style="border: 1px solid gray;">
														  <thead>
														    <tr>
														      <th colspan="2" style="border: 1px solid gray; text-align: center;">회원 탈퇴 후에도 남아있는 데이터</th>
														    </tr>
														  </thead>
														  <tbody>
														   <tr>
														      <td style="border: 1px solid gray; width: 100px; text-align: center;">QnA</td>
														      <td colspan="2" style="border: 1px solid gray;">내가 작성한 QnA, 답변, 댓글</td>
														    </tr>
														    <tr>
														      <td style="border: 1px solid gray; width: 100px; text-align: center;">나만의 레시피</td>
														      <td style="border: 1px solid gray;">내가 작성한 레시피 게시물 (레시피에 포함된 이미지, 게시물 제목, 게시물 내용), 게시물에 달린 댓글, 댓글을 단 사용자 이름, 등록일자, 프로필 이미지, 댓글내용</td>
														    </tr>
														    <tr>
														      <td style="border: 1px solid gray; width: 100px; text-align: center;">레시피 게시물</td>
														      <td style="border: 1px solid gray;">레시피 게시물에 내가 작성한 댓글, 나의 댓글에 표시되는 사용자 이름, 등록일자, 프로필 이미지 , 댓글 내용</td>
														    </tr>
														  </tbody>
														</table>
														<br>
														<br>
												<!-- 표 끝 -->


							                        	
							                       <!-- 탈퇴 마지막 경고영역 -->
							                        	<div >
							                        	 <h6><span style="color: orange; font-size: 24px;">✔</span> 탈퇴 전 확인</h6>
							                        	  <p class="context font-size: 14px;">
							                        	    <span style="color: orange; font-size: 14px;">
							                        	     • 탈퇴 후에는 아이디 <em>${user.userId}</em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구 할 수 없습니다.
							                        	     <br>
											 				 • 게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다.
							                        	    </span>
											 				 <br>• My fridge 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.
											 				 <br> 네이버 아이디로 로그인하여 사용 중이던 외부 사이트를 방문하여 다른 로그인 수단을 준비하거나, 데이터를 백업한 후 네이버 회원을 탈퇴해야 합니다.
							                        	    
							                        	  </p>
							                        	  <br>
							                        	  <input type="checkbox" id="dropoutAgreeCheck" name="dropoutAgreeCheck" > <!-- 체크박스 체크 안하면 null값, 체크를 하면 값이 agree로 전송된다-->
															<label for="dropoutAgreeCheck"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
														</div>
															<br>
															<br>
											                
											            </div>
											        </div>
											        <!-- 두번째 영역 -->
											    </div>
											</div>
									<!-- 회원 탈퇴 본문 내용들을 가장큰 본문 흰테두리 안세서 옆에 여백을 줘서 깔끔하게 보이기 위한 더 작은 영역-->                      
					                       
					                        	  
				                        	  
				                        	</div> <!-- 큰영역중 가장 안쪽 div -->
				                        	
				                        	
				                        </div>
				                    </div>
				                    
				                    
				                    <!-- 내정보 시작 -->
				                    <!-- 내 프로필 사진 부분과 그 밑의 정보들과의 간격을 보기 좋게 띄어주기 위해 넣어준 div -->
                         <div style = "padding: 30px 30px 30px 30px;"><!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->  
                        </div>
                        <!--프로필 부분과 내역들 사이 공간 끝-->
                        
                        
		                        
		                        <!-- 회원정보 기본 폼 시작 -->
						                <div class=" col-12 wow fadeInUp justify-content-center" data-wow-delay="0.1s">
					                        <div class="team-item text-center overflow-hidden justify-content-center">
						                            <br>
						                            <br>
						                            <h2>현재 내 정보</h2>
						                            
						                           <!-- 회원 기본 정보 수정 폼 시작 -->
						                        <form  method="post" name="form1" id="form1">
						                          
						                          
						                  <div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                        <div class=" text-center justify-content-center">
						                          <div class="form-group">
						                                <br>
						                               	<h6 align="left"> 아이디 </h6>
						                                <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}" placeholder="아이디" readonly>
						                            </div>
						                        </div>
											 </div>
										  </div>
						
						   	
						                        	
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">    
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">주소</h6>
						                                <input type="text" class="form-control" id="userAddress" name="userAddress" value="${user.userAddress}" placeholder="주소 입력" readonly>
						                            </div>
												 </div>
											  </div>
											  
						                 
						                 <div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">    
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">전화번호</h6>
						                                <input type="text" class="form-control" id="userPhoneNumber" name="userPhoneNumber" value="${user.userPhoneNumber}" placeholder="전화번호 입력" readonly>
						                            </div>
												 </div>
											  </div>
											  
											  
						                    
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">계좌번호</h6>
						                                <input type="text" class="form-control" id="userAccount" name="userAccount" value="${user.userAccount}" placeholder="계좌번호 입력" readonly>
						                            </div>
												 </div>
											  </div>
						
						
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">사용자 이름</h6>
						                                <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="사용자 이름 입력" readonly>
						                            </div>
												 </div>
											  </div>
						 
						
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">닉네임</h6>
						                                <input type="text" class="form-control" id="userNickname" name="userNickname" value="${user.userNickname}" placeholder="닉네임 입력" readonly>
						                            </div>
												 </div>
											  </div>
											  
									
									<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">    
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">나이</h6>
						                                <input type="text" class="form-control" id="userAge" name="userAge" value="${user.userAge}" placeholder="나이" readonly>
						                            </div>
												 </div>
											  </div>
						                 
							
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">성별</h6>
						                                <input type="text" class="form-control" id="userGender" name="userGender" value="${user.userGender}" placeholder="성별" readonly>
						                            </div>
												 </div>
											  </div>
						
						
						
						
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">이메일 주소</h6>
						                                <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 주소" readonly>
						                            </div>
												 </div>
											  </div>
													
						                        </form> 
								               <!-- 회원 기본 정보 수정 폼 끝 -->             
						                          
						                          <!-- 회원탈퇴를 위한 비밀번호 입력 -->
									                  <div class="row g-2  d-flex justify-content-center" >
			                               				 <div class="col-8 text-center">
															<div class=" text-center justify-content-center">
									                            <div class="form-group">
									                            	<br>
									                            	<br>
									                                <h6><span style="color: orange; font-size: 24px;">✔</span> 회원 탈퇴를 하려면 사용자 비밀번호를 입력하세요.</h6>
									                                <input type="password" class="form-control" id="userPwd1" name="userPwd1" value="" placeholder="비밀번호 입력">
									                                <br>
									                                <input type="password" class="form-control" id="userPwd2" name="userPwd2" value="" placeholder="비밀번호 확인">
									                            </div>
									                         </div>
														 </div>
													  </div>
										  			<!-- 회원탈퇴를 위한 비밀번호 입력 끝-->
						                          
						                          <input type="hidden" id="userPwd" name="userPwd" value="" /> <!-- 숨겨서 보내기 -->
						                          
						                          <!-- 탈퇴하기 버튼 -->
						                          <br>
						                          <button type="button" class="btn-primary" id="btnDropOut"  style="color: white; width: 100px; height: 40px;">탈퇴하기</button>
						                          
						                          <!-- 버튼 밑과 흰색 배경과의  간격을 주기 위한 div-->
						                          <div>
						                          <br>
						                          </div>
						                          <!-- 버튼 밑과 흰색 배경과의  간격을 주기 위한 div-->
						                          
					                        </div>
					                    </div>
					                    <!-- 회원기본정보 영역 끝 -->
				               		
				               		<form name="dropoutForm" id="dropoutForm" method="post">
								      <input type="hidden" name="userId" value="${user.userId}" />
								   </form>
				                    <!-- 내 정보 끝 -->
	               		 </div> <!-- 본문 테두리/ 이 테두리 안에 넣어야 사이드바 옆 공간에 본문 넣을 수 있음 -->
                           
                      </div>
                        
		          <!-- 본문 끝 -->  
						        
						  
			</div> <!-- 사이드바 옆의 본문에 넣으려면 이 div안에 넣어야함 -->
		</div>
						
						

                </div>
            </div>
        </div>
        <!-- 마이페이지 사이드바와 본문 끝 -->


        
        <%@ include file="/WEB-INF/views/include/footer.jsp" %>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

   
</body>

</html>