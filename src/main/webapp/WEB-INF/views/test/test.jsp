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


<form enctype="multipart/form-data">
	T : <input type="text"  name="tname" maxlength="33" required><br>
	<input type="file" name="tfile"><br>
<button type="button" name="up" class="btn btn-outline-primary">읭</button>

</form>
<img src="/rsc/upload\2c03f9e3b51709304e695af0b27762da.jpg" height="200px">

<script>

document.querySelector("button[name=up]").onclick = function(){
	var form = document.querySelector("form");
	var formData = new FormData(form);
	var url = "/testT";
	var method = "POST";

	var xhr = new XMLHttpRequest();
	
	xhr.onreadystatechange = function(){
		alert(xhr.response);
	}
	
	xhr.open(method,url);
	xhr.send(formData);
}

</script>

</body>
</html>