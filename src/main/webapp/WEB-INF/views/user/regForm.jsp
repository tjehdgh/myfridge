<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %>

<%@ include file="/WEB-INF/views/include/navigation.jsp" %>  <!-- 맨위에 NAV-BAR고정따로 뺴놓음 -->



<!DOCTYPE html>

<head>

    <meta charset="utf-8">
    <title>냉장고를 부탁해 - 회원가입</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

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
   $(document).ready(function(){
      
	  var check = 0 ;
	  var checkId = 0;
      $("#userId").focus();
      
      $("#btnIdCheck").on("click",function(){
    	 
    	  $.ajax({
              type:"POST",
              url:"/user/idCheck",
              data:{
                 userId:$("#userId").val()  //아이디 중복처리만 하는거기 때문에 id값만 보내면됨
              },
              datatype:"JSON",
              beforeSend:function(xhr){
                 xhr.setRequestHeader("AJAX", true);
              },
              success:function(response) 
              {                     
                 if(response.code == 0)
                 {
                    alert("사용 가능한 아이디 입니다.");
                    checkId = 1;
                    $("#btnIdCheck").prop("disabled", true);
                    //회원정보 insert되는 "/user/regProc" 컨트롤러 부르는 ajax 있는 함수호출 -> 함수안에서 드디어 회원정보 DB에 추가됨
                 }
                 else if(response.code == 100)
                 {
                    alert("중복된 아이디 입니다.");
                    $("#userId").focus();
                 }
                 else if(response.code == 400)
                 {
                    alert("파라미터 값이 올바르지 않습니다.");
                    $("#userId").focus();
                 }
                 else
                 {
                    alert("오류가 발생하였습니다");
                    $("#userId").focus();
                 }
              },
              error:function(xhr, status, error)
              {
                 icia.common.error(error);
              }
           });   
      });
      
      // 페이지 새로 고침 방지  -> 이거 없으면 하나라도 입력안하고 가입버튼 누르면 페이지 초기화 되면서 모든 입력값이 다 사라짐
      $("form").submit(function(event) {
         event.preventDefault(); 
       
      });
      
      $('#mail-Check-Btn').on("click",function() //인증메일발송버튼
    		  {
     		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
     		const checkInput = $('emailCheck') // 인증번호 입력하는곳 
  		    		$.ajax({
  			    			type : 'get',
  			    			url : "/user/emailChk" ,
  			    			data : {email:email} ,
  			    			success : function (response)
  							{
  			    				if(response.code ==0)
  		    					{
  			    					//emailCheck.attr('disabled',false);
  				    				document.emailForm.authKey.value = response.data;
  			    					alert ("이메일에 인증번호를 전송했습니다. 인증번호를 입력해 주세요.");
  			    					 $("#mail-Check-Btn").prop("disabled", true);
  			    				}
  			    				else if(response.code == 100)
  			    				{
  			    					alert("error");
  			    				}
  			    				
  			    			},
  	   		               error:function(xhr, status, error)
  	   		               {
  	   		                  icia.common.error(error);
  	   		                  alert("error"); 
     		               }		
  						});
  		    		// end ajax	
     				}); // end send eamil
     				
     			   $("#mail-Check-Btn1").on("click",function()
  			   {	
     				   
     				  if($.trim($("#userEmail1").val()).length <=0 )
     		            {
     		               alert("사용자 이메일을 입력하세요.");
     		               $("#userEmail1").val("");
     		               $("#userEmail1").focus();
     		               return;
     		            }
     				  
     				  
     				   var authKey = $("#authKey").val();
     				   var chkAuthKey = $("#emailCheck").val();
     				   $.ajax({	
     						type : 'get',
  		    			url : "/user/keyCheck" ,
  		    			data : 	
  		    			{
  		    				authKey:authKey,
  		    				chkAuthKey:chkAuthKey
  		    			},
  		    			success : function (response)
  						{
  		    				
  		    				if(response.code ==0)
  	    					{
  		    					 $("#mail-Check-Btn1").prop("disabled", true);
  		    					alert ("인증되었습니다.");
  		    					check = 1;
  		    					
  		    				}
  		    				else if(response.code == 100)
  		    				{
  		    					alert("인증번호가 일치하지 않습니다.");
  		    				}
  		    				else
  	    					{
  		    					alert("이메일을 입력해주세요");
  	    					}
  		    			},
     		               error:function(xhr, status, error)
     		               {
     		                  icia.common.error(error);
     		                  alert("error"); 
  		                }		
  					});
  			   }); 
     				
      
      
      // 드롭다운 메뉴의 change 이벤트를 감지합니다.
      $("#userGender").on("change", function() {
          // 선택된 값을 가져옵니다.
          var selectedValue = $(this).val();

          // 선택된 값을 출력합니다. (예: 콘솔에 출력)
          console.log("사용자가 선택한 성별: " + selectedValue);
          
          //여기에서 선택된 값을 활용할 수 있습니다.
          // 예를 들어, 다른 변수에 저장하거나 다른 작업 수행.
      });

      
      
	    
       $("#btnReg").on("click", function() {
    	   
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
           
            if(checkId !=1)
           	{
            	alert("아이디 중복 체크를 해주세요");
            	return;
           	}
            
            if(check != 1)
           	{	
            	alert("이메일 인증을 해 주세요");
           	 	return;
           	}
            
            if($.trim($("#userId").val()).length <=0 )
            {
               alert("사용자 아이디를 입력하세요.");
               $("#userId").val("");
               $("#userId").focus();
               return;
            }
            
            if(emptCheck.test($("#userId").val()))  //공백이 있으면 안되므로 공백정규표현식과 맞냐를 해줌 -> 공백이면 경고창 띄우기
            {
               alert("사용자 아이디는 공백을 포함할 수 없습니다.");
               $("#userId").focus();
               return;
            }
            
            if(!idPwCheck.test($("#userId").val())) //정규 표현식과 맞지 않은경우에 경고창 띄어주기 위해서  !를 해줌
            {
               alert("사용자 아이디는 4~12자의 영문 대소문자와 숫자로만 입력하세요.");
               $("#userId").focus();
               return;
            }
            
            
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
               $("#userAge").focus();
               return;
            }
            
            
            
            
            //성별
    		if($("#userGender").val() == 'A') {
			    alert("성별을 선택하세요.");
			    $("#userGender").focus();
			    return;
			}
 
            
	       //드롭다운 메뉴의 change 이벤트를 감지합니다.
	       $("#userGender").on("change", function() {
	          // 선택된 값을 가져옵니다.
	          var selectedValue = $(this).val();
	
	          // 선택된 값을 출력합니다. (예: 콘솔에 출력)
	          console.log("사용자가 선택한 성별: " + selectedValue);
	          
	       });

            
            
            
            //hidden 타입인 userPwd에 비밀번호값을 넣어서 서버로 보내기 위함
            $("#userPwd").val($("#userPwd1").val()); 
            
            
            //아이디 중복 체크  ajax
            $.ajax({
               type:"POST",
               url:"/user/idCheck",
               data:{
                  userId:$("#userId").val()  //아이디 중복처리만 하는거기 때문에 id값만 보내면됨
               },
               datatype:"JSON",
               beforeSend:function(xhr){
                  xhr.setRequestHeader("AJAX", true);
               },
               success:function(response) 
               {                     
                  if(response.code == 0)
                  {
                     fn_userReg(); //회원정보 insert되는 "/user/regProc" 컨트롤러 부르는 ajax 있는 함수호출 -> 함수안에서 드디어 회원정보 DB에 추가됨
                  }
                  else if(response.code == 100)
                  {
                     alert("중복된 아이디 입니다.");
                     $("#userId").focus();
                  }
                  else if(response.code == 400)
                  {
                     alert("파라미터 값이 올바르지 않습니다.");
                     $("#userId").focus();
                  }
                  else
                  {
                     alert("오류가 발생하였습니다");
                     $("#userId").focus();
                  }
               },
               error:function(xhr, status, error)
               {
                  icia.common.error(error);
               }
            });   //이건 ajax끝 부분
            
            
            });   //이건 $("#btnReg").on("click"~~ 부분
         });   //$(document).ready 부분


         
function fn_userReg()
{
      $.ajax({
      type:"POST",
      url:"/user/regProc",
      data:{
    	  
         userId:$("#userId").val(),   
            userPwd:$("#userPwd").val(),
            userEmail:$('#userEmail1').val() + $('#userEmail2').val(),
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
      beforeSend:function(xhr)
      {
         xhr.setRequestHeader("AJAX", "ture");   
      },
      success:function(response)
      {
         //성공
         if(response.code == 0)
         {
            alert("회원가입이 완료 되었습니다.");
            location.href = "/user/login";  
         }
         else if(response.code == 100)
         {
            alert("회원아이디가 중복되었습니다.");
            $("#userId").focus();
         }
         else if(response.code == 400)
         {
            alert("파라미터값이 올바르지 않습니다.");
            $("#userId").focus();
         }
         else if(response.code == 500)
         {
            alert("회원 가입중 오류가 발생하였습니다.");
            $("#userId").focus();
         }
         else
         {
            alert("회원 가입중 오류가 발생하였습니다.");
            $("#userId").focus();
         }
      },
      error:function(xhr, status, error)
      {
         icia.common.error(error);
      }
      });
}

         
      
  
   
function fn_validateEmail(value)
{
      var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      
      return emailReg.test(value);
}
  

  



</script>
   



</head>

<body>


    <div class="container-xxl bg-white p-0">
       
            <div class="container-xxl py-5 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-5 pb-4">
                    <h1 class="display-3 text-white mb-3 animated slideInDown">회원가입</h1>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">홈</a></li>         
                            <li class="breadcrumb-item"><a href="/user/login">로그인</a></li>
                            <li class="breadcrumb-item text-white active" aria-current="page">회원가입</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar & Hero End -->


        <!-- Reservation Start -->
        
        
              
        <div class="container-xxl py-0 px-0 wow fadeInUp" data-wow-delay="0.1s" align-items-center justify-content-center> 
            <div class="row g-0" align-items-center justify-content-center>
                <div class="col-md-6" align-items-center justify-content-center>
                  
                    
                </div>
                <div class="col-md-12 bg-dark d-flex align-items-center justify-content-center">
                <!-- <div class="p-5 wow fadeInUp text-center" data-wow-delay="0.2s"> -->
                    <div class="p-5 text-center" data-wow-delay="0.2s">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal">Welcome to Join Us</h4>
                        <h1 class="text-white mb-4">회원가입</h1>
                        <form class="d-flex justify-content-center align-items-center">
                       
                           <div class="row g-2 d-flex justify-content-center" >
	                            <div class="row g-2 d-flex justify-content-center" >
	                                <div class="col-8 text-center">
	                                    <div class="form-floating">
	                                        <input type="text" class="form-control" id="userId" placeholder="Your ID">
	                                        <button type="button" class="btn btn-primary py-2 px-4" id="btnIdCheck"name="btnIdCheck">중복체크</button>
	                                        <label for="userId">아이디를 입력하세요</label>
	                                    </div>
	                                </div>
	                              </div>
                              
                                
                             <div class="row g-2  d-flex justify-content-center" >
                                <div class="col-8 text-center">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="userPwd1" placeholder="Your Password">
                                        <label for="userPwd1">비밀번호를 입력하세요.  (영문 대소문자, 숫자, 특수문자 !@#$%^*+=- 를 포함한 8~15자리)</label>
                                    </div>
                                </div>
                              </div>  
                             
                             
                             <div class="row g-2  d-flex justify-content-center" >
                                <div class="col-8 text-center">
                                    <div class="form-floating">
                                        <input type="password" class="form-control" id="userPwd2" placeholder="Your Password check Again">
                                        <label for="userPwd2">비밀번호 확인</label>
                                    </div>
                                </div>
                             </div>
                             
                             <div class="row g-2  d-flex justify-content-center" >
	                      <div class="col-4">
							<input type="text" class="form-control" name="userEmail1" id="userEmail1" 
							placeholder="이메일" style="width:120%; text-align:center;" >
							<select class="form-control" name="userEmail2" id="userEmail2" style = "width :120%;text-align:center;">
							<option>@naver.com</option>
							<option>@daum.net</option>
							<option>@gmail.com</option>
							<option>@hanmail.com</option>
							 <option>@yahoo.co.kr</option>
							</select>
							</div>
							<div class="col-4">
							<button type="button"class="btn btn-primary py-2 px-4" id="mail-Check-Btn"name="mail-Check-Btn">이메일 인증</button>
							</br></br>
							 </div>
						</div>
						<div class="row g-2  d-flex justify-content-center" >
	                      <div class="col-4">
							<input class="form-control"style="width:480px;height:35px;" id= "emailCheck" name = "emailCheck" placeholder="인증번호 6자리를 입력해주세요!"  maxlength="6">
							</div>
							<div class="col-4">
							<button type="button" class="btn btn-primary py-2 px-4" id="mail-Check-Btn1"name="mail-Check-Btn1">인증번호 확인</button>
							</div>
                              
                                
                                
                             <div class="row g-2   d-flex justify-content-center" >
                                <div class="col-8">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="userAddress" placeholder="Your Address">
                                        <label for="userAddress">주소를 입력하세요</label>
                                    </div>
                                </div>
                            </div>
                           
                             
                            
                          <!--       <div class="col-4">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="userAge" placeholder="Your userAge">
                                        <label for="userAge">나이를 입력하세요</label>
                                    </div>
                                </div>
                           -->    
                                
                                
                           
                               
                            
	                            
	                            <div class="row g-2   d-flex justify-content-center" >
	                                <div class="col-8">
	                                    <div class="form-floating">
	                                        <input type="text" class="form-control" id="userPhoneNumber" placeholder="Your Phone Number">
	                                        <label for="userPhoneNumber">전화번호를 입력하세요</label>
	                                    </div>
	                                </div>
	                            </div>
	                            
	                            
	                            
	                             <div class="row g-2   d-flex justify-content-center" >
	                                <div class="col-8">
	                                    <div class="form-floating">
	                                        <input type="text" class="form-control" id="userAccount" placeholder="Your Account">
	                                        <label for="userAccount">계좌번호를 입력하세요</label>
	                                    </div>
	                                </div>
	                            </div>
	                            
	                            
	                            
	                             
	               <div class="row g-2  d-flex justify-content-center" >
	                      <div class="col-4">
	                          <div class="form-floating">
	                              <input type="text" class="form-control" id="userName" placeholder="Your Name">
	                              <label for="userName">이름을 입력하세요</label>
	                          </div>
	                      </div>
	                      
	                  
	                      <div class="col-4">
	                          <div class="form-floating">
	                              <input type="text" class="form-control" id="userNickname" placeholder="Your NickName">
	                              <label for="userNickname">닉네임을 입력하세요</label>
	                          </div>
	                      </div>
	                 </div> 
	                  
	                  
	                  <div class="row g-2   d-flex justify-content-center" >
                                <div class="col-4">
	                          <div class="form-floating">
	                              <input type="text" class="form-control" id="userAge" placeholder="Your Age">
	                              <label for="userAge">나이을 입력하세요</label>
	                          </div>
	                      </div>
								                                
                                
                                
                                
                                <div class="col-4">
                                    <div class="form-floating">
                                         <select class="form-select" id="userGender">  <!--  style="height: 60px; width: 380px;" 이거때문에 반응형 UI 안되서 화면 줄어들어도 박스크기 안줄었었음 -->
		                                    <option value="A" selected>성별을 선택하세요</option>
		                                    <option value="M">남자</option>
		                                    <option value="W">여자</option>
		                                </select>
		                                <label for="userAge">성별</label>      
                                    </div>
                                </div>
                           </div>   
	                  
	                             <input type="hidden" id="userPwd" name="userPwd" value="" /> <!-- 숨겨서 보내기 -->
	                            
	                             <!-- <form name="loginForm" id="loginForm" method="post" action="/loginProc.jsp" class="form-signin"> -->
	                            
	                            <div class="row g-2   d-flex justify-content-center" >
	                                <div class="col-8">
	                                    <button id="btnReg" class="btn btn-primary w-100 py-3">회원가입</button>
	                                </div>
	                             </div>
	                          
	                          
                    </div>
                           
                        </form>
                    </div>
                </div>
            </div>
        </div>


<form id="emailForm" name="emailForm">
<input type="hidden" id ="authKey" name="authKey" value=""/>
<input type="hidden" id ="chkAuthKey" name="chkAuthKey" value=""/>
<input type = "hidden" id = "userEmail" name = "userEmail" value = ""/>
</form>
       
  <!-- Footer + Template Javascript + JavaScript Libraries -->     
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
    


</body>

</html>
