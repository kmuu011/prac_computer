<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>Insert title here</title>

<script src="/rsc/js/AjaxUtil.js?ver=0.1"></script>
<script src="/rsc/js/Utils.js?ver=0.1"></script>

</head>
<body>
<form id="form" method="POST" action="/computerinfo" enctype="multipart/form-data">

</form>



<script>
window.addEventListener('load', function(){
	
	var conf = {
			url:'/computerinfoMD',
			success:success
	}
	
	function success(res){
		res = JSON.parse(res);
		var html = '';
		
		for(var k in res){
			if(k.indexOf('cino') == -1){
				html += k.substring(k.indexOf('i')+1) + ' : <input type="text" name="' + k  + '"><br>';
			}
		}
		html += '<button type="button" onclick="insert()">등ㅋ록</button>'
		
		document.querySelector('#form').innerHTML = html;
	}
	
	var au = new AjaxUtil(conf);
	au.send();
	
});

function insert(){
	var form = document.querySelector("form");
	var formData = new FormData(form);
	
	var params = formDataToJson(formData);
	
	var conf = {url:form.getAttribute('action'),
					method:form.getAttribute('method'),
					param:params
	};
		
	var au = new AjaxUtil(conf);
	au.send();
}


	
</script>

</body>
</html>