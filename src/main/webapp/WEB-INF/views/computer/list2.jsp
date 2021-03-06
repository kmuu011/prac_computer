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

<jsp:include page="/WEB-INF/views/common/carousel.jsp"/>

<form id="form2"  onsubmit="return false">
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
<div class="col-2">
<button type="button" onclick="search()" class="btn btn-outline-primary">검색</button>
<button type="button" class="btn btn-outline-primary">등록</button>
</div>
</div>

</form>

<form id="form3">
 
</form>

<form id="form4">
	<div class="row" id="mainB">

	</div>
</form>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


<script>
	window.addEventListener('load', showList());
	
	function showList(search){
		showRecent();
		
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
			
			document.querySelector('#mainB').innerHTML = getInfoListNewt(res);
		}
	}
	
	function showRecent(){
		var conf = {url : '/computerinfoR',
				success:getList
				};
			
			var au = new AjaxUtil(conf);
			au.send();
			
			function getList(res){
				res = JSON.parse(res);
				
				document.querySelector('#form3').innerHTML = recentInfo(res);
			}
	}
	
	
	var btns = document.querySelectorAll("button");
	
	btns.forEach((e) => {
		e.onclick = function(){
			
			if(this.innerHTML == '등록'){
				location.href="/uri/computer:insert2";
				
			}else if(this.innerHTML == '삭제'){
				deleteInfo();
				
			}else if(this.innerHTML=='검색'){
				search();
			}
		}
	});
	
	function search(k,v){
		var op = k?k:document.querySelector("#op").value;
		var sch = v?v:document.querySelector("#sch").value;
		
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
			location.href= "#mainB";
		}
	}
	
	function deleteInfo(){
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
			document.querySelector("#mainB").innerHTML = getView(JSON.parse(res));
			location.href= "#mainB";
		}
		
	}
	
	function modify(cino){
		var url = "/computerinfo/" + cino;
		var conf = {url:url,
				success:updateView};
		
		var au = new AjaxUtil(conf);
		au.send();
		
		function updateView(res){
			document.querySelector('#mainB').innerHTML = getModify(JSON.parse(res));
			location.href= "#mainB";
		}
		
	}
	
	function updateInfo(){
		if(!checkValues(document.querySelectorAll("input[id=i]"))) return;

		var form = document.querySelector("#form4");
		var formData = new FormData(form);
				
		var conf = {url:"/computerinfoTest",
						method:"PUT",
						formData:formData,
						success:success
		};
		
		function success(res){
			if(res != -1){
				alert("수정 완료!");
				ciView(res);
			}else{
				alert('알 수 없는 이유로 수정이 실패했습니다.');
			}
		}
			
		var au = new AjaxUtil(conf);
		au.send();
	}
	
	function viewImg(img,cino){
		var html = '<table id="viewtable" class="table table-hover">';
		
		html += '<tr>';
		html += '<td><img class="view_big_img" src="' + img + '" onclick="ciView(' + cino + ')"></td>';
		html += '</tr>';
		
		html += '<tr>';
		html += '<td><button type="button" class="btn btn-outline-primary" onclick="ciView(' + cino + ')">뒤로</button></td>';
		html += '</tr>';
		html += '</table>';
		
		document.querySelector('tBody').innerHTML = html;
	}
	
	function delImg(cino){
		var url = '/imgdelete/' + cino;
		var method = 'PUT';
		var conf = {url:url,
				method:method,
				success:deleteImg};
		
		var au = new AjaxUtil(conf);
		au.send();
		
		function deleteImg(res){
			if(res == 1){
				document.querySelector('#imgF').innerHTML = '사진을 삭제했습니다.';				
			}else if(res == -1){
				alert('사진이 이미 존재하지 않습니다.');
			}else{
				alert('알 수 없는 이유로 삭제가 실패했습니다.');
			}
		}
		
	}
	
	//nav scroll
	(function($) {
		  "use strict";

		  var navbarCollapse = function() {
		    if ($("#mainNav").offset().top > 100) {
		      $("#mainNav").addClass("navbar-shrink");
		    } else {
		      $("#mainNav").removeClass("navbar-shrink");
		    }
		  };
		  navbarCollapse();
		  $(window).scroll(navbarCollapse);

		})(jQuery); 
	
	
</script>

</body>
</html>