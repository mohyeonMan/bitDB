$(document).ready(function(){
	$.ajax({
		url : 'http://localhost:8080/miniProject_MVC/board/getBoardView.do',
		type : 'post',
		data : 'seq='+$('#seq').val(),
		dataType : 'json',
		success: function(data){
			$('#subject').val(data.subject);
			$('#content').val(data.content);
		},
		error: function(err){
			console.log(err);
		}
	});
});

$('#boardUpdateBtn').click(function(){
	$('#subjectDiv').empty();
	$('#contentDiv').empty();

	if($('#subject').val()==''){
		$('#subjectDiv').text('제목을 입력해주세요');
		$('#subject').focus();
	}else if($('#content').val()==''){
		$('#contentDiv').text('입력하신 내용이 없습니다.');
		$('#content').focus();
	}else{
		$.ajax({
			url : "http://localhost:8080/miniProject_MVC/board/boardUpdate.do?seq="+$('#seq').val(),
			type : 'post',
			data : $('#boardUpdateForm').serialize(),
			success:function(){
				alert("수정 완료 되었습니다.");
				location.href='/miniProject_MVC/board/boardList.do?pg='+$('#pg').val();
			},
			error:function(){
				alert("no!");
			}
		});
	}
});
