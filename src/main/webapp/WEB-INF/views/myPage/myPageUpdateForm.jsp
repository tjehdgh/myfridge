<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>



<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <title>마이페이지 - 회원정보 수정</title>
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
 
 function fn_userFile()
 {
		var form = $("#writeForm")[0];
		var formData = new FormData(form);  //객체 생성해서 생성자에 body에 있는 form을 넘김
		//폼 자체의 타입으로 보내기 위한 객체 생성
		
		//제이쿼리용 ajax통신
		$.ajax({
			type:"POST",
			enctype:"multipart/form-data",
			url:"/myPage/userFileProc",  //컨트롤러
			data:formData,
			processData:false,  //formData 를 String으로 변환하지 않음
			contentType:false,  //content-type헤더가  multipart/form-data로 전송
			cache:false,
			timeout:600000,   //언제까지 기다릴레?
			beforeSend:function(xhr)
			{
				xhr.setRequestHeader("AJAX", "true");
			},
			success:function(response)
			{
				if(response.code == 0)
				{
					alert("프로필 이미지가 변경되었습니다.");
					location.href ="/myPage/myPageUpdateForm";     //메인으로 가게 하기

					
				}
				else if(response.code == 400)
				{
					alert("파라미터 값이 올바르지 않습니다.");	

					$("#userfileSave").prop("disabled", false);
					
				}
				else
				{
					alert("프로필 사진 변경 중 오류 발생");

					$("#userfileSave").prop("disabled", false);
					
				}
				
			},
			error:function(error)
			{
				icia.common.error(error);
				alert("프로필 사진 변경 중 오류가 발생하였습니다.");
				$("#userfileSave").prop("disabled", false);
			}
					
					
		});
 }
 
 $(document).ready(function() {
	 
	 $("#btnUpDate").on("click", function(){
		
		//공백체크
	       var emptCheck = /\s/g;
	       
	       //영문 대소문자, 숫자로만 이루어진 4~12자리 정규식
	       var idPwCheck = /^[a-zA-Z0-9]{4,12}$/;
	       
	       
	       //비밀번호 정규식 -> 영문 숫자 특수기호 조합으로 8~15자리로만 만들 수 있음
	       var passWordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,15}$/
	       
	       
	       //계좌번호, 나이 정규식 -> 0-9까지 숫자만 입력가능
	      var NumCheck = /^[0-9]+$/;
	       
	       //전화번호 정규식 -> 가운데 자리는 3~4자리 0~9숫자,  마지막 자리는 4자리의 0~9숫자
	       ///^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;  핸드폰 앞자리는 010 으로 통합되었기 때문에 앞자리에는 010만 올수 있게 표현식을 바꿨음
	       var phoneRule = /^(01[0]{1})[0-9]{3,4}[0-9]{4}$/;
	       
	       
	       
	     //비밀번호 처리
	       if($.trim($("#userPwd1").val()).length <=0)
	       {
	          alert("비밀번호를 입력하세요.");
	          $("#userPwd1").val("");
	          $("#userPwd1").focus();
	          return;
	       }
	       
	       
	       if(emptCheck.test($("#userPwd1").val()))  //공백이 있으면 안되므로 공백정규표현식과 맞냐를 해줌 -> 공백이면 경고창 띄우기
	       {
	          alert("비밀번호는 공백을 포함할 수 없습니다.");
	          $("#userPwd1").val("");
	          $("#userPwd1").focus();
	          return;
	       }
	       
	       
	       if(!passWordCheck.test($("#userPwd1").val()))
	       {
	          alert("비밀번호는 영문 대소문자와 숫자, 특수문자를 포함한 8~15자리 입니다.");
	          $("#userPwd1").val("");
	          $("#userPwd1").focus();
	          return;
	       }
	       
	       
	       
	     //비밀번호 확인
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
	          $("#userPwd2").focus();
	          return;
	       }
	       
	       
	       
	       //주소
	       if($.trim($("#userAddress").val()).length <=0 )
	       {
	          alert("주소를 입력하세요.");
	          $("#userAddress").val("");
	          $("#userAddress").focus();
	          return;
	       }
	       
	       
	       
	       
	       //전화번호
	       if($.trim($("#userPhoneNumber").val()).length <=0 )
	       {
	          alert("전화번호를 입력하세요.");
	          $("#userPhoneNumber").val("");
	          $("#userPhoneNumber").focus();
	          return;
	       }
	       
	       if(emptCheck.test($("#userPhoneNumber").val()))  
	       {
	          alert("전화번호는 공백을 포함할 수 없습니다.");
	          $("#userPhoneNumber").focus();
	          return;
	       }
	       
	       if(!phoneRule.test($("#userPhoneNumber").val())) 
	       {
	          alert("전화번호는 0-9까지의 숫자로 000-000(0)-0000처럼 총10~11자리의 숫자만 입력 가능합니다.");
	          $("#userPhoneNumber").focus();
	          return;
	       }
	       
	       
	       if(($("#userPhoneNumber").val()).length > 11)
	       {
	       	alert("전화번호 형식은 숫자만 입력으로 11자리까지 입니다.");
	       	$("#userPhoneNumber").focus();
	           return;
	       }
	       
	       
	       
	       
	       	
	       //계좌
	       if($.trim($("#userAccount").val()).length <=0 )
	       {
	          alert("계좌번호를 입력하세요.");
	          $("#userAccount").val("");
	          $("#userAccount").focus();
	          return;
	       }
	       
	       if(emptCheck.test($("#userAccount").val()))  
	       {
	          alert("계좌번호는 공백을 포함할 수 없습니다.");
	          $("#userAccount").focus();
	          return;
	       }
	       
	       
	       if(!NumCheck.test($("#userAccount").val()))  
	       {
	          alert("계좌번호는 숫자만 입력가능합니다.");
	          $("#userAccount").focus();
	          return;
	       }
	       
	       
	       //사용자 이름
	       if($.trim($("#userName").val()).length <= 0) //사용자 이름의 길이는 상관없음 한글자라도 입력만 하면 됨
	       {
	          alert("사용자 이름을 입력하세요.");
	          $("#userName").val("");
	          $("#userName").focus();
	          return;
	       }
	       
	       
	       //닉네임
	       if($.trim($("#userNickname").val()).length <= 0) //사용자 닉네임의 길이는 상관없음 한글자라도 입력만 하면 됨
	       {
	          alert("닉네임을 입력하세요.");
	          $("#userNickname").val("");
	          $("#userNickname").focus();
	          return;
	       }
	       
	      
	       
	       
	       //나이 
	        if($.trim($("#userAge").val()).length <= 0) 
	       {
	          alert("나이을 입력하세요.");
	          $("#userAge").val("");
	          $("#userAge").focus();
	          return;
	       }
	       
	       
	       if(!NumCheck.test($("#userAge").val()))  
	       {
	          alert("나이는 숫자만 입력가능합니다.");
	          $("#userAge").val("");
	          $("#userAge").focus();
	          return;
	       }
	       
	       
	       
	       
	       //성별
	     //드롭다운 메뉴의 change 이벤트를 감지
	     $("#userGender").on("change", function() {
	         // 선택된 값을 가져옵니다.
	         var selectedValue = $(this).val();

	         // 선택된 값을 출력
	         console.log("사용자가 선택한 성별: " + selectedValue);
	         
	     });

	       
	       
	       
	       if(!$("userGender").val() == 'M' && !$("userGender").val() == 'W')
	       {
	       	alert("성별을 선택하세요.");
	           $("#userGender").val("");
	           $("#userGender").focus();
	           return;
	      	}
	       
	       
	    
	       
	       
	       //hidden 타입인 userPwd에 비밀번호값을 넣어서 서버로 보내기 위함
	       $("#userPwd").val($("#userPwd1").val()); 
	       
	       
	      
	       $.ajax({
	          type:"POST",
	          url:"/user/updateProc",
	          data:{
	       	   
	       	   userId:$("#userId").val(),   
	              userPwd:$("#userPwd").val(),
	              userName:$("#userName").val(),
	              userAddress:$("#userAddress").val(),
	              userAge:$("#userAge").val(),
	              userGender:$("#userGender").val(),
	              userPhoneNumber:$("#userPhoneNumber").val(),
	              userAccount:$("#userAccount").val(),
	              userName:$("#userName").val(),
	              userNickname:$("#userNickname").val()
	          },
	          datatype:"JSON",
	          beforeSend:function(xhr){
	             xhr.setRequestHeader("AJAX", true);
	          },
	          success:function(response) 
	          {                     
	       	    if(response.code == 0)
	      			{
	      				alert("회원 정보가 수정되었습니다.");
	      				
	      				//성별을 수정한 후에도 수정된 값으로 select 태그의 option을 선택하도록 설정
	      	            $("#userGender").val(response.userGender);
	      				
	      				location.href = "/myPage/myPageUpdateForm"; //회원정보 수정페이지로 이동
	      				//root로 가고 싶으면 "/" 하면 됨
	      			}
	      			
	      			else if(response.code == 400)
	      			{
	      				alert("파라미터 값이 올바르지 않습니다.");
	      				$("#userPwd1").focus();
	      			}
	      			else if(response.code == 404)
	      			{
	      				alert("회원정보가 존재하지 않습니다.");
	      				location.href = "/";   //첫페이지로 이동
	      			}
	      			else if(response.code == 500)
	      			{
	      				alert("회원정보 수정 중 오류가 발생하였습니다.");
	      				$("#userPwd1").focus();
	      			}
	      			else
	      			{
	      				alert("회원정보 수정 중 오류 발생");
	      			}
	      			
	          },
	          error:function(xhr, status, error)
	          {
	             icia.common.error(error);
	          }
	       });   //이건 ajax끝 부분
	       
		 
		 
	 });
	 
	 
 });  
 
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
                            <li class="breadcrumb-item text-white active" aria-current="page">Sign Update</li>
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
                    <h1 class="mb-5">회원정보 수정</h1>
                </div>
                
                
  <!-- 마이페이지 왼쪽 사이드바와 본문 시작 -->
        <div class="container-xxl pt-5 pb-3">
            <div class="container">
                <div class="row">
                    <!-- 사이드바 시작 -->
                    <aside class="col-lg-3">
                        <div class="sidebar">
                            <!-- 사이드바 내용 -->
                            <div class="card-header bg-primary text-white">회원정보 수정</div>
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
				                            
				                            <!-- 여기도 if test="" 써서 userId, email가져오게 하기 -->
				                            <div class="rounded-circle overflow-hidden m-4">
				                            <br>
				                            <br>
				                                <c:if test="${user.fileExt eq ''}">
		                                        	<img src = "/resources/upload/basic.jpg" class = "profile-photo "  width="200", height="200">
		                                       	</c:if>	
		                                       	
		                                       	<c:if test="${user.fileExt ne ''}">
		                                       		<img src = "/resources/upload/${user.userId}.${user.fileExt}" class = "profile-photo"  width="200", height="200">
		                                       	</c:if>
		                                       	
				                            </div>
				                            <form name="writeForm" id="writeForm" method="post" enctype="multipart/form-data">
				                            
				                        <!-- 프로필 사진 업로드 버튼 -->
				                            <input type="file" id="userFile" name="userFile" placeholder="프로필 사진을 선택하세요." />
                                            <button id="userfileSave" name="userfileSave" onclick="fn_userFile()">저장</button>
                                        <!-- 프로필 사진 업로드 버튼 -->
                                            
                                            
                                            <br>
                                            <br>
                                            </form>
				                            <h4 class="mb-0"> ${user.userNickname}</h4>
				                            <h5>미키마우스@Disney.com</h5>
				                            <br>
				                            
				                          <!-- <h4 class="mb-0"><c:if test="userCookieId == userId">${user.userNickname}</c:if> 미키마우스</h4>
				                            <h5><c:if test="userCookieId == userId">${EMAIL_CHECK.userEmail}</c:if>미키마우스@Disney.com</h5>    -->
				                            
				                            
				                            <!-- if  여기서 user_info 테이블에 userEmail 없으니까 EMAIL_CHECK DAO에서 가지고 와야함??-->
				                        </div>
				                    </div>
		               		 </div>
                            
                        </div>
                        
                        <!-- 내 프로필 사진 부분과 그 밑의 정보들과의 간격을 보기 좋게 띄어주기 위해 넣어준 div -->
                         <div style = "padding: 30px 30px 30px 30px;"><!-- (각각 위 오른쪽 아래 왼쪽 - 시계방향) -->  
                        </div>
                        <!--프로필 부분과 내역들 사이 공간 끝-->
                        
                        
		                        
		                        <!-- 회원정보 기본 폼 시작 -->
		                         
						                <div class=" col-12 wow fadeInUp justify-content-center" data-wow-delay="0.1s">
					                        <div class="team-item text-center overflow-hidden justify-content-center">
						                            
						                           <!-- 회원 기본 정보 수정 폼 시작 -->
						                        <form  method="post" name="form1" id="form1">
						                          
						                          
						                  <div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                        <div class=" text-center justify-content-center">
						                          <div class="form-group">
						                                <br>
						                                <br>
						                               	<h6 align="left"> 아이디 </h6>
						                                <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}" placeholder="아이디" readonly>
						                            </div>
						                        </div>
											 </div>
										  </div>
						
						
						
						
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
												<div class=" text-center justify-content-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">비밀번호</h6>
						                                <input type="password" class="form-control" id="userPwd1" name="userPwd1" value="${user.userPwd}" placeholder="비밀번호">
						                            </div>
						                         </div>
											 </div>
										  </div>
										  
										  
										  <div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
												<div class=" text-center justify-content-center">
						                            <div class="form-group">
						                            	<br>
						                                <h6 align="left">비밀번호확인</h6>
						                                
						                                <input type="password" class="form-control" id="userPwd2" name="userPwd2" value="${user.userPwd}" placeholder="비밀번호 확인">
						                            </div>
						                         </div>
											 </div>
										  </div>
						                            
						                        	
						                        	
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">    
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">주소</h6>
						                                <input type="text" class="form-control" id="userAddress" name="userAddress" value="${user.userAddress}" placeholder="주소 입력">
						                            </div>
												 </div>
											  </div>
						                 
						                 
						                 
						                 
						                 <div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">    
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">전화번호</h6>
						                                <input type="text" class="form-control" id="userPhoneNumber" name="userPhoneNumber" value="${user.userPhoneNumber}" placeholder="전화번호 입력">
						                            </div>
												 </div>
											  </div>
											  
											  
						                    
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">계좌번호</h6>
						                                <input type="text" class="form-control" id="userAccount" name="userAccount" value="${user.userAccount}" placeholder="계좌번호 입력">
						                            </div>
												 </div>
											  </div>
						
						                    
						                
						                
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">사용자 이름</h6>
						                                <input type="text" class="form-control" id="userName" name="userName" value="${user.userName}" placeholder="사용자 이름 입력">
						                            </div>
												 </div>
											  </div>
						
						 
						
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">닉네임</h6>
						                                <input type="text" class="form-control" id="userNickname" name="userNickname" value="${user.userNickname}" placeholder="닉네임 입력">
						                            </div>
												 </div>
											  </div>
											  
									
									<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">    
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">나이</h6>
						                                <input type="text" class="form-control" id="userAge" name="userAge" value="${user.userAge}" placeholder="나이">
						                            </div>
												 </div>
											  </div>
						                 
									
						                            
							
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">성별</h6>
						                                <select class="form-control" id="userGender" name="userGender" value="${user.userGender}">
						                                    <option value="M" <c:if test="${user.userGender == 'M'}">selected</c:if>>남자</option>
               												<option value="W" <c:if test="${user.userGender == 'W'}">selected</c:if>>여자</option>
						                                </select>
						                            </div>
												 </div>
											  </div>
						
						
						
						
										<div class="row g-2  d-flex justify-content-center" >
                               				 <div class="col-8 text-center">
						                            <div class="form-group">
						                            <br>
						                                <h6 align="left">이메일 주소</h6>
						                                <input type="text" class="form-control" id="userEmail" name="userEmail" placeholder="이메일 주소 입력">
						                            </div>
												 </div>
											  </div>
						
						
														<input type="hidden" id="userPwd" name="userPwd" value="" /> <!-- 숨겨서 보내기 -->
						
						
						
													<br>
						                            <button type="button" class="btn-primary" id="btnUpDate"  style="color: white; width: 90px; height: 40px;">수정</button>
						                            
						                            <div>
						                            <br>
						                            </div>
						                        </form> 
								                            
						                          
					                        </div>
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