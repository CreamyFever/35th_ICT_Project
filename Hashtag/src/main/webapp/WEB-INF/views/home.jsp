<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
/* 	var articleNum = new Array();
	function db_arr(dataArticle){	
		for(var i in dataArticle){
			articleNum.push(dataArticle[i].articlenum);
			var param = {
				request : 'post',
				key : '1579535757540490499',
				text : dataArticle[i].articlecontent.substring(0,850)
			};
			$.ajax({
				type: 'post',
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
				url: 'http://api.datamixi.com/datamixiApi/keywordextract?'+$.param(param, true),
				headers: {
					Accept: 'application/json; charset=UTF-8'
				},
				success: function(data, textStatus, jqXHR) {
					var shift = articleNum.shift();
					insertKeyword(data, shift);
				}
			});
		}
	}
 	function insertKeyword(keyword, num){
		for(var i in keyword.return_object){	
			if(i<10){
				$.ajax({
		    		url: "insertKeyword",
		    		type: "post",
		    		data: {
		    			"id" : num, 
		    			"keyword" : keyword.return_object[i].term.split('|')[0]
					}
		    	});
			}
		}
	} 
	$(function() {    	    	
		$.ajax({
			url : "articleList",
			type: "post",
			success: db_arr
		});  	
	}); 		//////////////키워드 추출 시에 사용할 함수!! */
	
	function clicksearch(){
    	var s = $('#search').val();
    	if(s != ''){
    		$.ajax({
    			url: "searchKeywordNum",
    			type: "post",
    			data: {"keyword" : s},
    			success: function(data){
    				console.log('success');
    				console.log(data);
    				$('#searchResult').html();
    				for(var i in data){
    					hashtag(data[i]);
    				}
    			}
    		});
    	}    	
    }
    function searchKeyword(articlenum){
    	$.ajax({
    		url: "searchKeyword",
    		type: "post",
    		data: {"articlenum" : articlenum},
    		success: function(data){
    			console.log('success hashtag');
    			var tag;
    			for(var i in data){
    				tag += "#"+data[i]+" ";
    			}
    			$('#searchResult').append("<p>"+ tag +"</p>");
    		}
    	});
    }
    function hashtag(articlenum){
    	$.ajax({
    		url: "selectKeyword",
    		type: "post",
    		data: {"articlenum" : articlenum},
    		success: function(data){
    			console.log('success hashtag');
    			var tag='';
    	    	$('#searchResult').append("<p> 기사 번호 : " + articlenum + "</p>");
    			for(var i in data){
    				tag += "#"+data[i]+" ";
    			}
    			$('#searchResult').append("<p>"+ tag +"</p>");
    		}
    	});
    }
</script>
</head>
<body>
	<input type="text" name="search" id="search">
	<input type="button" id="searchBtn" onclick="clicksearch()" value="search"><br/>
	result<br/>
	<div id="searchResult"></div>
</body>
</html>