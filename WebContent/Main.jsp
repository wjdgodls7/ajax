<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
<style>
a{
text-decoration: none;
}
li{
font-size: 30px;
}

</style>
</head>
<body>
<h1><a href="#">Ajax Practice</a></h1>
	<nav>
		<ol id="list">
			
		</ol>
	</nav>
	
	<div id="here">
	</div>
	<div id="end">
	감사합니다!
	</div>

</body>
<script>
function result(language){
	let lang = language
	
	fetch(lang).then(function(result){
	
	result.text().then(function(main){
	
		document.querySelector('#here').innerHTML=main;
	})
})
}
if (location.hash) {
	result(location.hash.substr(2));
}else{
	result('index.jsp');
}

/* <a href="#!Java.jsp" onclick="result('Java.jsp')"><li> JAVA </li></a> */
fetch('list.jsp').then(function(result){
	
	result.text().then(function(main){
		let tag = main.split(',');
		let listArr = "";
		
		for(let i in tag){
			listArr += '<a href=\"#!'+tag[i]+'.jsp\" onclick=\"result(\''+tag[i]+'.jsp\')"><li> '+tag[i]+'.jsp </li></a>'
		}
		document.querySelector('#list').innerHTML = listArr;
	})
})

</script>
</html>