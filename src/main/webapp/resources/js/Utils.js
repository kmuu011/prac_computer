var formDataToJson = function(formData){
	var paramObj = {};
	formData.forEach((e,k) =>{
		paramObj[k] = e;
	})
	return JSON.stringify(paramObj);
}

var getMetaData = function(e){
	var head = '<tr>';
	head+='<td><input type="checkbox" onclick="allChk(this)"></td>';
	for(var k in e){
		head += '<td>' + k + '</td>';
	}
	
	head += '</tr>';
	
	return head;
}

var getInfoList = function(list){
	var body = '';
	
	list.forEach((e) => {
		body += '<tr>';
		body += '<td><input type="checkbox" name="chk" value="' + e["cino"] + '"></td>';
		
		for(var k in e){
			body += '<td onclick="ciView(' + e["cino"] + ')">' + e[k] + '</td>';
		}
		
		body += '</tr>';
		
	});
	return body; 
}

var getView = function(list){
	var html = '<table border="1">';
	
	for(var k in list[0]){
		html += '<tr>';
		html += '<th>' + k + '</th><td>' + list[0][k] + '</td>';
		html += '</tr>';
	}
	
	html += '<tr><td><button onclick="modify(' + list[0]["cino"] + ')" type="button">수정</button></td></tr>';
	html += '</table>';
	
	return html;
}

var getModify = function(list){
	var html = '<table border="1">';
	
	for(var k in list[0]){
		html += '<tr>';
		if(k.indexOf('cino') != -1){
			html += '<th>' + k + '</th><td>' + list[0][k] + '<input type="hidden" name="' + k + '" value="' + list[0][k] + '"></td>';			
		}else{
			html += '<th>' + k + '</th><td><input type="text" name="' + k + '" value="' + list[0][k] + '"></td>';
		}
		html += '</tr>';
	}
	html += '<tr><td><button onclick="updateInfo()" type="button">수정완료</button></td></tr>';
	html += '</table>';
	
	return html;
};