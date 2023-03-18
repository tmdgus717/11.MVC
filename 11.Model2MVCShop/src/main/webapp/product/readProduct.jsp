<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<html>
<head>
<title>��ǰ���</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
    </style>
<script type="text/javascript">

$(function(){
	 $( "button:contains('Ȯ��')" ).on("click" , function() {
		//alert(  $( "td.ct_btn01:contains('���')" ).html() ); �̱���!
		 $(location).attr('href', '/product/listProduct?menu=manage');
	});
});

$(function(){
	 $( "button:contains('�߰����')" ).on("click" , function() {
		//alert(  $( "td.ct_btn01:contains('���')" ).html() );
		 $(location).attr('href', '../product/addProductView.jsp;');
	});
});

</script>
</head>

<body bgcolor="#ffffff" text="#000000">
	<jsp:include page="/layout/toolbar.jsp" />
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">��ǰ ����</h3>
	    </div>
			
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${product.prodDetail}</div>
		</div>
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${product.manuDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�� ��</strong></div>
			<div class="col-xs-8 col-md-4">${product.price}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�̹���</strong></div>
			<c:forEach var="i" items="${fn:split(product.fileName,'&')}" varStatus="status">
   							<img src="../images/uploadFiles/${i}"/><br/>
   			</c:forEach>
		</div>
		
		<hr/>

		
		<div class="row">
	  		<div class="col-md-12 text-right ">
	  			<button type="button" class="btn btn-primary">����</button>
	  			<button type="button" class="btn btn-primary">Ȯ��</button>
	  		</div>
		</div>
		
		<br/>
		
 	</div>
 	
</body>
</html>