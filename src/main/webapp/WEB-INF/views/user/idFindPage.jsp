<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!-- 맨위에 NAV-BAR고정따로 뺴놓음 -->

<!DOCTYPE html>
<head>

    <meta charset="utf-8">
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
 	
 	
<script type="text/javascript" src="/resources/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="/resources/js/icia.common.js"></script>
<script type="text/javascript" src="/resources/js/icia.ajax.js"></script>
<script type="text/javascript" src="/resources/js/jquery.js"></script>

 	
   
<script type="text/javascript">
   $(document).ready(function(){
	  			
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



			<div></br>
                            <div class="wow fadeInUp" data-wow-delay="0.1s">
                                    <div class="team-item text-center rounded overflow-hidden"> 
                                    <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                    <h5 class="section-title ff-secondary text-center text-primary fw-normal">id/pwd</h5>
                    <h1 class="mb-5">아이디/비밀번호 찾기</h1>
                					</div>
                	<span>이메일을 입력하세요</span></br></br>         			
				<span style="font-size:20px;">Email : </span><input type="text" class="" name="userEmail3" id="userEmail3" placeholder="이메일" style="width :50%;" /></br></br>
					<span>아이디를 입력하세요</span></br>
					<span>비밀번호찾기는 이메일과 아이디</span></br>
					<span>모두 입력해야 찾을 수 있습니다</span></br></br>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:20px;">Id : </span><input type ="text" class = "" name="emailId" id = "emailId" placeholder="아이디" style="width :50%;" value="" /></br></br>
					<button type="button" class=" btn-primary py-2 px-4" id="btnFind"name="btnFind">비번찾기</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class=" btn-primary py-2 px-4" id="btnIdFind"name="btnIdFind">아이디찾기</button></br></br>
					</div> 
					</div>
					</div>
	

			

<form id="emailForm" name="emailForm">
<input type="hidden" id ="authKey" name="authKey" value=""/>
<input type="hidden" id ="chkAuthKey" name="chkAuthKey" value=""/>
<input type="hidden" id = "userId" name = "userId" value = ""/>
<input type = "hidden" id = "userEmail" name = "userEmail" value = ""/>
</form>


</body>


</html>
