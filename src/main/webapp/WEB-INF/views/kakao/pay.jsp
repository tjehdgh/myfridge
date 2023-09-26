<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/progress-bar.css" type="text/css">
<script type="text/javascript">
$(document).ready(function() {
    
   $("#btnPay").on("click", function() {
      $("#btnPay").prop("disabled", true);
   
      if($.trim($("#itemCode").val()).length <= 0)
      {
         alert("상품코드를 입력하세요.");
         $("#itemCode").val("");
         $("#itemCode").focus();
         
         $("#btnPay").prop("disabled", false);
         return;
         
      }

      if($.trim($("#itemName").val()).length <= 0)
      {
         alert("상품명을 입력하세요.");
         $("#itemName").val("");
         $("#itemName").focus();
         
         $("#btnPay").prop("disabled", false);
         return;
               
      }
      
      if($.trim($("#quantity").val()).length <= 0)
      {
         alert("수량을 입력하세요.");
         $("#quantity").val("");
         $("#quantity").focus();
         
         $("#btnPay").prop("disabled", false);
         return;         
      }
      
      if(!icia.common.isNumber($("#quantity").val()))
      {
         alert("수량은 숫자만 입력 가능합니다.");
         $("#quantity").val("");
         $("#quantity").focus();
         
         $("#btnPay").prop("disabled", false);
         return;         
      }
      
      if($.trim($("#totalAmount").val()).length <= 0)
      {
         alert("금액을 입력하세요.");
         $("#totalAmount").val("");
         $("#totalAmount").focus();
         
         $("#btnPay").prop("disabled", false);
         return;         
      }
      
      if(!icia.common.isNumber($("#totalAmount").val()))
      {
         alert("금액은 숫자만 입력 가능합니다.");
         $("#totalAmount").val("");
         $("#totalAmount").focus();
         
         $("#btnPay").prop("disabled", false);
         return;         
      }
      
      icia.ajax.post({
         url:"/kakao/payReady",
         data:{
            itemCode:$("#itemCode").val(),
            itemName:$("#itemName").val(),
            quantity:$("#quantity").val(),
            totalAmount:$("#totalAmount").val()
         },
         success:function(response)
         {
           if(response.code == 0)
           {
              //alert("성공");
              var orderId = response.data.orderId; //
              var tId = response.data.tId; // 카카오페이가 생성한 값
              var pcUrl = response.data.pcUrl; // 
              
              $("#orderId").val(orderId);
              $("#tId").val(tId);
              $("#pcUrl").val(pcUrl);
              
              var win = window.open('','kakaoPopUp','toolbar=no,location=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=540,height=700,left=100,top=100');
              
              $("#kakaoForm").submit();
              $("#btnPay").prop("disabled", false);
           }
           else
           {
              alert("오류가 발생하였습니다.");
              $("#btnPay").prop("disabled", false);
           }
         },
         error:function(error)
         {
            icia.common.error(error);
            $("#btnPay").prop("disabled", false);
         }
      });
      
      
      
      
   });
});

function movePage()
{
   location.href = "/board/list";
}
</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/navigation.jsp" %>
<div class="container">
   <h2>카카오페이</h2>
   <form name="payForm" id="payForm" method="post">
      상품코드<input type="text" name="itemCode" id="itemCode" maxlength="32" class="form-control mb-2" placeholder="상품코드" value="0123456789" />
      상품명<input type="text" name="itemName" id="itemName" maxlength="50" class="form-control mb-2" placeholder="상품명" value="비타민씨" />
      수량<input type="text" name="quantity" id="quantity" maxlength="3" class="form-control mb-2" placeholder="수량" value="1" />
      금액<input type="text" name="totalAmount" id="totalAmount" maxlength="10" class="form-control mb-2" placeholder="금액" value="30000" />
      <div class="form-group row">
         <div class="col-sm-12">
            <button type="button" id="btnPay" class="btn btn-primary" title="카카오페이">카카오페이</button>
         </div>
      </div>
   </form>
   <form name="kakaoForm" id="kakaoForm" method="post" target="kakaoPopUp" action="/kakao/payPopUp">
      <input type="hidden" name="orderId" id="orderId" value="" />
      <input type="hidden" name="tId" id="tId" value="" />
      <input type="hidden" name="pcUrl" id="pcUrl" value="" />
   </form>
</div>
</body>
</html>