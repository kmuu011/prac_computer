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
<form enctype="multipart/form-data">
	T : <input type="text"  name="tname"><br>
	<input type="file" name="tfile"><br>
<button type="button">읭</button>

</form>
<img src="/rsc/upload\3661e5ab5a2d0be730b1aaa0eba1cfbf9175a19f.jpg" height="200px">

<script>

document.querySelector("button").onclick = function(){
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