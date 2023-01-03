$("#cta-form").on('submit', function(e){
    e.preventDefault();
    var form = $(this);
    form.find('.error-message').remove();
    form.find('.success-message').remove();
    form.removeClass('form-with-message');
    $.ajax({
        url: form[0].action,
        type:"post",
        dataType: 'json',
        data: form.serialize(),
        success:function(data){
            if(data.error){
                form.prepend('<div class="error-message">'+data.error+'</div>');
                form.addClass('form-with-message');
            }
            else if(data.success){
               form.prepend('<div class="success-message">'+data.success+'</div>');
               form.addClass('form-with-message');
               grecaptcha.reset();
            }
        },
        error:function(data){
            form.prepend('<div class="error-message error-message-form">Во время отправки произошла ошибка! Попробуйте позднее.</div>');
            form.addClass('form-with-message');
        }
    });
});