<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- 한글인코딩 추가 -->

<%@ include file="/WEB-INF/views/include/taglib.jsp" %> <!-- head에 빼놨으니까 익 없어도되지?-->

<!DOCTYPE html>
<html>
<![if !IE]>
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml" class="">
<![endif]>
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
    <link href="/resources/css/bootsave2.css" rel="stylesheet">
    <link href="/resources/css/bootsave3.css" rel="stylesheet">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    
<!-- 만개의 레시피 양식 -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="-1" />
<link rel="manifest" href="/manifest.json">
<meta property="fb:pages" content="1567451316868458" />
<meta name="description" content="국내 No.1 요리앱, 10만개 이상의 레시피, 편리한 검색, 맛보장 레시피, TV쿡방 레시피, 온라인 최저가 쇼핑, 요리 공모전">
<meta name="keywords" content="">
<meta name="google-site-verification" content="3eLg1zfxeZ_oO6oOOsvIxbtcW-FtDsViPVm7-CYOl8w" />
<meta name="p:domain_verify" content="1f5cc8d2183836842bd3db03bc960620"/>
<meta name="user_id" content='45523655' />
<title>요리를 즐겁게~ 만개의레시피</title>
<meta property="kakao:title" content="요리를 즐겁게~ 만개의레시피" />
<meta property="kakao:description" content="" />

<link rel="stylesheet" type="text/css" href="https://recipe1.ezmember.co.kr/static/css/ez_recipe_20230704.css" />
<link href="https://www.10000recipe.com/favicon.ico" rel="shortcut icon" type="image/x-icon" />
<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon.png" rel="apple-touch-icon" />
<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-76x76.png" rel="apple-touch-icon" sizes="76x76" />
<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-120x120.png" rel="apple-touch-icon" sizes="120x120" />
<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-152x152.png" rel="apple-touch-icon" sizes="152x152" />
<link href="https://recipe1.ezmember.co.kr/img/icons/apple-touch-icon-180x180.png" rel="apple-touch-icon" sizes="180x180" />
<link href="https://recipe1.ezmember.co.kr/img/icons/icon-hires.png" rel="icon" sizes="192x192" />
<link href="https://recipe1.ezmember.co.kr/img/icons/icon-normal.png" rel="icon" sizes="128x128" />
<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/jquery-1.11.2.min.js" charset="utf-8"></script>
<script type="text/javascript" src="//static.criteo.net/js/ld/publishertag.js"></script>

<style>
.btn_add .btn span {
    color: #74b243;
    font-size: 16px;
    margin-right: 4px;
}

.glyphicon {
    position: relative;
    top: 1px;
    display: inline-block;
    font-family: 'Glyphicons Halflings';
    font-style: normal;
    font-weight: 400;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
}

.bi-plus-circle {
color: orange;
}

.ui-sortable-handle {

}

.step img {
    border: 1px solid black;
    display: block;
    vertical-align: middle;
    
}

.regi_btm {
    border: 1px solid #e6e7e8;
    background: #fff;
    text-align: center;
    padding: 20px 0 20px 0;
    border-top: none;
    width: 1321px;
    margin: 0 auto; /* 가운데 정렬 */
}
</style>

</head>
<body>
       
        <!-- 네비게이션 시작 -->
         <%@ include file="/WEB-INF/views/include/navigation.jsp" %>
        <div class="container-xxl position-relative p-0">
            

             <div class="container-xxl py-1 bg-dark hero-header mb-5">
                <div class="container text-center my-5 pt-1 pb-4">
                    <h1 class="section-title ff-secondary text-center text-primary fw-normal">Add Recipe </h1></br></br>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb justify-content-center text-uppercase">
                            <li class="breadcrumb-item"><a href="/index">홈</a></li>                          
                            <li class="breadcrumb-item text-white active" aria-current="page">레시피등록</li>
                        </ol>
                    </nav>
                    
                </div>
            </div>
        </div>
              <!-- 네비게이션 종료 -->       

    <div class="regi_center" style="margin-left:6.5%;margin-right:6.5%; margin-top:-2.5%" >
      
        <!-- 네비게이션 종료 -->
    <div class="regi_title" >레시피 등록      
   </div>
    <div class="cont_box pad_l_60">
      <div id="divMainPhotoUpload" class="cont_pic2">
        <input type="hidden" name="main_photo" id="main_photo" value="">
        <input type="hidden" name="new_main_photo" id="new_main_photo" value="">
      <input type="hidden" name="del_main_photo" id="del_main_photo" value="">      
        <div id="divMainPhotoBox" is_over="0">
            <img id="mainPhotoHolder" onclick="browseMainFile()" src="https://recipe1.ezmember.co.kr/img/pic_none4.gif" style="width: 250px; height: 250px; cursor:pointer">
        </div>
      </div>
      
      <div class="cont_line"><p class="cont_tit4">레시피 제목</p><input type="text" name="cok_title" id="cok_title" value="" class="form-control" placeholder="예) 소고기 미역국 끓이기" style="width:610px; "></div>
      <div class="cont_line pad_b_25"><p class="cont_tit4">요리소개</p><textarea name="cok_intro" id="cok_intro" class="form-control step_cont" placeholder="레시피의 간단한 소개를 해주세요." style="height:100px; width:610px; resize:none;"></textarea></div>
	 
      
     
      <div class="cont_line"><p class="cont_tit4">카테고리</p>
        <select name="cok_sq_category_4" id="cok_sq_category_4"  text="종류별">
<option value="" >종류별</option>
<option value="63">한식</option>
<option value="68">중식</option>
<option value="66">일식</option>
<option value="69">동남아시아</option>
<option value="59">퓨전</option>
</select>  
<select name="cok_sq_category_3" id="cok_sq_category_3"  text="재료별">
<option value="" >재료별</option>
<option value="70">소고기</option>
<option value="71">돼지고기</option>
<option value="72">닭고기</option>
<option value="23">육류</option>
<option value="28">채소류</option>
<option value="24">해물류</option>
<option value="50">달걀/유제품</option>
<option value="33">가공식품류</option>
<option value="47">쌀</option>
<option value="32">밀가루</option>
<option value="25">건어물류</option>
<option value="31">버섯류</option>
<option value="48">과일류</option>
<option value="27">콩/견과류</option>
<option value="26">곡류</option>
<option value="34">기타</option>
</select>            
      </div>
      <div class="cont_line"><p class="cont_tit4">요리정보</p>
      
        <select name="cok_portion" id="cok_portion"  text="인원">
<option value="" >인원</option>
<option value="1">1인분</option>
<option value="2">2인분</option>
<option value="3">3인분</option>
<option value="4">4인분</option>
<option value="5">5인분</option>
<option value="6">6인분이상</option>
</select>
<select name="cok_time" id="cok_time"  text="요리시간">
<option value="" >시간</option>
<option value="5">5분이내</option>
<option value="10">10분이내</option>
<option value="15">15분이내</option>
<option value="20">20분이내</option>
<option value="30">30분이내</option>
<option value="60">60분이내</option>
<option value="90">90분이내</option>
<option value="120">2시간이내</option>
<option value="999">2시간이상</option>
</select>     
      </div>
    </div>
    
    <!-- 재료정보 시작 -->
    <div class="cont_box pad_l_60">
        <span class="guide mag_b_15" style="width:100%;"><b>재료가 남거나 부족하지 않도록 정확한 계량정보를 적어주세요.</b></span>
		<div class="mag_b_25 ui-sortable" id="divMaterialGroupArea">
		<li id="liMaterialGroup_1">
		
		<div class="cont_line"><p class="cont_tit4">주재료</p></div>
				
		<li id="liMaterial_1_1">
		<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_1" class="form-control" style="width:330px;" placeholder="예) 돼지고기">
		<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_1" class="form-control" style="width:280px;" placeholder="예) 300g">
		<a id="btnMaterialDel_1_1" href="javascript:delMaterial(1,1)" class="btn-del" style="display: none;"></a>
		</li>
		
		<li id="liMaterial_1_2">
		<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_2" class="form-control" style="width:330px;" placeholder="예) 양배추">
		<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_2" class="form-control" style="width:280px;" placeholder="예) 1/2개">
		<a id="btnMaterialDel_1_2" href="javascript:delMaterial(1,2)" class="btn-del" style="display: none;"></a>
		</li>
		
		<li id="liMaterial_1_3">
		<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_3" class="form-control" style="width:330px;" placeholder="예) 참기름">
		<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_3" class="form-control" style="width:280px;" placeholder="예) 1T">
		<a id="btnMaterialDel_1_3" href="javascript:delMaterial(1,3)" class="btn-del" style="display: none;"></a>
		</li>
		
		
		
		</ul>
		<div class="btn_add" style="padding:50 0 20px 300px; width:700px;">
		<button type="button" onclick="addMaterial(1)" class="btn btn-default">
		<i class="bi bi-plus-circle"></i> 추가</button>
		</div>
		
			<div class="cont_line"><p class="cont_tit4">부재료</p></div>
				
		<li id="liMaterial_2_1">
		<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_1" class="form-control" style="width:330px;" placeholder="예) 돼지고기">
		<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_1" class="form-control" style="width:280px;" placeholder="예) 300g">
		<a id="btnMaterialDel_1_1" href="javascript:delMaterial(1,1)" class="btn-del" style="display: none;"></a>
		</li>
		
		<li id="liMaterial_2_2">
		<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_2" class="form-control" style="width:330px;" placeholder="예) 양배추">
		<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_2" class="form-control" style="width:280px;" placeholder="예) 1/2개">
		<a id="btnMaterialDel_1_2" href="javascript:delMaterial(1,2)" class="btn-del" style="display: none;"></a>
		</li>
		
		<li id="liMaterial_2_3">
		<input type="text" name="cok_material_nm_1[]" id="cok_material_nm_1_3" class="form-control" style="width:330px;" placeholder="예) 참기름">
		<input type="text" name="cok_material_amt_1[]" id="cok_material_amt_1_3" class="form-control" style="width:280px;" placeholder="예) 1T">
		<a id="btnMaterialDel_1_3" href="javascript:delMaterial(1,3)" class="btn-del" style="display: none;"></a>
		</li>
		
		</ul>
		<div class="btn_add" style="padding:50 0 20px 300px; width:700px;">
		<button type="button" onclick="addMaterial(1)" class="btn btn-default">
		<i class="bi bi-plus-circle"></i> 추가</button>
		</div>
		</li>
		</div>
    </div>
    
    <!-- 재료정보 끝 -->
    
 <!-- 요리순서 시작 -->
    <div class="cont_box pad_l_60">
      <input type="file" name="file" id="multifile_1" file_gubun="step" style="display:none;" multiple="">
      <p class="cont_tit3">요리순서
    	
      </p>
	  <span class="guide mag_b_15"><b>요리의 맛이 좌우될 수 있는 중요한 부분은 빠짐없이 적어주세요.</b>
	  </span>
      <div id="divStepArea" class="ui-sortable">
      <div id="divStepItem_1" class="step">
            <p id="divStepNum_1" class="cont_tit2_1 ui-sortable-handle" style="cursor:pointer" data-original-title="" title="">Step1</p>
            <div id="divStepText_1" style="display:inline-block">
                <textarea name="step_text[]" id="step_text_1" class="form-control step_cont" 
                placeholder="예) 소고기는 기름기를 떼어내고 적당한 크기로 썰어주세요." style="height:160px; width:430px; resize:none;">
                </textarea>
            </div>
            <div id="divStepUpload_1" style="display:inline-block">
                <input type="hidden" name="step_no[]" id="step_no_1" value="">
                <input type="hidden" name="step_photo[]" id="step_photo_1" value="">
                <input type="hidden" name="new_step_photo[]" id="new_step_photo_1" value="">
                <input type="hidden" name="del_step_photo[]" id="del_step_photo_1" value="">
                <div style="position:absolute;left:-3000px">
                <input type="file" name="q_step_file_1" id="q_step_file_1" file_gubun="step" accept="jpeg,png,gif" style="display:;width:0px;height:0px;font-size:0px;" text=""></div>
                <div id="divStepPhotoBox_1" is_over="0">
                    <img id="stepPhotoHolder_1" onclick="browseStepFile(1)" src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" width="160" height="160" style="cursor:pointer">
                </div>
            </div>
          </div></div>
      <!-- step template -->
      <div id="divStepTemplate" style="display:none">
          <div id="divStepItem_STEP" class="step">
            <p id="divStepNum_STEP" class="cont_tit2_1" style="cursor:pointer">Step 1</p>
            <div id="divStepText_STEP" style="display:inline-block">
                <textarea name="step_text[]" id="step_text_STEP" class="form-control step_cont" placeholder="" style="height:160px; width:430px; resize:none;"></textarea>
            </div>
            <div id="divStepUpload_STEP" style="display:inline-block">
                
                <div id="divStepPhotoBox_STEP" is_over="0">
                    <img id="stepPhotoHolder_STEP" onclick="browseStepFile(__STEP)" src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" width="160" height="160" style="cursor:pointer">
                </div>
            </div>
         
            

          </div>
      </div><!--/step template-->

      <div class="btn_add mag_b_25" style="padding:0 0 20px 180px; width:820px;">
      <button type="button" onclick="addStep()" class="btn btn-default">
      <span class="glyphicon glyphicon-plus-sign"></span>
      <i class="bi bi-plus-circle"></i> 순서추가
      </button>
      </div>

	<div class="noti">
    </div>
    </div>
 <!-- 요리순서 끝 -->
 
 
 
             </div><!--/regi_center-->
  <div class="regi_btm">
    <button type="button" onclick="doSubmit('save')" class="btn-lg btn-primary">저장</button>      
   <button type="button" onclick="history.back();" class="btn-lg btn-default">취소</button>
      </div>
</div><!-- /container --></form>


<input type="hidden" name="isRestrict" value="false" /> 
<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/jquery-ui-1.11.4.js" charset="utf-8"></script>
<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/tag-it.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/ez_dialog.min_20160430.js" charset="utf-8"></script>
<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/coreutil.min_20170112.js" charset="utf-8"></script>
<script type="text/javascript" src="https://recipe1.ezmember.co.kr/static/js/ui.min_20150609.js" charset="utf-8"></script>

                                 
              
     <!-- footer 시작 -->  
      <%@ include file="/WEB-INF/views/include/footer.jsp" %>
      <!-- footer 종료 --> 
      
     <form name="bbsForm" id="bbsForm" method="post">
     <input type="hidden" name="recipeCode" value="${recipeInfo.recipeCode}" /> 
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>      
</body>
</html>