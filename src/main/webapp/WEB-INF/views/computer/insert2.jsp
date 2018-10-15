<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/script.jsp"/>
</head>
<body>
<jsp:include page="/WEB-INF/views/nav/topnav.jsp"/>

<form id="insertform" method="POST"  action="/computerinfoTest" enctype="multipart/form-data">

</form>



<script>
window.addEventListener('load', function(){
	
	var conf = {
			url:'/computerinfoMD',
			success:success
	}
	
	function success(res){
		res = JSON.parse(res);
		var html = '<table class="table table-hover">';
		
		for(var k in res){
			html += '<tr>';
			if(k.indexOf('cino') == -1 && k.indexOf('img') == -1){
				html += '<th>' + k.substring(k.indexOf('i')+1) + '</th><td><input type="text" name="' + k  + '" maxlength="33" required></td>';
			}else if(k.indexOf('img') != -1){
				html += '<th>' + k.substring(k.indexOf('i')+1) + '</th><td><input type="file" name="' + k  + '" maxlength="33" required></td>';				
			}
			html += '</tr>';
		}
		html += '<tr>';
		html += '<td><button type="button" onclick="insert()" class="btn btn-outline-primary">등록</button></td>';
		html += '<td><a href="/uri/computer:list2" class="btn btn-outline-primary">뒤로</a></td>';
		html += '</tr>';
		html +='</table>';
		document.querySelector('#insertform').innerHTML = html;
	}
	
	var au = new AjaxUtil(conf);
	au.send();
});

function insert(){
	if(!checkValues(document.querySelectorAll("input"))) return;
	
	var form = document.querySelector("form");
	var formData = new FormData(form);
	
	var conf = {url:form.getAttribute('action'),
					method:form.getAttribute('method'),
					formData:formData,
					success:success
	};
	
	function success(res){
		alert("등록 성공!");
		location.href="/uri/computer:list2";
	}
		
	var au = new AjaxUtil(conf);
	au.send();
}



	
</script>

</body>
</html>