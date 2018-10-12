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
<jsp:include page="/WEB-INF/views/nav/topnav.jsp"/>



<form id="form"  onsubmit="return false;">
<div class="form row">
<div class="col-3">
<select  id="op"  class="custom-select mr-sm-2"  required>
<option selected>선택</option>
	<option value="ciname">이름</option>
	<option value="cicpu">CPU</option>
	<option value="cipower">파워</option>
	<option value="cimb">메인보드</option>
	<option value="ciram">RAM</option>
	<option value="civga">VGA</option>
	<option value="cihdd">HDD</option>
	<option value="cissd">SSD</option>
	<option value="ciodd">ODD</option>
	<option value="cicase">케이스</option>
</select>
<div class="invalid-feedback">항목을 선택해야합니다.</div>
</div>
<div class="col-2">
<input type="text"  class="form-control"  id="sch" placeholder="검색어 입력" onkeypress="if(event.keyCode==13){search();}" required>
<div class="invalid-feedback">최소 2자이상 입력가능</div>
</div>
<button type="button" onclick="search()" class="btn btn-outline-primary">검색</button>
</div><br>

	<div class="form row">
	<table  class="table table-hover">	
	
		<thead  class="thead-dark"  id="tHead" >
		
		</thead>

		
		<tbody id="tBody" style="cursor:pointer">
		
		</tbody>
		
	</table>
</div>

	<button type="button" class="btn btn-outline-primary">등록</button>
	<button type="button" class="btn btn-outline-primary">삭제</button>
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

				if(list.length == 0){
					alert('삭제할 항목를 체크해주세요.');
					return;
				}
				
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
				search();
				
			}
		}
	});
	
	function search(){
		var op = document.querySelector("#op").value;
		var sch = document.querySelector("#sch").value;
		
		if(op == '선택'){
			alert('검색 옵션을 선택하세요.');
			return;
		}
		
		if(sch.trim() ==""){
			alert('검색어를 입력해주세요')
			return;
		}
		
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
		if(!checkValues(document.querySelectorAll("input"))) return;

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