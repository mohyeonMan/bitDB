$(function(){
	$('#join').submit(function(){
		var user_id = $('input[name="user_id"]').val();
		var user_pw = $('input[name="user_pw"]').val();
		var juminno = $('input[name="juminno"]').val();
		var email = $('input[name="email"]').val();
		var url = $('input[name="url"]').val();
		var hpno = $('input[name="hpno"]').val();

		
		if(!user_id){
			alert("아이디를 입력하세요");
			$('input[name="user_id"]').focus();
			return false; // submit - 페이지 이동을 막아줘야한다
		}
		if(!user_pw){
			alert("비밀번호를 입력하세요");
			$('input[name="user_pw"]').focus();
			return false;
		}
		if(!juminno){
			alert("주민번호를 입력하세요");
			$('input[name="juminno"]').focus();
			return false;
		}
		if(!$('input[name="gender"]').is(':checked')){
			alert("성별을 선택하세요");
			//$('input[name="gender"]:eq(0)').attr('checked','checked'); //문자열
			$('input[name="gender"]:eq(0)').prop('checked','checked'); //객체로 취급
			return false;
		}
		if(!email){
			alert("이메일을 입력하세요");
			$('input[name="email"]').focus();
			return false;
		}
		if(!url){
			alert("url을 입력하세요");
			$('input[name="url"]').focus();
			return false;
		}
		if(!hpno){
			alert("휴대폰번호를 입력하세요");
			$('input[name="hpno"]').focus();
			return false;
		}
		if(!$('input[name="hobby"]').is(':checked')){
			alert("취미를 선택하세요");
			$('input[name="hobby"]:eq(0)').prop('checked','checked');
			return false;
		}		
		if($('select[name="job"] > option:selected').index() < 1){
			alert("직업을 선택하세요");
			$('select[name="job"] > option:eq(1)').attr('selected', true);
			return false;
		}
		
		var gender =$('input[name="gender"]:checked').val();
		var hobby = $('input[name="hobby"]:checked');
		var hobby_val = "";
		hobby.each(function(){
			hobby_val += $(this).val()+"  "; // $('input[name="hobby"]:checked')
		});
		var job =  $('select[name="job"] > option:selected').val();
		
		var result = '<ul>';
		result += '<li>'+ user_id + '</li>';
		result += '<li>'+ user_pw + '</li>';
		result += '<li>'+ juminno + '</li>';
		result += '<li>'+ gender + '</li>';
		result += '<li>'+ email + '</li>';
		result += '<li>'+ url + '</li>';
		result += '<li>'+ hpno + '</li>';
		result += '<li>'+ hobby_val+ '</li>';
		result += '<li>'+ job+ '</li>';
		result += '</ul>';
		
		$('body').html(result);
		
		return false;
	});
});