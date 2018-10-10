
var AjaxUtil = function(conf){
	var url = conf.url;
	var method = conf.method?conf.method:'GET';
	var params = conf.params?conf.params:'';
	
	
	var comFail = function(res){
		alert(res);
	}
	
	var comSuccess = function(res){
		alert(res);
	}
	
	var fail = conf.fail?conf.fail:comFail;
	var success = conf.success?conf.success:comSuccess;

	var xhr = new XMLHttpRequest();
	
	xhr.fail = fail;
	xhr.success = success;
	
	xhr.onreadystatechange = function(){
		if(xhr.readyState == xhr.DONE){
			if(xhr.status == 200){
				this.success(xhr.response);
			}else{
				this.fail(xhr.response);
			}
		}
	}
	
	this.send = function(){
		xhr.open(method,url);
		
		if(method != 'GET'){
			xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
		}
		
		xhr.send(params);		
	}
	
	
}