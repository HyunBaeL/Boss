$(function(){
	$('form').submit(function(){
		if($.trim($('#qrcontent').val()) == ""){
			alert('답변을 등록해 주세요');
			$('#qrcontent').focus();
			return false;
		}
	});
});