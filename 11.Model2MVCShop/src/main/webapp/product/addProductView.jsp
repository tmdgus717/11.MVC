<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
<title>상품등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="../javascript/calendar.js">
</script>

<script type="text/javascript">

function fncAddProduct(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;

	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();
	
	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}

	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
	$("form").attr("method","POST").attr("action","/product/addProduct").submit();
}

$(function(){
	 $( "#ok" ).on("click" , function() {
		 fncAddProduct();
	});
});

$(function(){
	 $( "#cc" ).on("click" , function() {
		//alert(  $( "td.ct_btn01:contains('취소')" ).html() );
		 $("form")[0].reset();
	});
});

$(function(){
	$("#manuDate").datepicker({
		  format: "yyyy-m",
	        minViewMode: 1,
	        language: "ko",
	        autoclose: true
    })
    $("#manuDate").on('click', function (e) {
    	const dateArr = $('#manuDate').val().split('-')
        location.href = '/history?year=' + dateArr[0] + '&month=' + dateArr[1]

    });
});



</script>

</head>

<body bgcolor="#ffffff" text="#000000">

<div class="navbar  navbar-default">
        <div class="container">
        	<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
   		</div>
</div>

<div class="container">

	<h1 class="bg-primary text-center">상 품 등 록</h1>
	
	<form name="detailForm" class="form-horizontal">
	


	 <div class="form-group">
		    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품이름">
		    </div>
	</div>
		  
	 <div class="form-group">
		    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    </div>
	</div>
	
	 <div class="form-group">
	 <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
	 	<div class="col-sm-4">
	 		<input type="text" id="manuDate" class="form-control" value="2019-06-27" />
	 	</div>
	 </div>
	 
	 <div class="form-group">
		    <label for="price"" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="price"" name="price" placeholder="가격">
		    </div>
	 </div>
		  

	<div class="form-group">
		    <label for="fileName"" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		    <div class="col-sm-4">
		      <input multiple="multiple" type="file" class="form-control" 
		      id="uploadFile"" name="uploadFile" placeholder="상품이미지">
		    </div>
	 </div>

	 <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary" id="ok" >등 &nbsp;록</button>
			  <button type="button" class="btn btn-primary" id="cc" >취&nbsp;소</button>
		    </div>
	</div>
</form>
</div>
</body>
</html>