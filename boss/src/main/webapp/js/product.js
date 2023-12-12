/**
 *  리뷰인서트 및 업데이트 관련 처리
 */
 


 
 $(function() { 
    $('#review_insert_button').click(function(){
    	if ($('#rwriter').val() == "") {
            alert("작성자를 입력해주세요.");
            return false;
        }
    
        if ($('#rtitle').val() == "") {
            alert("글제목을 입력해주세요.");
            return false;
        }
      
        if ($('#rcontent').val() == "") {
            alert("글내용을 입력해주세요.");
            return false;
        }
        
        if ($('#askcontent').val() == "") {
            alert("문의내용을 입력해주세요.");
            return false;
        }
    }); 
});




