<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DETAIL</title>
	<style type="text/css">
		span.searchKeyword{
			font-size: 2.2em;
		    font-weight: 900;
		    color: #506369;
		    text-align: left;
		    margin: 0.8em 0 0.8em;
		}
		a.tagword{
			color: #00d8ff;
		}
	</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		 
	 <!---- start-smoth-scrolling---->
	<script type="text/javascript" src="resources/js/move-top.js"></script>
	<script type="text/javascript" src="resources/js/easing.js"></script>
	
	<!---- start-smoth-scrolling---->
	 <!-- Custom Theme files -->
	<link href="resources/css/theme-style.css?ver=1" rel='stylesheet' type='text/css' />
  		 <!-- Custom Theme files -->
	<meta name="viewport" content="width=device-width, initial-scale=1">	
	
	<script type="application/x-javascript">
			addEventListener("load", function() { 
				setTimeout(hideURLbar, 0);

				$("#articles_list").hide();
			}, false);
			
			function hideURLbar(){
				window.scrollTo(0,1);
			}
		</script>
	
	
	<script>
	$(function(){
		var keyword = $("#keyword").val();
		var continent = $("#continent").val();
		
		showArticleByKeyword(keyword, continent);
	});
	
	
	function showArticleByKeyword(keyword, continent){
		$("#keyword_ref").attr("href", "listArticle?keyword="+ keyword +"&continent=" + continent);
		
		$.ajax({
			url: "showArticleByKeyword",
			method: "POST",
			data:{
				"keyword":keyword,
				"continent":continent
			},
			success: output,
			error: function(){
				alert("error");
			}
		});
	}
	
	function output(resp){		
		if(window.location.href.includes("listArticle")){	// 주소입력 창에 continent 정보가 들어있으면 기사 목록을 보이게 함.
			$("#articles_list").show(1000, function(){
				$('html,body').animate({scrollTop:$("#articles_list").offset().top},1000);
			});
		}
		
		if(resp.length >= 1){
			var s = "";
			resp_date = convertDateForm(resp[0].articledate);
			s += '<div class="col-md-4 articles-grid-row frist-row">';	
			// s += '<a class="post-pic" href="#"><img src="resources/images/post-pic.jpg" title="pic-name" /></a>';
			s += '<div class="artical-info">';
			s += '	<div class="post-head">';
			s += '		<div class="post-head-left">';
			s += '			<h4><a href=read?articleid=' + resp[0].articleid + '&articlenum=' + resp[0].articlenum +'>' +resp[0].articlename + '</a></h4>';
			s += '			<p class="author">By <a href="#"> '+ resp[0].presscompany +'</a></p>';
			s += '		</div>';
			s += '		<div class="post-head-right">';
			s += '			<span>'+ resp_date[0] +'</span><label>'+ resp_date[1] +' '+ resp_date[2] +'</label>';
			s += '		</div>';
			s += '		<div class="clearfix"> </div>';
			s += '	</div>';
			s += '	<p class="post-text">'+ resp[0].articlecontent.substring(0,400) +'...</p>';
			s += '	<div class="post-bottom">';
			s += '		<div class="post-bottom-left">';
			s += '			<p><a href="#">0 Comments</a> | <i class="fa fa-heart"> </i> 0</p>';
			s += '		</div>';
			s += '		<div class="post-bottom-right">';
			s += '			<a class="artbtn" href=read?articleid=' + resp[0].articleid + '&articlenum=' + resp[0].articlenum +'>Read More</a>';
			s += '		</div>';
			s += '		<div class="clearfix"> </div>';
			s += '	</div>';
			s += '</div>';
			s += '</div>';
			
			
			s += '<div class="col-md-4 artical-row2">';
			
			if(resp.length > 5)
				topNewsLen = 5;
			else
				topNewsLen = resp.length;

			for(var index = 1; index < topNewsLen; index++){				
				resp_date = convertDateForm(resp[index].articledate);
				s += '<div class="artical-info">';
				s += '<div class="post-head post-head1">';
				s += '	<div class="post-head-left">';
				s += '		<h4><a href=articleid=' + resp[index].articleid + '&articlenum=' + resp[index].articlenum +'>' +resp[index].articlename + '</a></h4>';
				s += '		<p class="author">By <a href="#">' +resp[index].presscompany + '</a></p>';
				s += '	</div>';
				s += '	<div class="post-head-right post-head-right-C">';
				s += '		<span>'+ resp_date[0] +'</span><label>'+ resp_date[1] +' '+ resp_date[2] +'</label>';
				s += '	</div>';
				s += '	<div class="clearfix"> </div>';
				s += '</div>';
				s += '<p class="post-text">' +resp[index].articlecontent.substring(0,300) + '...</p>';
				s += '<div class="post-bottom">';
				s += '	<div class="post-bottom-left">';
				s += '		<p><a href="#">0 Comments</a> | <i class="fa fa-heart"> </i> 0</p>';
				s += '	</div>';
				s += '	<div class="post-bottom-right">';
				s += '		<a class="artbtn artbtn1" href=read?articleid=' + resp[index].articleid + '&articlenum=' + resp[index].articlenum +'>Read More</a>';
				s += '	</div>';
				s += '	<div class="clearfix"> </div>';
				s += '</div>';
				s += '</div>';
			}
			
			s += '</div>';
			
			
			$(".articles-grids").html(s);
			$('html,body').animate({scrollTop:$("#articles").offset().top},1000);
		}
	}
	
	function convertDateForm(inputDate){
		year = inputDate.substring(0,4);
		month = inputDate.substring(4,6);
		day = inputDate.substring(6,8);
		
		month_res = '';
		if(month == '01'){
			month_res += 'Jan';
		} else if(month == '02'){
			month_res += 'Feb';
		} else if(month == '03'){
			month_res += 'Mar';
		} else if(month == '04'){
			month_res += 'Apr';
		} else if(month == '05'){
			month_res += 'May';
		} else if(month == '06'){
			month_res += 'Jun';
		} else if(month == '07'){
			month_res += 'Jul';
		} else if(month == '08'){
			month_res += 'Aug';
		} else if(month == '09'){
			month_res += 'Sep';
		} else if(month == '10'){
			month_res += 'Oct';
		} else if(month == '11'){
			month_res += 'Nov';
		} else if(month == '12'){
			month_res += 'Dec';
		}
		
		result = [day, month_res, year];
		
		return result;
	}
	
	
	
	function pagingFormSubmit(currentPage) {
		var form = document.getElementById('pagingForm');
		var keyword = document.getElementById('keyword_value');
		var continent = document.getElementById('continent_value');
		var page = document.getElementById('page');
		
		var url = window.location.href;
		var formVal = url.split('?');
		var parameters = formVal[1].split('&');
		var keyword_val = (parameters[0].split('='))[1];
		var continent_val = (parameters[1].split('='))[1];
		
		keyword.value = keyword_val;
		continent.value = continent_val;
		page.value = currentPage;
		
		form.submit();
	}
	
	
	</script>
	

<script type="text/javascript">

	$(function(){
    	var s = $('#keyword').val();
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
    });
    function searchKeyword(articlenum){
    	$.ajax({
    		url: "searchKeyword",
    		type: "post",
    		data: {"articlenum" : articlenum},
    		success: function(data){
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
    			var tag='';
    			
    			for(var i in data){
    				$('#searchResult').append("<p> Article Title : " + i + "</p>");
    				
    				for(var j in data[i]){
   	    				var search = data[i][j];
   	    				tag += "<a class='tagword' href=\"javascript:submitSearchForm(\'"+search+"\')\">#"+data[i][j]+"</a> ";
    				}    				
    			}    			
    			$('#searchResult').append("<p>"+ tag +"</p>");
    			
    			
    	    	/* $('#searchResult').append("<p> Article Title : " + articlenum + "</p>");
    			for(var i in data){
    				var search = data[i];
    				tag += "<a class='tagword' href=\"javascript:submitSearchForm(\'"+search+"\')\">#"+data[i]+"</a> ";
    			}
    			
    			$('#searchResult').append("<p>"+ tag +"</p>"); */
    		}
    	});
    }
    
    function submitSearchForm(tag){
		var form = window.opener.document.getElementById("searchForm");
		window.close();
		form.elements["search"].value = tag;
		form.submit();
    }
</script>

	</head> 
	<body>
	<input type="hidden" id="keyword" value="${keyword}">
	<input type="hidden" id="continent" value="${continent}">
	<input type="hidden" id="sentiment" value="${sentiment}">
	
	
	<div id="detail_head" class="articles">
			<div class="container">
				<span class="searchKeyword">Searched for "${keyword}" in ${continent}</span>
			</div>
		</div>
	
	<hr color="skyblue" size="5px">
		<div id="hash_tags" class="articles">
			<div class="container">
				<h3>Hash Tags<label> </label></h3>
				<div id="searchResult"></div>
			</div>
		</div>
	
	<hr color="skyblue" size="5px">
		<!----start-articles---->
		<div id="articles" class="articles">
			<div class="container">
				<h3>Articles<label> </label></h3>
				<div class="articles-grids"></div>
				
				<div class="post-bottom-right">
					<a id="keyword_ref" href="listArticle?keyword=${keyword}&continent=${continent}">
						<img src="resources/images/more-icon.png" title="more-icon" />
					</a>
				</div>
			</div>
		</div>
		<!----//End-articles---->
		
		<hr color="skyblue" size="5px"><br>
		
		<!----start-articles_list---->
		<div id="articles_list" class="articles">
			<div class="container">
				<h3>Articles List<label> </label></h3>
				<div class="articles-list-grids">
					<br>
					<table>
						<tr>
							<td class="white">
								Total : ${navi.totalRecordsCount}
							</td>
							<td class="white" colspan="3"></td>	
						</tr>
						<tr>
							<th>No.</th>
							<th style="width:600px">Title</th>
							<th>Date</th>
						</tr>
						<c:forEach var="article" items="${articles}">
						<tr>
							<td class="center">${article.articlenum}</td>
							<td>
								<a href="read?articleid=${article.articleid}&articlenum=${article.articlenum}" class="article_title">${article.articlename}</a>
							</td>
							<td class="center">${article.articledate}</td>
						</tr>
						</c:forEach>
					
						</table>
						<br/><br/>
						
						<div id="navigator">
					                     
							<a class="page_link" style="color: #000000;" href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
							<a class="page_link" style="color: #000000;" href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;
						
							<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
								<c:if test="${counter == navi.currentPage}"><b></c:if>
									<a class="page_link" style="color: #000000;" href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
								<c:if test="${counter == navi.currentPage}"></b></c:if>
							</c:forEach>
							&nbsp;&nbsp;
							<a class="page_link" style="color: #000000;" href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
							<a class="page_link" style="color: #000000;" href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>
					
						<br><br>
						
						<form id="pagingForm" method="get" action="listArticle">
							<input type="hidden" name="keyword" id="keyword_value" />
							<input type="hidden" name="continent" id="continent_value" />
							<input type="hidden" name="page" id="page" />
						</form>
					</div>
				</div>
			</div>			
		</div>
		<!----//End-articles_list---->
	
	
	<hr color="skyblue" size="5px"><br>
	
<!-- 	<div id="whisker" style="width:100%">
		<div id="boxAndWhisker" style="height: 300px; width: 100%;"></div>
	</div>
	 -->

<script src="./resources/worldmap/js/Chart.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script src="./resources/worldmap/js/canvasjs.min.js"></script>
<script src="./resources/worldmap/js/jquery.canvasjs.min.js"></script>
<!-- pieOptions와 각 대륙별 데이터 뽑아오기 -->
</script>


</body>
</html>