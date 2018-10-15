var formDataToJson = function(formData){
	var paramObj = {};
	formData.forEach((e,k) =>{
		paramObj[k] = e;
	});
	return JSON.stringify(paramObj);
}


var getView = function(list){
	var html = '<h3 class="heading-large">상세보기</h3>';

	 html += '<table id="viewtable" class="table table-hover">';
	
	for(var k in list[0]){
		html += '<tr>';
		if(k == 'ciimg'){
			if(list[0]['ciimg'] == null){
				html += '<th>' + k + '</th><td><img class="non_img" src="/rsc/img/no img.png"></td>';								
			}else{
				html += '<th>' + k + '</th><td><img class="view_img" src="' + list[0][k] + '" onclick="viewImg(\'' + list[0]['ciimg'] +'\',\'' + list[0]['cino'] + '\')"></td>';				
			}
		}else{			
			html += '<th>' + k + '</th><td>' + list[0][k] + '</td>';
		}
		html += '</tr>';
	}
	
	html += '<tr>';
	html += '<td><button type="button" class="btn btn-outline-primary" onclick="modify(' + list[0]["cino"] + ')">수정</button></td>';
	html += '<td><a class="btn btn-outline-primary" href="/uri/computer:list2">뒤로</a></td>';
	html += '</tr>';
	html += '</table>';
	html +='</div>';
	
	return html;
}

var getModify = function(list){
	var html = '<h3 class="heading-large">수정하기</h3>';

	 html += '<table id="viewtable" class="table table-hover">';
	
	for(var k in list[0]){
		html += '<tr>';
		if(k === 'cino'){
			html += '<th>' + k + '</th><td>' + list[0][k] + '<input type="hidden" name="' + k + '" value="' + list[0][k] + '"></td>';			
		}else if(k.indexOf('img') != -1){
			html += '<th>' + k + '</th><td id="imgF"><input type="file" name="' + k + '" value="' + list[0][k] + '" id="i"><img class="modify_img" src="' + list[0][k] + '"><button type="button" class="btn btn-outline-primary del_img" onclick="delImg(' + list[0]["cino"] + ')">사진 지우기</button></td>';
		}else{
			html += '<th>' + k + '</th><td><input type="text" name="' + k + '" value="' + list[0][k] + '" id="i"></td>';
		}
		html += '</tr>';
	}
	html += '<tr>';
	html += '<td><button type="button" class="btn btn-outline-primary" onclick="updateInfo()">수정완료</button></td>';
	html += '<td><button type="button" class="btn btn-outline-primary" onclick="ciView(' + list[0]["cino"] + ')">취소</button></td>';
	html += '</tr>';
	html += '</table>';
	html += '</div>';
	
	return html;
};
 
function checkValues(values){
	for(var e of values){
		if(!e.value.trim() && e.getAttribute('name').indexOf('img') ==-1){
			alert(e.getAttribute('name').substring(2) + '을 등록해주세요.')
			e.value='';
			e.focus();
			return false;
		} else if(e.getAttribute('name').indexOf('img') != -1){
			var file = e.value.toLowerCase().substring(e.value.lastIndexOf('.')+1);
			if(file){
				if(file != 'jpg' && file != 'png'){
					alert('사진파일의 확장자는 jpg와 png만 가능합니다.')
					return false;
				}
			}
		}
	}
	return true;
}


var getInfoListNewt = function(list){
	var html = '<h3 class="heading-large">갤러리</h3>';
	
	list.forEach((e) => {		
		html += '<div class="col-sm-2" style="width: 20rem;">';
		html += '<div class="card text-center">';
		
		if(e['ciimg'] == null){
			html += '<img class="card-img-top item_img" onclick="ciView('+ e["cino"] +')" src="/rsc/img/no img.png" alt="Card image cap">';
		}else{
			html += '<img class="card-img-top item_img" onclick="ciView('+ e["cino"] +')" src="' + e["ciimg"] +'" alt="Card image cap">';				
		}
		
		html += '<div class="card-body">';
		html += '<h5 class="card-title">' + e["ciname"] + '</h5>';
		
		for(var k in e){  
			if(k.indexOf('cipower')!=-1 ||k.indexOf('cicpu')!=-1 ||k.indexOf('cimb')!=-1 ||k.indexOf('ciram')!=-1 ||k.indexOf('civga')!=-1){
				html += '<p class="card-text item_detail" onclick="search(\''+ k + '\',\'' + e[k] +  '\')">' + e[k] + '</p>';
				
			}
		}		
		
		html += '<div class="dropdown">';
		
		html += '<button type="button" class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">보기</button>';
		html += '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">';
		html += '<button type="button" class="dropdown-item" onclick="ciView('+ e["cino"] +')">자세하게</button>';
		html += '<button type="button" class="dropdown-item" onclick="modify('+ e["cino"] +')">수정하기</button>';
		html += '<button type="button" class="dropdown-item" onclick="deleteInfo()">삭제하기</button><input type="checkbox" class="dropdown-item del" name="chk" value="' + e["cino"] + '">';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		
	});
	
	return html;
}

var recentInfo = function(list){
	var html = '';
	var i = 0;
	
	list.forEach((e => {
		html += '<div class="row">';
		if(i == 0){
			html += '<h3 class="heading-large">최근 컴퓨터</h3>';
			i++;
		}
		html += '<div class="col-md-3">';
		html += '<a href="#">';
		
		if(e['ciimg'] == null){
			html += '<img class="img-fluid rounded mb-3 mb-md-0" onclick="ciView('+ e["cino"] +')" src="/rsc/img/no img.png" alt="Card image cap">';
		}else{
			html += '<img class="img-fluid rounded mb-3 mb-md-0" onclick="ciView('+ e["cino"] +')" src="' + e["ciimg"] +'" alt="Card image cap">';				
		}
		
		html += '</a>';
		html += '</div>';
		html += '<div class="col-md-5">';
		html += '<h3>' + e["ciname"] + '</h3>';
		for(var k in e){  
			if(k.indexOf('cino')==-1 && k.indexOf('ciimg')==-1){
				html += '<a href="javascript:search(\''+ k + '\',\'' + e[k] +  '\')">' + e[k] + '</a>/';
				
			}
		}	
		html += '<div class="dropdown">';
		html += '<button type="button" class="btn btn-outline-primary dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">보기</button>';
		html += '<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">';
		html += '<button type="button" class="dropdown-item" onclick="ciView('+ e["cino"] +')">자세하게</button>';
		html += '<button type="button" class="dropdown-item" onclick="modify('+ e["cino"] +')">수정하기</button>';
		html += '<button type="button" class="dropdown-item" onclick="deleteInfo()">삭제하기</button><input type="checkbox" class="dropdown-item del" name="chk" value="' + e["cino"] + '">';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '</div>';
		html += '<hr>';
	}));
	
	return html;
}

