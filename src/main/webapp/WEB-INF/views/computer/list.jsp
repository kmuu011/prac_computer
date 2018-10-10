<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/script.jsp"/>
</head>
<body>

<input type="text" name="ciname">
<button>검색</button><br><br>

	<table border="1">
	
		<thead id="tHead">

		</thead>
		
		<tbody id="tBody">
		
		</tbody>
		
	</table>
	
	<button>등록</button>
	<button>삭제</button>


<script>
	window.addEventListener('load', showList());
	
	function showList(){
		var conf = {url : '/computerinfo',
			success:getList
			};
	
		var head = '';
		var body = '';
		
		var au = new AjaxUtil(conf);
		au.send();
		
		function getList(res){
			res = JSON.parse(res);
			
			if(!head){
				document.querySelector('#tHead').innerHTML = getMetaData(res[0]);
			}
			
			document.querySelector('#tBody').innerHTML = getInfoList(res);
		}

	}
	
	var btns = document.querySelectorAll("button");
	
	btns.forEach((e) => {
		e.onclick = function(){
			
			if(this.innerHTML == '등록'){
				location.href="/uri/computer:insert";
				
			}else if(this.innerHTML == '삭제'){
				var list = [];
				document.querySelectorAll("input[name=chk]:checked").forEach((e) =>{
					list.push(e.value);
				});
				
				var url = "/computerinfod";
				var method = "POST";
				var params = JSON.stringify(list);
				alert(params)
				var conf = {url:url,
						method:"POST",
						params:params};
				
				var au = new AjaxUtil(conf);
				au.send();
				
				/* var xhr = new XMLHttpRequest();
			
				xhr.onreadystatechange = function(){
					if(xhr.readyState == xhr.DONE){
						if(xhr.status == 200){
							alert(1);
						}
					}
				}
				
				xhr.open(method,url);
				xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
				xhr.send(params); */
				
			}else if(this.innerHTML=='검색'){
				
			}
		}
	});
	
	function allChk(e){
		document.querySelectorAll("input[name=chk]").forEach((d) => {
			d.checked = e.checked;
		});
	}

</script>

</body>
</html>