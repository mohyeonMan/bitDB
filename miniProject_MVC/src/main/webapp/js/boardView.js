$(document).ready(function(){
	$.ajax({
		url : 'http://localhost:8080/miniProject_MVC/board/getBoardView.do',
		type : 'post',
		data : 'seq='+$('#seq').val(),
		dataType : 'json',
		success: function(data){
			$('#subjectSpan').text(data.subject);
			$('#seqSpan').text(data.seq);
			$('#nameSpan').text(data.name);
			$('#hitSpan').text(data.hit);
			$('#contentSpan').text(data.content);

			if($('#memId').val()==data.id){
				$('.loginCheck').attr("type","button");
			}
		},
		error: function(err){
			console.log(err);
		}
	}); 
});
