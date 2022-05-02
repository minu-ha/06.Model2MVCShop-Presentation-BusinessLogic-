<%@ page contentType="text/html; charset=EUC-KR" %>

<html>
<head>
<title>��ǰ���</title>

<!-- ���� : http://getbootstrap.com/css/   ���� -->
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
	 
	//==> �˻� Event ����ó���κ�
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����. 
	 $( "td.ct_btn01:contains('���')" ).on("click" , function() {
		//Debug..
			history.go(-1);
	});
	
	
	//==> userId LINK Event ����ó��
	//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
	//==> 3 �� 1 ��� ���� : $(".className tagName:filter�Լ�") �����.
	
	
	
	$( "#request" ).on("click" , function() {
		//json �������� ������ set
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
								+"��ǰ��ȣ : "+JSONData.prodNo+"<br/>"
								+"��ǰ�� : "+JSONData.userName+"<br/>"
								+"��ǰ������ : "+JSONData.prodDetail+"<br/>"
								+"�������� : "+JSONData.manudate+"<br/>"
								+"���� : "+JSONData.price+"<br/>"
								+"������� : "+JSONData.regDate+"<br/>"
								+"������ ���̵� : "+JSONData.buyer+"<br/>"
								+"���Ź�� : "+JSONData.paymentOption+"<br/>"
								+"������ �̸� : "+JSONData.receiverName+"<br/>"
								+"������ ����ó : "+JSONData.receiverPhone+"<br/>"
								+"����� �ּ� : "+JSONData.divyAdder+"<br/>"
								+"��û���� : "+JSONData.divyRequest+"<br/>"
								+"��������¥ : "+JSONData.divyDate+"<br/>"
								+"</h3>";
							$("h3").remove();
							$( "#"+tranNo+"" ).html(displayValue);
						}
				}); */
				////////////////////////////////////////////////////////////////////////////////////////////
			
	});
	
	//==> userId LINK Event End User ���� ���ϼ� �ֵ��� 
	$( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
	$("h7").css("color" , "red");
	
	//==> �Ʒ��� ���� ������ ������ ??
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
	       <h3 class=" text-info">��ǰ����</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
	
	
	 <input type="hidden" name="menu" value ="manage"/>
		
		  <div class="form-group">
		    <label for="prodNo" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodNo" name="prodNo" value="${product.prodNo}"  >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" value="${product.prodName}">
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${product.prodDetail}">
		    </div>
		  </div>
		 
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" value="${product.manuDate}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" value="${product.price}" >
		    </div>
		  </div>
	
		  
		  
		  
		 	 <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="regDate" name="regDate" value="${product.regDate}" >
		    </div>
		  </div>
		  
		  	
		  
		 <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">������ ���̵�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId}"  readonly>
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="paymentOption" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="paymentOption" name="paymentOption"  >
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="receiverName" class="col-sm-offset-1 col-sm-3 control-label">������ �̸�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName"  >
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="receiverPhone" class="col-sm-offset-1 col-sm-3 control-label">������ ����ó</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone}" >
		    </div>
		  </div>
		  
		  	 <div class="form-group">
		    <label for="dlvyAddr" class="col-sm-offset-1 col-sm-3 control-label">����� �ּ�</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="dlvyAddr" name="dlvyAddr"  >
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="divyRequest" class="col-sm-offset-1 col-sm-3 control-label">��û����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyRequest" name="divyRequest"  >
		    </div>
		  </div>
		  
		  
		   <div class="form-group">
		    <label for="divyDate" class="col-sm-offset-1 col-sm-3 control-label">��������¥</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate"  >
		      <img src="../images/ct_icon_date.gif" width="15" height="15" 
	onclick="show_calendar('document.detailForm.divyDate', document.detailForm.divyDate.value)"/>
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="request" class="btn btn-primary"  >����Ȯ��</button>
			 <button type="button" id="cancle" class="btn btn-primary"  >���</button>
		    </div>
		  </div>
		  
		  
		  
<input type="hidden" name="prodNo" value="${product.prodNo }"  />
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->




</body>
</html>