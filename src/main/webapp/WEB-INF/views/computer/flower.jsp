<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/script.jsp"/>
</head>
<!--  <style>
.w-100{
	margin-left: 0%;
	margin-right: 10%;
	margin-bottom: 10%;
}
</style> -->
<body>
<jsp:include page="/WEB-INF/views/nav/topnav.jsp"/>

<form id="form1">
<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100"  src="https://blogfiles.pstatic.net/MjAxODEwMTJfMjQ2/MDAxNTM5MzMxODI5MzEx.AxUU82G_O1S7MUfuHFF6T6juep9jyu_HqWTciK3Q4aMg.zX87JFXufWX-CUfAlnVUpY-q3mi1THKfADfdwpSHs5Ug.JPEG.hartshorn/000010.JPG"  alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://blogfiles.pstatic.net/MjAxODEwMTJfMjM0/MDAxNTM5MzMxODI5NDgz.J8EYnOduTxIfYyUHIJGV1OfYNly2YmM2H23MXqMkjpQg.65iG8fFIZYzHQi4RlO88muSlEHZGir4kxxIh7Pcxb-cg.JPEG.hartshorn/000031.JPG"  alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="https://blogfiles.pstatic.net/MjAxODEwMTJfMjU4/MDAxNTM5MzMxODI5Mzk4.TbPba-Q6JYKMmr0HamNa_ZIdBgxo1ZZwfISlV-ILAigg.UyhypnOsVYEMuei1XD8nsrz6-p2-pCcCKX5mwhQJiEMg.JPEG.hartshorn/000019.JPG"   alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</form>

<form id="form2"  onsubmit="return false;">
<div class="form row">
<div class="col-3">
<select  id="op"  class="custom-select mr-sm-2"  required>
<option selected>선택</option>
	<option value="ciname">들꽃</option>
	<option value="cicpu">수국화</option>
	<option value="cipower">작약</option>
	<option value="cimb">라벤더</option>
	<option value="ciram">물망초</option>
	<option value="civga">해바라기</option>
	<option value="cihdd">안개꽃</option>
	<option value="cissd">스타치스</option>
	<option value="ciodd">백일홍</option>
	<option value="cicase">기타</option>
</select>
<div class="invalid-feedback">항목을 선택해야합니다.</div>
</div>
<div class="col-2">
<input type="text"  class="form-control"  id="sch" placeholder="검색어 입력" onkeypress="if(event.keyCode==13){search();}" required>
<div class="invalid-feedback">최소 2자이상 입력가능</div>
</div>
<button type="button" onclick="search()" class="btn btn-outline-primary">검색</button>
</div><br>
</form>
<!-- 	<div class="form row">
	<table  class="table table-hover">	
	
		<thead id="tHead" >
		
		</thead>

		
		<tbody id="tBody" style="cursor:pointer">
		
		</tbody>
		
	</table>
</div> 
</form> -->
 <!-- Project One -->
 <form id="form3">
      <div class="row">
      <h3 class="heading-large">trip note</h3>
        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="https://blogfiles.pstatic.net/MjAxODEwMTNfMTk0/MDAxNTM5NDM2MDY1MDA5.sZ0d6-jpSg9XXUy-yG8P6uAOfxAyZ5k7ZOnZmXQiAlAg.RvX9JxQexgHBA9D3GBBseSKnt3CIkqqnhrViOLhYy20g.JPEG.hartshorn/000013.JPG" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>미나토가와 스테이트 사이드 타운</h3>
          <p>개성 넘치는 60여 개의 상점이 있는 마을
1950년대 미군이 거주하던 마을을 새롭게 리뉴얼한 상점가이다. 골목마다 미국의 주 이름을 붙이고 건물마다 번호를 매긴 독창적인 아이디어가 돋보이는 곳으로, 옷가게와 레스토랑, 카페 등 다양한 상점들이 들어서 있다.</p>
           <div class="dropdown">
  <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    보기
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="https://www.instagram.com/p/BoTVHRpD_pw/?taken-by=seunng">자세하게</a>
    <a class="dropdown-item" href="#">수정하기</a>
    <a class="dropdown-item" href="#">공유하기</a>
  </div>
</div>
        </div>
      </div>
      <!-- /.row -->

      <hr>

      <!-- Project Two -->
      <div class="row">
        <div class="col-md-3">
          <a href="#">
            <img class="img-fluid rounded mb-3 mb-md-0" src="https://blogfiles.pstatic.net/MjAxODEwMTRfMjM1/MDAxNTM5NDQ1MjgwNjMw.RhcVXFUJTOVGlhacct3f09VYePHDN3YuGjvdHGbsV74g.dVYeW_e0dWO9o0WVMWNBKXcGU07bQEXb-33apLpA6sog.JPEG.hartshorn/000028.JPG" alt="">
          </a>
        </div>
        <div class="col-md-5">
          <h3>치넨미사키공원</h3>
          <p>오키나와 본섬 남부 고지대에 위치하며 태평양이 눈앞에 펼쳐지는 풍경을 보며 휴식을 취할 수 있는 공원입니다</p>
       <div class="dropdown">
  <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    보기
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="https://www.instagram.com/p/BoTVHRpD_pw/?taken-by=seunng">자세하게</a>
    <a class="dropdown-item" href="#">수정하기</a>
    <a class="dropdown-item" href="#">공유하기</a>
  </div>
</div>
        </div>
      </div>
      <!-- /.row -->
<br>
</form>

<form id= "form4">
<div class="row">
 <h3 class="heading-large">Instargram</h3>
  <div class="col-sm-2" style="width: 20rem;">
    <div class="card text-center">
     <img class="card-img-top" src="https://scontent-dfw5-1.cdninstagram.com/vp/f4548ca57738486416be94dbcb70329b/5C4AF767/t51.2885-15/e35/41418472_255230021803584_3011016153068722057_n.jpg" alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title">꽃</h5>
        <p class="card-text">#꽃 #필름</p>
        <div class="dropdown">
  <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    보기
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="https://www.instagram.com/p/BoTVHRpD_pw/?taken-by=seunng">자세하게</a>
    <a class="dropdown-item" href="#">수정하기</a>
    <a class="dropdown-item" href="#">삭제하기</a>
  </div>
</div>
      </div>
    </div>
  </div>
  <div class="col-sm-2" style="width: 20rem;">
    <div class="card text-center">
     <img class="card-img-top" src="https://scontent-dfw5-1.cdninstagram.com/vp/13e3135c76d9e71cebb4ec560a1a500a/5C3DCAEF/t51.2885-15/e35/42650134_341806123237712_3846314085256680031_n.jpg" alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title">꽃</h5>
        <p class="card-text">#꽃 #필름</p>
        <a href="https://www.instagram.com/p/BoTVHRpD_pw/?taken-by=seunng" class="btn btn-outline-primary">자세하게</a>
      </div>
    </div>
  </div>
  <div class="col-sm-2" style="width: 20rem;">
    <div class="card text-center">
     <img class="card-img-top" src="https://scontent-dfw5-1.cdninstagram.com/vp/54091b5a7bdfa54672803556a4b72ba4/5C60BEAD/t51.2885-15/e35/41464604_444544509284028_4444201533330995315_n.jpg" alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title">꽃</h5>
        <p class="card-text">#꽃 #필름</p>
        <a href="https://www.instagram.com/p/BoTU1ftD7Em/?taken-by=seunng" class="btn btn-outline-primary">자세하게</a>
      </div>
    </div>
  </div>
 <div class="col-sm-2" style="width: 20rem;">
    <div class="card text-center">
     <img class="card-img-top" src="https://scontent-dfw5-1.cdninstagram.com/vp/4817f46c80c5483f9deb42c207363161/5C60CFB9/t51.2885-15/e35/42532644_682847672099344_556228909052145899_n.jpg" alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title">꽃</h5>
        <p class="card-text">#꽃 #필름</p>
        <a href="https://www.instagram.com/p/BoTRQPDD1e9/?taken-by=seunng" class="btn btn-outline-primary">자세하게</a>
      </div>
    </div>
  </div>
  <div class="col-sm-2" style="width: 20rem;">
    <div class="card text-center">
     <img class="card-img-top" src="https://scontent-dfw5-1.cdninstagram.com/vp/9c41d1fbcba577b5fe5d2587d5352eb0/5C609FB3/t51.2885-15/e35/41478436_299060537559941_7947367350842372565_n.jpg" alt="Card image cap">
      <div class="card-body">
        <h5 class="card-title">꽃</h5>
        <p class="card-text">#꽃 #필름</p>
        <a href="https://www.instagram.com/p/BoTRBGiDXTd/?taken-by=seunng" class="btn btn-outline-primary">자세하게</a>
      </div>
    </div>
  </div>
   <div class="col-sm-2" style="width: 20rem">
    <div class="card text-center">
      <div class="card-header">
    추가하기
      </div>
      <div class="card-body">
        <h5 class="card-title">앨범 만들기</h5><br>
        <p class="card-text">사진을 등록해서 나만의 앨범을 만들어보세요</p><br>
         <a href="#"  class="btn btn-outline-primary">등록하기</a>
         <a href="#"  class="btn btn-outline-primary">도움말</a>
      </div>
  <div class="card-footer text-muted">
    #해시태그
    </div>
  </div>
  </div>
    </div>
  </form>

  <jsp:include page="/WEB-INF/views/common/footer.jsp"/>


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