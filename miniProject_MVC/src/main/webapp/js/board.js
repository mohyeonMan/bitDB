
$('#boardWriteBtn').click(function(){
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
			url : 'http://localhost:8080/miniProject_MVC/board/boardWrite.do',
			type : 'post',
			data : $('#boardWriteForm').serialize(),
			success:function(){
				alert("작성 완료 되었습니다.");
				location.href='/miniProject_MVC/board/boardList.do?pg=1';
			},
			error:function(){
				alert("no!");
			}
		});
	}
});