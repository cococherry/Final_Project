/* Style Switcher 

window.console = window.console || (function($){
	var c = {}; c.log = c.warn = c.debug = c.info = c.error = c.time = c.dir = c.profile = c.clear = c.exception = c.trace = c.assert = function(){};
	return c;
})();

$(document).ready(function($){ 
				   
var styleswitcherstr = ' \
	<h2>Style Switcher <a href="#"></a></h2> \
    <div class="content"> \
    <div class="switcher-box"> \
		<h3>Change Color</h3> \
		<a id="default" class="styleswitch color"></a> \
		<a id="Strongcyan" class="styleswitch color"></a> \
		<a id="DarkCyan" class="styleswitch color"></a> \
		<a id="blue" class="styleswitch color"></a> \
		<a id="orange" class="styleswitch color"></a> \
		<a id="purple" class="styleswitch color"></a> \
		<a id="Softred" class="styleswitch color"></a> \
    </div><!-- End switcher-box --> \
    <div class="clear"></div> \
    </div><!-- End content --> \
	';
	
$(".switcher").prepend( styleswitcherstr );

});

 Skins Style 
$(document).ready(function($){

    var cookieName = 'default';

    function changeLayout(layout) {
    $.cookie(cookieName, layout);
    $('head link[data-name=skins]').attr('href', 'css/skins/' + layout + '.css');
    }

    if( $.cookie(cookieName)) {
    changeLayout($.cookie(cookieName));
    }

    $("#default").click( function(){ $
    changeLayout('default');
    });

    $("#Strongcyan").click( function(){ $
    changeLayout('Strongcyan');
    });
    $("#DarkCyan").click( function(){ $
    changeLayout('DarkCyan');
    });
    $("#blue").click( function(){ $
    changeLayout('blue');
    });
    $("#orange").click( function(){ $
    changeLayout('orange');
    });
    $("#Softred").click( function(){ $
    changeLayout('Softred');
    });
    $("#purple").click( function(){ $
    changeLayout('purple');
    });
    $("#orange").click( function(){ $
    changeLayout('orange');
    });

});

 Reset Switcher 
$(document).ready(function(){ 

    // Style Switcher
    $('.switcher').animate({
        right: '-255px'
    });

    $('.switcher h2 a').click(function(e){
        e.preventDefault();
        var div = $('.switcher');
        console.log(div.css('left'));
        if (div.css('right') === '-255px') {
            $('.switcher').animate({
              right: '0px'
            });
        } else {
            $('.switcher').animate({
              right: '-255px'
            });
        }
    })
});

*/