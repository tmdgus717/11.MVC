<%@ page contentType="text/html; charset=euc-kr" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>


<html>
<head>


<title>
상품 목록조회
</title>

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
	  body {
            padding-top : 50px;
        }
    </style>
    
<script type="text/javascript">

	function fncGetUserList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
	}
	
	$(function() { 
		$( "td.ct_btn01:contains('검색')" ).on("click" , function() {
			fncGetUserList(1);
	});
		
	$( "td:nth-child(2)" ).on("click" , function() {
		
		var a = $($(this).children());

		if(${param.menu=='manage'}){
		self.location ="/product/updateProduct?menu=${param.menu}&prodNo="+a[0].value;
		}else{
		self.location ="/product/getProduct?menu=${param.menu}&prodNo="+a[0].value; 
		}
	});
	

	
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
	
	
	/*$( "#searchKeyword" ).on("click" , function() {
			alert("hi");
	});*/


	$( "#searchKeyword" ).autocomplete({
		
		source : function(request,response){
			 $.ajax({
				 	url: "/product/json/getList",
				 	method: "POST",

	                dataType: "json",
	                headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
	                //request.term = $("#autocomplete").val() , $( "#autocompletesk" ).val()
	                data: JSON.stringify(
	                		{ "searchKeyword" : $( "#searchKeyword" ).val(),
	                		"searchCondition" : 	$("#searchCondition").val()
	                		}),
	                success: function(data) {
	                	response(data)
	                 
	                }
	           });
	        },
		minLength: 1
	   
		});
	
	$(  "td:nth-child(6) > i" ).on("click" , function() {
		//Debug..
		//alert(  $( this ).text().trim() );
		alert("hi");
		//////////////////////////// 추가 , 변경된 부분 ///////////////////////////////////
		//self.location ="/user/getUser?userId="+$(this).text().trim();
		////////////////////////////////////////////////////////////////////////////////////////////
		//var prodNo = $($(".ct_list_pop td:nth-child(5)").children());
		var prodNo = $(this).next().val();
		$.ajax( 
				{
					url : "/product/json/getProduct/"+prodNo,
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONData , status) {

						//Debug...
						//alert(status);
						//Debug...
						//alert("JSONData : \n"+JSONData);
						
						var displayValue = "<h6>"
													+"상품번호 : "+JSONData.prodNo+"<br/>"
													+"상품이름 : "+JSONData.prodName+"<br/>"
													+"상품정보 : "+JSONData.prodDetail+"<br/>"
													+"상품정보 : "+JSONData.price+"<br/>"
													+"</h6>";
						//Debug...									
						//alert(displayValue);
						$("h6").remove();
						$( "#"+prodNo+"" ).html(displayValue);
					}
			});
	});
	


});

	</script>
</head>

<body bgcolor="#ffffff" text="#000000">
	<jsp:include page="/layout/toolbar.jsp" />
<div style="width:98%; margin-left:10px;">
<!--%search %-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-info">
	       <h3>${param.menu=='manage'?"상품관리":"상품검색"}</h3>
	    </div>
	    
	    <!-- table 위쪽 검색 Start /////////////////////////////////////-->
	    <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>
		    
		    <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
				  <div class="form-group">
				    <select class="form-control" name="searchCondition"  id="searchCondition">
						<option value="0"  ${ ! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>상품명</option>
						<option value="1"  ${ ! empty search.searchCondition && search.searchCondition==2 ? "selected" : "" }>상품가격</option>
					</select>
				  </div>
				  
				  <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default" id="searchbutton">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value=""/>
				  
				</form>
	    	</div>
	    	
		</div>
		<!-- table 위쪽 검색 Start /////////////////////////////////////-->
		
		
      <!--  table Start /////////////////////////////////////-->
      <table class="table table-hover table-striped" >
      
        <thead>
          <tr>
            <th align="center">사진</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
          </tr>
        </thead>
       
		<tbody>
		
		  <c:set var="i" value="0" />
		  <c:forEach var="product" items="${list}">
			<c:set var="i" value="${ i+1 }" />
			<tr>
			  <td align="center"><img src="../images/uploadFiles/${product.fileName}" width="100" height="100" /></td>
			  <td id ="prName" align="left"  title="Click : 물건정보">${product.prodName} <input type="hidden" value="${product.prodNo}" class="prodNO"/></td>
			  <td align="left">${product.price}</td>
			  <td align="left">${product.manuDate}</td>
			  <td align="left">재고없음</td>
			  <td align="left">
			  	<i class="glyphicon glyphicon-ok" id="${product.prodNo}"></i>
			  	<input type="hidden" value="${product.prodNo}">
			  </td>
			</tr>
          </c:forEach>
        
        </tbody>
                                           
      </table>
	  <!--  table End /////////////////////////////////////-->
	  
 	</div>
 	<!--  화면구성 div End /////////////////////////////////////-->
 	
 	
 	<!-- PageNavigation Start... -->
	<jsp:include page="../common/pageNavigator_new.jsp"/>
	<!-- PageNavigation End... -->
</div>

</body>
</html>