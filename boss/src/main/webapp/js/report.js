    $(document).ready(function() {
        $('#report').click(function() {
            if ($('#reporttitle').val() === "") {
                alert("제목을 입력하세요.");
                return false;
            }

            if ($('#reportcontent').val() === "") {
                alert("내용을 입력하세요.");
                return false;
            }
        });
            
        $('#main').click(function() {
            var confirmReset = confirm("메인으로 돌아가시겠습니까?");
            if (confirmReset) {
                location.href = 'main.do';
            }  
            
        });
    });