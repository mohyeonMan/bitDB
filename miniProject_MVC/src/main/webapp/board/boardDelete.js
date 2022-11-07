$('#boardDeleteBtn').click(function(){
	$.ajax({
		url : "http://localhost:8080/miniProject_MVC/board/boardDelete.do",
		type : 'post',
		data : 'seq='+$('#seq').val(),
		success:function(){
				alert("삭제 되었습니다.");
				location.href='/miniProject_MVC/board/boardList.do?pg=1';
		},
		error:function(){
				alert("no!");
			}
		
	});
	
});