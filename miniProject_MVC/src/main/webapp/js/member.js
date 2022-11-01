
$('#writeBtn').click(function(){
	$('#nameDiv').empty();
	$('#idDiv').empty();
	$('#pwdDiv').empty();
	$('#repwdDiv').empty();
	
	if($('#name').val()==''){
		$('#nameDiv').text("이름을 입력하세요");
		$('#name').focus();
	}else if($('#id').val()==''){
		$('#idDiv').text("아이디을 입력하세요");
		$('#id').focus();
	}else if($('#pwd').val()==''){
		$('#pwdDiv').text("비밀번호를 입력하세요");
		$('#pwd').focus();
	}else if($('#repwd').val()==''){
		$('#repwdDiv').text("비밀번호 재확인을 입력하세요");
		$('#repwd').focus();
	}else if($('#pwd').val()!=$('#repwd').val()){
		$('#repwdDiv').text("비밀번호가 일치하지 않습니다");
		$('#repwd').focus();
	}else if($('#id').val()!=$('#check').val()){
		$('#idDiv').text("중복체크 해주세요");
		$('#id').focus();
	}else{
		$.ajax({
			url : 'http://localhost:8080/miniProject_MVC/member/write.do',
			type : 'post',
			data : $('#writeForm').serialize(), // 넘어갈 데이터들을 문자열로 만들어준다.
			success:function(){
					alert("회원가입 성공");
			location.href='/miniProject_MVC/index.jsp';				
			},
			error:function(err){
				console.log(err);
			}
		});
		
		
	}
});
	
//jquery 용법 //css와 비슷한 형식.
//#중복 아이디 체크
$('#writeForm #id').focusout(function(){
	if($('#id').val() == '') {
		$('#idDiv').text('먼저 아이디를 입력하세요.');
		$('#idDiv').css('color', 'magenta');
	}else{
		//서버로 요청하고 제자리로 돌아와라
		$.ajax({
			url : 'http://localhost:8080/miniProject_MVC/member/checkId.do', // 서버 주소
			type : 'post', // get or post
			data : 'id='+$('#id').val() , //서버로 보낼 데이터
			dateType : 'text', // 서버로부터 받을 데이터 자료형 text, html, xml, json
			success : function(data){
				data = data.trim();
				
				if(data == 'exist'){
					$('#idDiv').text('사용 불가능');
				} else if (data == 'non_exist'){
					$('#idDiv').text('사용 가능');
					$('#idDiv').css('color','blue');
					$('input[name="check"]').val($('#id').val());
				}
			},
			error : function(err){
				console.log(err); //에러 꼭 표시해주기
			}
		});//$.ajax
	}
});

$('#updateBtn').click