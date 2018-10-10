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
<form id="form">
<div class="form-group">
<input type="text"  class="form-control"  id="sch" placeholder="검색">
<select  id="op">
	<option value="ciname">이름</option>
	<option value="cicpu">CPU</option>
	<option value="cipower">Power</option>
	<option value="cimb">Mainboard</option>
	<option value="ciram">RAM</option>
	<option value="civga">VGA</option>
	<option value="cihdd">HDD</option>
	<option value="cissd">SSD</option>
	<option value="ciodd">ODD</option>
	<option value="cicase">CASE</option>
</select>
</div>

<button type="button" class="btn btn-secondary">검색</button><br><br>

	<table  class="table table-bordered table-hover">
	
		<thead  id="tHead">

		</thead>
		
		<tbody id="tBody">
		
		</tbody>
		
	</table>


	<button type="button" class="btn btn-secondary">등록</button>
	<button type="button" class="btn btn-secondary">삭제</button>

</form>

<script>
	window.addEventListener('load', showList());
	
	function showList(search){
		var head = '';
		var body = '';
		
		if(!search){
			var conf = {url : '/computerinfo',
				success:getList
				};
			
			var au = new AjaxUtil(conf);
			au.send();
		}else{
			getList(search);
		}
		
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
				
				var url = "/computerinfoD";
				var method = "POST";
				var params = JSON.stringify(list);
				var conf = {url:url,
						method:method,
						params:params,
						success:successDel
				};
				
				var au = new AjaxUtil(conf);
				au.send();
				
				function successDel(res){
					alert(JSON.parse(res) + "개 삭제 완료");
					showList();
				}
				
			}else if(this.innerHTML=='검색'){
				var op = document.querySelector("#op").value;
				var sch = document.querySelector("#sch").value;
				
				var url = "/computerSearch";
				var method = "POST";
				var params = '{"' + op + '":"' + sch + '"}';
				var conf = {url:url,
						method:method,
						params:params,
						success:search
						};
				
				var au = new AjaxUtil(conf);
				au.send();
				
				function search(res){
					showList(res);
				}
				
			}
		}
	});
	
	function allChk(e){
		document.querySelectorAll("input[name=chk]").forEach((d) => {
			d.checked = e.checked;
		});
	}
	

	function ciView(cino){
		var url = "/computerinfo/" + cino;
		var conf = {url:url,
				success:viewInfo};
		
		var au = new AjaxUtil(conf);
		au.send();
		
		function viewInfo(res){
			document.querySelector("#form").innerHTML = getView(JSON.parse(res));
		}
	}
	
	function modify(cino){
		var url = "/computerinfo/" + cino;
		var conf = {url:url,
				success:updateView};
		
		var au = new AjaxUtil(conf);
		au.send();

		function updateView(res){
			document.querySelector('#form').innerHTML = getModify(JSON.parse(res));
		}
	}
	
	function updateInfo(){
		var form = document.querySelector("form");
		var formData = new FormData(form);
		
		var params = formDataToJson(formData);
				
		var conf = {url:"/computerinfo",
						method:"PUT",
						params:params,
						success:success
		};
		
		function success(res){
			alert("수정 완료!");
			location.href="/uri/computer:list";
		}
			
		var au = new AjaxUtil(conf);
		au.send();
	}

</script>

</body>
</html>