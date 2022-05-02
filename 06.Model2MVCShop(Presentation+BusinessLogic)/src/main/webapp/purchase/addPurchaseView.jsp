<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
<title>상품등록</title>

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

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">



$(function() {
	 
	//==> 검색 Event 연결처리부분
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 과 3 방법 조합 : $("tagName.className:filter함수") 사용함. 
	 $( "td.ct_btn01:contains('취소')" ).on("click" , function() {
		//Debug..
			history.go(-1);
	});
	
	
	//==> userId LINK Event 연결처리
	//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 3 과 1 방법 조합 : $(".className tagName:filter함수") 사용함.
	
	
	
	$( "#request" ).on("click" , function() {
		//json 형식으로 데이터 set
	/* 	var params ={
					  
					  buyer : $("#buyer").val()
					, paymentOption : $("#paymentOption").val()
					, receiverName : $("#receiverName").val()
					, receiverPhone : $("#receiverPhone").val()
					, divyAdder : $("#divyAdder").val()
					, divyRequest : $("#divyRequest").val()
					, prodNo : $("#prodNo").val()
					, divyDate : $("#divyDate").val()
				
					} */
		
		
		$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
			
		/* 	$.ajax({ 
				  		url : "/purchase/json/addPurchase"
				  	  , method : "POST"
				  	  , dataType : "json"
					  , headers : {
									 "Accept" : "application/json"
								   , "Content-Type" : "application/json"
								  }
				  	  , data : JSON.stringify( params ) 
					  , success : function(JSONData , status) {
			
						  var displayValue = "<h3>"
								+"상품번호 : "+JSONData.prodNo+"<br/>"
								+"상품명 : "+JSONData.userName+"<br/>"
								+"상품상세정보 : "+JSONData.prodDetail+"<br/>"
								+"제조일자 : "+JSONData.manudate+"<br/>"
								+"가격 : "+JSONData.price+"<br/>"
								+"등록일자 : "+JSONData.regDate+"<br/>"
								+"구매자 아이디 : "+JSONData.buyer+"<br/>"
								+"구매방법 : "+JSONData.paymentOption+"<br/>"
								+"구매자 이름 : "+JSONData.receiverName+"<br/>"
								+"구매자 연락처 : "+JSONData.receiverPhone+"<br/>"
								+"배송지 주소 : "+JSONData.divyAdder+"<br/>"
								+"요청사항 : "+JSONData.divyRequest+"<br/>"
								+"배송희망날짜 : "+JSONData.divyDate+"<br/>"
								+"</h3>";
							$("h3").remove();
							$( "#"+tranNo+"" ).html(displayValue);
						}
				}); */
				////////////////////////////////////////////////////////////////////////////////////////////
			
	});
	
	//==> userId LINK Event End User 에게 보일수 있도록 
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	$("h7").css("color" , "red");
	
	//==> 아래와 같이 정의한 이유는 ??
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});	


</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->


<br/>
<br/>

<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">상품구매</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
	
	
	 <input type="hidden" name="menu" value ="manage"/>
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">상품번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}"  >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		    </div>
		  </div>
		 
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}" >
		    </div>
		  </div>
	
		  
		  
		  
		 	 <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">등록일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate}" >
		    </div>
		  </div>
		  
		  	
		  
		 <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">구매자 아이디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}"  readonly>
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="paymentOption" name="paymentOption"  >
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">구매자 이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName"  >
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">구매자 연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" >
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">배송지 주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr"  >
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest"  >
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">배송희망날짜</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate"  >
		      <img src="../images/ct_icon_date.gif" width="15" height="15" 
	onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="request" class="btn btn-primary"  >구매확인</button>
			 <button type="button" id="cancle" class="btn btn-primary"  >취소</button>
		    </div>
		  </div>
		  
		  
		  
<input type="hidden" name="prodNo" value="${product.prodNo }"  />
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->




</body>
</html>