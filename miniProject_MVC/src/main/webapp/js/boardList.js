//$(function(){});
$(document).ready(function(){
	//DB에서 한페이지에 5개의 memberDTO를 가져온다.
	$.ajax({
		url : 'http://localhost:8080/miniProject_MVC/board/getBoardList.do',
		type : 'post',
		data : 'pg='+$('#pg').val(),
		dataType : 'json',
		success: function(data){
			
			$.each(data.list, function(index,items){
				//console.log(index); // 0 1 2 3 4
				//목록 테이블 밑에 자동으로 레코드가 추가되도록 설정.
				$('<tr/>').append($('<td/>',{align: 'center',text: items.seq}))
				.append($('<td/>',{}).append($('<a/>',{href:"#",text: items.subject,class:'subjectA'})))
				.append($('<td/>',{align: 'center',text: items.id}))
				.append($('<td/>',{align: 'center',text: items.logtime}))
				.append($('<td/>',{align: 'center',text: items.hit}))
				 .appendTo($('#boardListTable'));
				//.append 1>>2 , .appendTo 2<<1
			}); // 자바에서의 확장for문과 순서가 반대.
			$('.subjectA').click(function(){
				if($('#memId').val()==''){
					alert('먼저 로그인해야합니다.');
					
				}else{
					//alert($(this).parent().prev().text());// 부모태그의 앞의 형제의 text. DOM 형식.
					var seq =$(this).parent().prev().text();
					location.href='/miniProject_MVC/board/boardView.do?seq='+seq+"&pg="+$('#pg').val();
				}
			});
			$('#pagingDiv').html(data.pagingHTML);
		},
		error: function(err){
			console.log(err);
		}
	}); 
});