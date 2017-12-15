$(document).on('turbolinks:load', function() {
  // События для найденных позиций в строке запроса - делегаты
    var a = 0;
    $('#divId').on('mouseenter', 'div', function() {
        $(this).css("background","#FFDAB9");
        a = $(this).attr("id");
    });

    $('#divId').on('mouseleave', 'div', function() {
        $(this).css("background","#efefdd");
    });

    $( ".srch_frm" ).submit(function( event ) {
      //alert( "Handler for .submit() called." );
      //event.preventDefault();

        //$('.srch_frm').append('<input id="id" name="id" type="hidden" value="1">');
        $('.srch_frm').attr("method","get");
        $('.srch_frm').attr("action","gnvls/"+a+"");
    });


    $('#divId').on('click', 'div', function() {
        $( ".srch_frm" ).submit();
    });


    var lp = '';
    var lg = '';

    $('#gnvls').bind('keypress', function(event){
        if (event.keyCode == 13) {
          $( ".srch_frm" ).submit(function( event ) {
              $('.srch_frm').attr("method","post");
              $('.srch_frm').attr("action","gnvls/search");
          });
        }
    });

    $('#gnvls').bind('keydown', function(event){
        lp = $('#gnvls').val();
    });
    //Это событие для ввода строки поиска
    $('#gnvls').bind('keyup', function(event){


      lg = $('#gnvls').val();

      if (event.keyCode != 13) {
          if ((lg.length > 2) && (lg != lp)) {

              $('#divId').animate({height: 'show'}, 400);
              //Делаем запрос
              var h = $.ajax({
                type: "POST",
                dataType: 'json',
                url: "gnvls/searching",
                data: {
                   str: $('#gnvls').val()
                },
                success: function(msg){
                  //Получаем данные
                  $('#divId').empty();
                  //alert($('#gnvls').val());
                  $.each(msg, function(key, val){
                    jQuery.parseJSON(key,val);
                    $('#divId').append('<div id='+val.id+'>' + val.name + ' упак.' + val.qntpack + ' Прзв.' + val.owner + '</div>');
                  });
                  //Меняем цвета всех div - найденных строк
                  $("#divId").children().css("background","#efefdd")
                }
              })
          }
          if (lg.length < 4) {
            $('#divId').animate({height: 'hide'}, 200);
          }
      } //if event.keyCode
    });
});
