<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
    
   $("#btnWrite").on("click", function() {  //글쓰기 버튼
      document.bbsForm.hiBbsSeq.value = "";
      document.bbsForm.action = "/board/writeForm";
      document.bbsForm.submit();
   });
   
   $("#btnSearch").on("click", function() {  //조회버튼
	   document.bbsForm.hiBbsSeq.vlaue = "";
       document.bbsForm.searchType.value = $("#_searchType").val();
       document.bbsForm.searchValue.value = $("#_searchValue").val();
       document.bbsForm.curPage.value = "1";
       document.bbsForm.action = "/board/list";
       document.bbsForm.submit();

   });
});

function fn_view(bbsSeq)
{
	document.bbsForm.hiBbsSeq.value = bbsSeq;  //bbsform 에 있는 조회항목,제목,페이지등 다가지고감
	document.bbsForm.action = "/board/view";
	document.bbsForm.submit();
}

function fn_list(curPage)
{
	document.bbsForm.hiBbsSeq.value = "";
	document.bbsForm.curPage.value = curPage;  //매개변수로 받은 curPage를 value curPage에 넘김
	document.bbsForm.action = "/board/list";
	document.bbsForm.submit();
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<div class="container">
   
   <div class="d-flex">
      <div style="width:50%;">
         <h2>게시판</h2>
      </div>
      <div class="ml-auto input-group" style="width:50%;">
         <select name="_searchType" id="_searchType" class="custom-select" style="width:auto;">
            <option value="">조회 항목</option>
            <option value="1" <c:if test ='${searchType eq "1"}'>selected</c:if>>작성자</option>
            <option value="2" <c:if test ='${searchType eq "2"}'>selected</c:if>>제목</option>
            <option value="3" <c:if test = '${searchType eq "3"}'>selected</c:if>>내용</option>
         </select>
         <input type="text" name="_searchValue" id="_searchValue" value="${searchValue}" class="form-control mx-1" maxlength="20" style="width:auto;ime-mode:active;" placeholder="조회값을 입력하세요." />
         <button type="button" id="btnSearch" class="btn btn-secondary mb-3 mx-1">조회</button>
      </div>
    </div>
    
   <table class="table table-hover">
      <thead>
      <tr style="background-color: #dee2e6;">
         <th scope="col" class="text-center" style="width:10%">번호</th>
         <th scope="col" class="text-center" style="width:55%">제목</th>
         <th scope="col" class="text-center" style="width:10%">작성자</th>
         <th scope="col" class="text-center" style="width:15%">날짜</th>
         <th scope="col" class="text-center" style="width:10%">조회수</th>
      </tr>
      </thead>
      <tbody>
<c:if test ="${!empty list}">  <!-- list 객체가 비어있지 않을때 -->
	<c:forEach var = "hiBoard" items = "${list}" varStatus = "status"><!-- list를 가져올떄마다 hiBoard에넣음 -->
      <tr>
      <c:choose>
         <c:when test = "${hiBoard.hiBbsIndent eq 0}">
         <td class="text-center">${hiBoard.hiBbsSeq}</td>  <!-- INDNET가 0일떄 -->
         </c:when>
         <c:otherwise>
         <td class="text-center"></td>
         </c:otherwise>
	  </c:choose>
         <td>
         
         
            <a href="javascript:void(0)" onclick="fn_view(${hiBoard.hiBbsSeq})"> <!-- 현재 게시물의 대한 번호를 가지고감 --> 
	  <c:if test ="${hiBoard.hiBbsIndent > 0}">
	  		<img src = "/resources/images/sss.gif" style = "margin-left:${hiBoard.hiBbsIndent}em" />
      </c:if>      
               <c:out value = "${hiBoard.hiBbsTitle}" />  <!-- 제목 -->
            </a>
            
            
         </td>
       <td class="text-center">${hiBoard.userName}</td> <!-- 작성자 -->
       <td class="text-center">${hiBoard.regDate}</td> <!-- 등록일 -->
       <td class="text-center"><fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${hiBoard.hiBbsReadCnt}" /></td>
      </tr>
      </c:forEach>
</c:if>      
      </tbody>
      <tfoot>
      <tr>
            <td colspan="5"></td>
        </tr>
      </tfoot>
   </table>
   <nav>
      <ul class="pagination justify-content-center">
<c:if test = "${!empty paging}">
	<c:if test = "${paging.prevBlockPage gt 0}">  <!-- gt - 0보다 크냐,> -->
         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">이전블럭</a></li>
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
         <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">다음블럭</a></li>
   </c:if>
</c:if>
      </ul>
   </nav>
   
   <button type="button" id="btnWrite" class="btn btn-secondary mb-3">글쓰기</button>
   
   <form name="bbsForm" id="bbsForm" method="post">
      <input type="hidden" name="hiBbsSeq" value="" />
      <input type="hidden" name="searchType" value="${searchType}" />
      <input type="hidden" name="searchValue" value="${searchValue}" />
      <input type="hidden" name="curPage" value="${curPage}" />
   </form>
</div>
</body>
</html>