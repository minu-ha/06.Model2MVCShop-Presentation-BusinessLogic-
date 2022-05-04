<%@ page contentType="text/html; charset=euc-kr" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>구매정보수정</title>

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
		
		//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
$(function() {
	
	
	//==> 추가된부분 : "수정" "확인"  Event 연결 및 처리
	 $(function() {
		//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함.	
		 $( "#update" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
			
			
			//$("input:hidden[name='prodNo']").val( value );
			$("form").attr("method" , "POST").attr("action" , "/purchase/updatePurchase").submit();	
			//self.location = "/product/updateProduct"
			
		});
		
	
	});
	
	//============= "취소"  Event 처리 및  연결 =============
	 $( "#cancle" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('확인')" ).html() );
					history.go(-1);
	});
});	

	</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<br/>
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
   	
   	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
	
	 
<input type="hidden" name="tranNo" value="${ purchase.tranNo }"/> 
	
		
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.buyer.userId }" placeholder="중복확인하세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      </span>
		    </div>
		  </div>
		
		  	 <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">	
				 <input type="radio" id="paymentOption" name="paymentOption" value="현금결제">
 					 <label for="male">현금결제</label>
  				<input type="radio" id="paymentOption" name="paymentOption" value="카드결제">
 					 <label for="female">카드결제</label>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName}" placeholder="제조일자">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" placeholder="구매자 연락처">
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송지 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr" value="${purchase.dlvyAddr}" placeholder="배송지 주소">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest" value="${purchase.divyRequest}" placeholder="요청사항">
		    </div>
		  </div>
		  
		  		   <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망날짜</label>
		    <div class="col-sm-4">
 			 <input type="date" name="divyDate"  class="form-control" value="${purchase.divyDate}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="update" class="btn btn-primary"  >수정완료</button>
			 <button type="button" id="cancle" class="btn btn-primary"  >취소</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->


</body>
</html>