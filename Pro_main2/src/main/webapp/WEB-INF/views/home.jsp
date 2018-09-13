<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="./resources/css/style_for_main.css">
	<title>Home</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script> <!-- 이것도 넣어줘야 ajax 사용할 수 있음... -->
<script type="text/javascript">

function sendKeyword(){
	var searchWord = $("#search").val();
	$("#searchForm").submit();
}

function hangulAPI(){
	var hangul = $("#hangul").val();
	var data = 
		{
			 "text" : hangul
			}
	alert(hangul);
	$.ajax({
        url: "translate",
        type: "POST",
        data: JSON.stringify(data)
    })
    .done(function(data) {
    	alert(data);
        alert(JSON.stringify(data));
    })
    .fail(function() {
        alert("error");
    });
}

</script>
</head>
<body>

<!-- 드로어 메뉴 -->
<nav id="sidenav">
  <span id="close-sidenav">&times;</span>
  <header>회원 정보</header>
	<c:if test="${member==null}">
	<h1>NO</h1>
	</c:if>

	<div id='memberInfo'>
	<h1>유저 프로필</h1>
	<!-- 유저 사진 불러오기 -->
		<table style="color : white; ">
			<tr>
				<td>ID</td>
				<td>${member.id}</td>
			</tr>
			<tr>
				<td>NICKNAME</td>
				<td>${member.nickname}</td>
			</tr>
			<tr>
				<td>NATIONALITY</td>
				<td>${member.nationality}</td> <!-- nations 테이블 조인해서 국가 이름 불러오기 -->
			</tr>
		</table>
	</div>  
	<h1>북마크</h1>
	<div id="bookmarkList">
	<table>
		<tr>
			<c:forEach var="item" items="${bookmark}" begin="0" end="4">
				<td>${item.title}</td>
			</c:forEach>			
				<td>더보기</td>	
		</tr>
	</table>
	</div>
	</nav>

<div id="hamburger-wrapper">
  <span id="hamburger">&equiv;</span>
</div>



<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$("#hamburger").click(function() {
	$("#sidenav").css("right", "0");
  $("body").addClass("dark")
});
$("#close-sidenav").click(function() {
	$("#sidenav").css("right", "-200px");
  $("body").removeClass("dark");
});
</script>



<div>
<form id="searchForm" action="goToWorldMap">
<input type="text" id="search" name="search" style="width: 1000px">
<input type="button" id="searchBtn" onclick="sendKeyword()" value="검색">
</form>
</div>

<div id="full">
	<div id="left">
	<h1>키워드 자리</h1>
	<c:forEach var="key" items="${kList}">
		<h3>${key.keyword}</h3>
	</c:forEach>
	
	
	
	
	</div>

	<div id="right" style="position:absolute ; right:0;">
	
		<div id="right_up">
			<div class="table-users">
 		  <div class="header">Users</div>
			<table cellspacing="0">
				<tr>
					<td>title</td>
					<td>writer</td>
					<td>date</td>
					<td>hitcount</td>
				</tr>
				<c:forEach items="${bList}" var="item" begin="0" end="4">
				<tr>
					<td>${item.title}</td>
					<td>${item.writer}</td>
					<td>${item.regdate}</td>
					<td>${item.hitCountNumber}</td>
				</tr>
				</c:forEach>
			</table>
			</div>
		</div>
	</div>

		<div id="right_down">
			<h1>토론방 목록</h1>
			<table>
				<tr>
					<c:forEach items="${dList}" var="item" begin="0" end="4">
					<td>${item.dis_title}</td>
					</c:forEach>			
				</tr>
			</table>
		</div>
	</div>


<div id="keyword">
<form id="hangul">
<input type="text" id="hangul"><br>
<input type="button" id="han" onclick="hangulAPI()">
</form>
</div>

<div id="azure">
<form id="azure">

<textarea rows="20" cols="20" id="key"></textarea>
<input type="button" id="key" onclick="azureTest()" value="azure">
<textarea rows="20" cols="20" id="key2"></textarea>
<input type="button" id="key2" onclick="azureTest2()" value="azure2(번역+감정)">
<textarea rows="20" cols="20" id="key2"></textarea>
<input type="button" id="key3" onclick="azureTest3()" value="azure3(키워드뽑기)">
</form>
</div>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
<script type="text/javascript">

function azureTest(){
	alert($("#key").val());
	var data = {
        "documents": [
            {
              "language": "en",
              "id": "1",
              "text": $("#key").val()
            },
            {
              "id": "2",
              "text": "悲しい話はやめて"
            }
          ]
        };
	
        //https://japaneast.api.cognitive.microsoft.com/text/analytics/v2.0
        $.ajax({
            url: "https://japaneast.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment",
            beforeSend: function(xhrObj){
                // Request headers
                xhrObj.setRequestHeader("Content-Type","application/json");
                xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","a16ae793fb0e47e4bddd7328807a4950");
            },
            type: "POST",
            data: JSON.stringify(data)
        })
        .done(function(data) {
            alert(JSON.stringify(data));
            alert(data);
        })
        .fail(function() {
            alert("error");
        });
}        


function azureTest2(){
	alert($("#key2").val());
$.ajax({
    url: "translate",
    type: "POST",
    data: {"sendText" : $("#key2").val()}
})
.done(function(data) {
	alert(JSON.stringify(data));
	alert(data);
	
	var jData = JSON.parse(JSON.stringify(data));
	for(var i=0;i<jData.length;i++){
		var test = jData[i];
		console.log('******************************');
		console.log(test.text);
		console.log(test.to);
	}
    
    var sendData = {
    		
            "documents": [
                {
                  "language": "en",
                  "id": "1",
                  "text": JSON.stringify(data)
                },
                {
                  "id": "2",
                  "text": "悲しい話はやめて"
                }
              ]
            };
    	
            //https://japaneast.api.cognitive.microsoft.com/text/analytics/v2.0
            $.ajax({
                url: "https://japaneast.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment",
                beforeSend: function(xhrObj){
                    // Request headers
                    xhrObj.setRequestHeader("Content-Type","application/json");
                    xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","a16ae793fb0e47e4bddd7328807a4950");
                },
                type: "POST",
                data: JSON.stringify(sendData)
            })
            .done(function(result) {
                alert(JSON.stringify(result));
                
            })
            .fail(function() {
                alert("error");
            });
		})
		.fail(function() {
		    alert("error");
		});
}

var keywordData = {
		  "documents": [
			    {
			      "language": "en",
			      "id": "1",
			      "text": "Hello world. This is some input text that I love."
			    },
			   /*  {
			      "language": "ko",
			      "id": "2",
			      "text": $("#key3").val()
			    }, */
			    {
			      "language": "es",
			      "id": "2",
			      "text": "La carretera estaba atascada. Había mucho tráfico el día de ayer."
			    }
			  ]
			};


function azureTest3(){
    $(function() {
        $.ajax({
            url: "https://japaneast.api.cognitive.microsoft.com/text/analytics/v2.0/keyPhrases",
            beforeSend: function(xhrObj){
                // Request headers
                xhrObj.setRequestHeader("Content-Type","application/json");
                xhrObj.setRequestHeader("Ocp-Apim-Subscription-Key","a16ae793fb0e47e4bddd7328807a4950");
            },
            type: "POST",
            // Request body
            data: JSON.stringify(keywordData),
        })
        .done(function(data) {
            alert(JSON.stringify(data));
        })
        .fail(function() {
            alert("error");
        });
    });
}

</script>
<input type="button" value="그래프 연습 하는 것임" onclick="template.jsp">
<input type="button" value="되느냐.." onclick="total2()">

<script type="text/javascript">
function total(){
	$(function() {
        $.ajax({
            url: "total",
            type: "POST"
        })
        .done(function(data) {
            alert(data);
        })
        .fail(function() {
            alert("error");
        });
    });
}
function total2(){
	$(function() {
        $.ajax({
            url: "total2",
            type: "POST"
        })
        .done(function(data) {
            alert(data);
        })
        .fail(function() {
            alert("error");
        });
    });
}
</script>

</body>
</html>
