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
	
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
   
   <!-- jQuery UI toolTip ��� CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip ��� JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">

$(function() {
	
	
	//==> �߰��Ⱥκ� : "����" "Ȯ��"  Event ���� �� ó��
	 $(function() {
		//==> DOM Object GET 3���� ��� ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
		//==> 1 �� 3 ��� ���� : $("tagName.className:filter�Լ�") �����.	
		 $( "#add" ).on("click" , function() {
			//Debug..
			//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
			
			
			//$("input:hidden[name='prodNo']").val( value );
			$("form").attr("method" , "POST").attr("action" , "/product/listProduct").submit();	
			//self.location = "/product/updateProduct"
			
		});
		
	
	});
	
	//============= "���"  Event ó�� ��  ���� =============
	 $( "#cancle" ).on("click" , function() {
					//Debug..
					//alert(  $( "td.ct_btn01:contains('Ȯ��')" ).html() );
					history.go(-1);
	});
});	



</script>
</head>

<body bgcolor="#ffffff" text="#000000">
<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
   	
<br/>
<br/>
<br/>
<br/>

<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">��ǰ���</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
	
	
	 <input type="hidden" name="menu" value ="manage"/>
		
		  <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName"  >
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="manuDate" name="manuDate" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" " >
		    </div>
		  </div>
		  
		 <div class="form-group">
		    <label for="fileName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="fileName" name="fileName" >
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <label for="quantity" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="quantity" name="quantity" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" id="add" class="btn btn-primary"  >���</button>
			 <button type="button" id="cancle" class="btn btn-primary"  >���</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  ȭ�鱸�� div Start /////////////////////////////////////-->

</body>
</html>