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
	  
	   window.open("/user/idFindPage", "a", "width=1000, height=500, left=100, top=50");
	   $('#mail-Check-Btn').on("click",function() {
   		const email = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
   		console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
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
		    					
		    					alert ("인증되었습니다.");
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
   				
   				
   				$("#btnFind").on("click",function()
 				{		
   					var userId = $("#emailId").val();
   					var email = $("#userEmail3").val();
   					$.ajax({	
   						type : 'get',
		    			url : "/user/pwdFind" ,
		    			data : 	{
		    				 email:email,
		    				 userId:userId
		    			},
		    			success : function (response)
						{
		    				if(response.code ==0)
	    					{
		    					alert ("가입하신 이메일에 비밀번호를 전송했습니다.");
		    				}
		    				else if(response.code == 500)
		    				{
		    					alert("비밀번호 찾기 중 에러가 발생했습니다.");
		    				}
		    				else if(response.code == 100)		    					
		    				{
	    						alert("비밀번호 찾기 중 에러가 발생했습니다(100).");
	    					}
		    				else if (response.code == 200)
	    					{
		    					alert("아이디 또는 이메일을 찾을 수 없습니다.")		
	    					}
		    				else
	    					{
		    					alert("비밀번호 찾기중 알 수 없는 에러가 발생하였습니다.");		
	    					}
		    			},
  		               error:function(xhr, status, error)
  		               {
  		                  	icia.common.error(error);
  		                	alert("아이디전송 error"); 
	                   }		
					});
   				}); 	
   				
    	$("#btnIdFind").on("click",function(){
    		var email =$("#userEmail3").val();
    		
    		alert(email);
    		
    		$.ajax({	
					type : 'get',
    			url : "/user/idFind" ,
    			data : 	{
    				 email:email
    			},
    			success : function (response)
				{
    				if(response.code ==0)
					{
    					alert ("가입하신 이메일에 아아디를 전송했습니다.");
    				}
    				else if(response.code == 500)
    				{
    					alert("아아디 찾기 중 에러가 발생했습니다.");
    				}
    				else if(response.code == 100)		    					
    				{
						alert("아아디 찾기 중 에러가 발생했습니다(100).");
					}
    				else if (response.code == 200)
					{
    					alert("아이디를 찾을 수 없습니다.")		
					}
    				else
					{
    					alert("아아디 찾기중 알 수 없는 에러가 발생하였습니다.");		
					}
    			},
	               error:function(xhr, status, error)
	               {
	                  icia.common.error(error);
	                  alert("아이디전송 error"); 
              		}		
			});
    	});
    	
    	
    	});


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
        
        
              
                  
                    
                <div class="col-md-12 bg-dark d-flex align-items-center justify-content-center">
                <!-- <div class="p-5 wow fadeInUp text-center" data-wow-delay="0.2s"> -->
                    <div class="p-5 text-center" data-wow-delay="0.2s">
                        <h4 class="section-title ff-secondary text-start text-primary fw-normal">Welcome to Join Us</h4>
                        <h1 class="text-white mb-4">회원가입</h1>
                       
                 
				<div class="row g-2  d-flex justify-content-center">
					 <div class="col-8 text-center">
					<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
					<select class="form-control" name="userEmail2" id="userEmail2" >
					<option>@naver.com</option>
					<option>@daum.net</option>
					<option>@gmail.com</option>
					<option>@hanmail.com</option>
					 <option>@yahoo.co.kr</option>
					</select>
					<button type="button" class="btn btn-primary py-2 px-4" id="mail-Check-Btn"name="mail-Check-Btn">본인인증</button>
					<button type="button" class="btn btn-primary py-2 px-4" id="mail-Check-Btn1"name="mail-Check-Btn1">확인</button>
					<input class="form-control" id= "emailCheck" name = "emailCheck" placeholder="인증번호 6자리를 입력해주세요!"  maxlength="6">
					</div> 
				</div>
		
			<div class="row g-2  d-flex justify-content-center">
					 <div class="col-8 text-center">
					
					<input type="text" class="form-control" name="userEmail3" id="userEmail3" placeholder="이메일" style="width :50%;" />
					<input type ="text" class = "form-control" name="emailId" id = "emailId" value="" />
					<button type="button" class="btn btn-primary py-2 px-4" id="btnFind"name="btnFind">비번찾기</button>
						<button type="button" class="btn btn-primary py-2 px-4" id="btnIdFind"name="btnIdFind">아이디찾기</button>
					</div> 


				</div>

                    </div>
                           
                    </div>
  <!-- Footer + Template Javascript + JavaScript Libraries -->     
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<form id="emailForm" name="emailForm">
<input type="hidden" id ="authKey" name="authKey" value=""/>
<input type="hidden" id ="chkAuthKey" name="chkAuthKey" value=""/>
<input type="hidden" id = "userId" name = "userId" value = ""/>
<input type = "hidden" id = "userEmail" name = "userEmail" value = ""/>
</form>


</body>


</html>
