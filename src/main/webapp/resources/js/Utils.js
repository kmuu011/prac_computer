var formDataToJson = function(formData){
	
var params = '{' ;
	
	formData.forEach((e,k) =>{
		params += '"' + k +'":"' + e + '",'; 
	})
	params = params.substring(0,params.lastIndexOf(','));
	params += '}';
	
	return params;
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
			body += '<td>' + e[k] + '</td>';
		}
		
		body += '</tr>';
		
	});
		
	return body; 
}