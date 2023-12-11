
	function goBack() {
		alert('이전 페이지로 돌아갑니다.');
		history.go(-1);
	}
	
	$(function(){
		$("form").submit(function(){
			if($.trim($('#pimage1').val()) == ""){
				alert('이미지를 등록해 주세요.');
				return false;
			}
			if($.trim($('#pname').val()) == ""){
				alert('상품명을 등록해 주세요.');
				$('#pname').focus();
				return false;
			}
			if($('#pcolor').val() == ""){
				alert('색상을 등록해 주세요.');
				$('#pcolor').focus();
				return false;
			}
			if($('#psize').val() == ""){
				alert('사이즈를 등록해 주세요.');
				$('#psize').focus();
				return false;
			}
			if($('#pcontent').val() == ""){
				alert('상품 설명을 등록해 주세요.');
				$('#pcontent').focus();
				return false;
			}
			if($('#pprice').val() == ""){
				alert('가격을 등록해 주세요.');
				$('#pprice').focus();
				return false;
			}
			if($('#acount').val() == ""){
				alert('재고 수량을 등록해 주세요.');
				$('#acount').focus();
				return false;
			}
		});
	});
	
