var formDataToJson = function(formData){
	var paramObj = {};
	formData.forEach((e,k) =>{
		paramObj[k] = e;
	});
	return JSON.stringify(paramObj);
}

var getMetaData = function(e){
	var head = '<tr>';
	head+='<th><input type="checkbox" onclick="allChk(this)" style="cursor:pointer"></th>';
	for(var k in e){
		head += '<th>' + k + '</th>';
	}
	
	head += '</tr>';
	
	return head;
}

var getInfoList = function(list){
	var body = '';
	
	list.forEach((e) => {
		body += '<tr>';
		body += '<td><input type="checkbox" name="chk" value="' + e["cino"] + '" style="cursor:pointer"></td>';
		
		for(var k in e){
			body += '<td onclick="ciView(' + e["cino"] + ')">' + e[k] + '</td>';
		}
		
		body += '</tr>';
		
	});
	return body; 
}

var getView = function(list){
	var html = '<table id="viewtable" class="table table-hover">';
	
	for(var k in list[0]){
		html += '<tr>';
		html += '<th>' + k + '</th><td>' + list[0][k] + '</td>';
		html += '</tr>';
	}
	
	html += '<tr><td colspan="2"><button class="btn btn-outline-primary" onclick="modify(' + list[0]["cino"] + ')" type="button">수정</button></td></tr>';
	html += '</table>';
	
	return html;
}

var getModify = function(list){
	var html = '<table id="viewtable" class="table table-hover">';
	
	for(var k in list[0]){
		html += '<tr>';
		if(k.indexOf('cino') != -1){
			html += '<th>' + k + '</th><td>' + list[0][k] + '<input type="hidden" name="' + k + '" value="' + list[0][k] + '"></td>';			
		}else{
			html += '<th>' + k + '</th><td><input type="text" name="' + k + '" value="' + list[0][k] + '"></td>';
		}
		html += '</tr>';
	}
	html += '<tr><td colspan="2"><button class="btn btn-outline-primary" onclick="updateInfo()" type="button">수정완료</button></td></tr>';
	html += '</table>';
	
	return html;
};
 
function checkValues(values){
	for(var e of values){
		if(!e.value.trim()){
			alert(e.getAttribute('name').substring(2) + '을 입력해주세요. 모르면 "모름" 이라적으세요.')
			e.value='';
			e.focus();
			return false;
		}
	}
	return true;	
}







