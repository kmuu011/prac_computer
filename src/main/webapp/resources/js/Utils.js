var formDataToJson = function(formData){
	
var params = '{' ;
	
	formData.forEach((e,k) =>{
		params += '"' + k +'":"' + e + '",'; 
	})
	params = params.substring(0,params.lastIndexOf(','));
	params += '}';
	
	return params;
}