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

//clicable row
    $(".clickable-row").click(function() {
        window.location = $(this).attr("data-ref");
    });

// Fix header

//$(".fixhead").appendTo("#container_head");
//$(".fixbody").appendTo("#container_body");
function FixTable(table) {
    var inst = this;
    this.table  = table;

    $('tr > th',$(this.table)).each(function(index) {
        var div_fixed = $('<div/>').addClass('fixtable-fixed');
        var div_relat = $('<div/>').addClass('fixtable-relative');
        div_fixed.html($(this).html());
        div_relat.html($(this).html());
        $(this).html('').append(div_fixed).append(div_relat);
        $(div_fixed).hide();
    });

    this.StyleColumns();
    this.FixColumns();

    $(window).scroll(function(){
        inst.FixColumns()
    }).resize(function(){
        inst.StyleColumns()
    });
}

FixTable.prototype.StyleColumns = function() {
    var inst = this;
    $('tr > th', $(this.table)).each(function(){
        var div_relat = $('div.fixtable-relative', $(this));
        var th = $(div_relat).parent('th');
        $('div.fixtable-fixed', $(this)).css({
            'width': $(th).outerWidth(true) - parseInt($(th).css('border-left-width')) + 'px',
            'height': $(th).outerHeight(true) + 'px',
            'left': $(div_relat).offset().left - parseInt($(th).css('padding-left')) + 'px',
            'padding-top': $(div_relat).offset().top - $(inst.table).offset().top + 'px',
            'padding-left': $(th).css('padding-left'),
            'padding-right': $(th).css('padding-right')
        });
    });
}

FixTable.prototype.FixColumns = function() {
    var inst = this;
    var show = false;
    var s_top = $(window).scrollTop();
    var h_top = $(inst.table).offset().top;

    if (s_top < (h_top + $(inst.table).height() - $(inst.table).find('.fixtable-fixed').outerHeight()) && s_top > h_top) {
        show = true;
    }

    $('tr > th > div.fixtable-fixed', $(this.table)).each(function(){
        show ? $(this).show() : $(this).hide()
    });
}
//$(".table").appendTo("#cntr");

$('.fixtable').each(function() {
    new FixTable(this);
});

});
