$("#form").on('submit', function(e){
    e.preventDefault();
    var form = $(this);
    $.ajax({
        url: form[0].action,
        type:"post",
        dataType: 'json',
        data: form.serialize(),
        success:function(data){
            if(data.name) {
                alert(data.name);
            }
        }
    });
});