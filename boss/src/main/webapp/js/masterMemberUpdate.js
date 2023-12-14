$(function(){
		$("form").submit(function(){
			
			if($.trim($('#mName').val()) == ""){
				alert('회원명을 등록해 주세요.');
				$('#mName').focus();
				return false;
			}
			if($('#mPhone').val() == ""){
				alert('전화번호를 등록해 주세요.');
				$('#mPhone').focus();
				return false;
			}
			
			if($('#mGrade').val() == ""){
				alert('회원등급을 등록해 주세요.');
				$('#mGrade').focus();
				return false;
			}
			if($('#mDrop').val() == ""){
				alert('삭제여부를 등록해 주세요.');
				$('#mDrop').focus();
				return false;
			}
			alert('수정 완료');
		});
	});
  
 