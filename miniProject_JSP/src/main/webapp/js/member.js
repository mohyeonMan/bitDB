function change(){
	document.writeForm.email2.value = document.writeForm.email3.value;
}
function checkWrite(){
	document.getElementById("nameDiv").innerText = "";
	document.getElementById("idDiv").innerText = "";
	document.getElementById("pwdDiv").innerText="";
	
	if(document.getElementById("name").value == "")
		document.getElementById("nameDiv").innerText="이름을 입력하세요";
	
	else if(document.getElementById("id").value == "")
		document.getElementById("idDiv").innerText="아이디를 입력하세요";
	
	else if(document.getElementById("pwd").value == "")
		document.getElementById("pwdDiv").innerText="비밀번호를 입력하세요";
	
	else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
		document.getElementById("pwdDiv").innerText="비밀번호가 맞지 않습니다.";
	else if(document.writeForm.id.value!=document.writeForm.idDup.value)
		alert("중복체크 해주세요");
	else
		document.writeForm.submit();
}

function checkId(){
	var sId =document.getElementById("id").value;
	//const 상수 자료형
	if(sId==""){
		document.getElementById("idDiv").innerHTML="<font color='magenta'>중복확인 할 아이디가 없습니다.</font>";
	}else{		//		연결되는링크,	팝업창 이름,	크기와 위치		//팝업창 띄우기 똑같은 이름의 창은 두번이상 열리지 않는다.
		window.open("checkId.jsp?id="+sId,"checkId","width=300 height=150 left=400 top=150, resizable =no,scrollbar=no");
	}				//?사용해서 id값 get방식으로 데이터 보내기
}
