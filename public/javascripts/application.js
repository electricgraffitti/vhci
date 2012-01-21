/*jslint white: false, onevar: false, browser: true, devel: true, undef: true, nomen: true, laxbreak: true, eqeqeq: true, plusplus: true, bitwise: true, regexp: true, strict: false, newcap: true, immed: true, laxbreak: true */
/*global jQuery, $, Raphael */

var flash = {

	injectFlashBox: function() {
		$('#flash').addClass("flash_wrap");
		$("#flash").hide();
	},

	setFlash: function() {
		flash_message = $("#flash").html();
		msg = $.trim(flash_message);
		if (msg != "") {
			flash.activateNotice(flash_message);
		};
	},

	activateNotice: function(flash_message) {
		var $flash_div = $("#flash");
		$flash_div.html(flash_message);
    flash_div.fadeIn(400);
		// Set the fadeout
    setTimeout(function() {
     flash_div.fadeOut(2000,
     function() {
      flash_div.html("");
      flash_div.hide()})},
    1400);
	}

};

var app = {
  
  badgeRemoval: function() {
    var badge = $("body div").last();
    badge.find("img").css({opacity:0});
  },
  
  // This is the IE6 Js hack for submit button rollovers
  ieButtonFix: function() {
    $('form .submitbtn').hover(function() {
      $(this).css({"background": "url('../images/submit_button.png') 0px 0px no-repeat"});
      $(this).css({"background": "url('../images/submit_button.png') 0px -42px no-repeat"});
    },
    function() {
      $(this).css({"background": "url('../images/submit_button.png') 0px -42px no-repeat"});
      $(this).css({"background": "url('../images/submit_button.png') 0px 0px no-repeat"});
    });
  },
  
  mainNavHovers: function() {
    var navs = $('ul#main_nav_ul li a');
    var lis = navs.parents('li');
    lis.removeClass('highlight');
    navs.append('<span class="hover" />').each(function(){
          $(this).css({fontSize : 0});
          var $span = $('> span.hover', this).css({opacity : 0});
          $(this).hover(function() {
            if ($(this).hasClass('active')) {
              $span.stop().fadeTo(400, 0);
            } else {
             $span.stop().fadeTo(400, 1); 
            }
          }, function() {
            $span.stop().fadeTo(400, 0);
        });
        $(this).click( function() {
          $span.fadeTo(200, 0);
          navs.removeClass('active');
          $(this).addClass('active');
        });
    });
  },
  
  crossfade: function() {
    var $list = $('ul.cube_crossfade');
    var $first_li = $list.children("li:first");
    var $i_width = $first_li.width();
    var $i_height = $first_li.height();

    $list.cube_crossfade({
      speed : 2000,
      pause : 8000
    });
  },
  
  setCurrentLink: function() {  
    var url = location.pathname;
    var current_link = $('#main_nav ul li a[href$="' + url + '"]');
    if (url == "/") {
       current_link.removeClass('active');
       $('.home').addClass('active');
     } else {
     current_link.addClass('active');
     }
  },
  
  ctaArrows: function() {
    
    var ctaNavs = $('div.cta_button a');
    var ctali = ctaNavs.parents('div.cta_button');
    
    ctali.removeClass('highlight');
    ctaNavs.append('<span class="small_cta_button" />').each(function(){
          $(this).css({fontSize : 0});
          var $span = $('> span.small_cta_button', this).css({opacity : 0});
          $(this).hover(function() {
            if ($(this).hasClass('active')) {
              $span.stop().fadeTo(400, 0);
            } else {
             $span.stop().fadeTo(400, 1); 
            }
          }, function() {
            $span.stop().fadeTo(400, 0);
        });
        $(this).click( function() {
          $span.fadeTo(300, 0);
          ctaNavs.removeClass('active');
          $(this).addClass('active');
        });
    });
  },
  
  hideElement: function(el) {
   el.hide(); 
  }
  
};

var panels = {
  
  setFlipTriggers: function(triggers) {
    triggers.click(function() {
      panels.flipPanel($(this));
    });
  },
	
	flipPanel: function(el) {
	  
	  if (el.hasClass('flipped')) {
	    el.revertFlip();
	    el.removeClass('flipped');
	  } else {
	    el.flip({
        direction:'lr',
        speed:350,
        color:'#000'
      });
      el.addClass('flipped');
	  }
	}
  
};

var banners = {
  
  indexBanners: function() {
    var horizontal = true;
    var $panels = jQuery('#slider .panel');
    var $container = jQuery('#slider .scrollContainer');
    var $scroll = jQuery('#slider .scroll').css('overflow', 'hidden');
    var $bannerNav = jQuery('.scroll');
    var $smallBanners = jQuery('#banner_nav');
    
    var scrollOptions = {
      target: $scroll,
      items: $panels,
      navigation: '.navigation a',
      // prev: 'div.banner_scroll.l',
      // next: 'div.banner_scroll.r',
      axis: 'xy',
      duration: 500,
      easing: 'swing',
      onAfter: trigger
    };
    
    if (horizontal) {
      $panels.css({ 'float' : 'left', 'position' : 'relative'});
      if (typeof $panels[0] == 'undefined') {
      
      } else {
        $container.css('width', $panels[0].offsetWidth * $panels.length);
      }
    }
    
    jQuery('#slider .navigation a').bind('mouseover, click', selectNav);

    function selectNav() {
      jQuery(this).parents('ul:first').find('a').removeClass('selected active').end().end().addClass('active selected');
      jQuery(this).parents('ul:first').find('li').removeClass('selected active').end().end().addClass('active selected');
    }
    
    function trigger(data) {
      var el = jQuery('#slider .navigation').find('a[href$="' + data.id + '"]').get(0);
      selectNav.call(el);
    }

    jQuery('#slider').serialScroll(scrollOptions);
    $.localScroll(scrollOptions);
  }
  
};

var videos = {
  
  indexBannerVideos: function() {
    var player = $f(
    
    // Player Div ID
    "player",
    
    // Flash Configs
    {
       src: "/swfs/flowplayer.commercial-3.1.5.swf",
       wmode: 'opaque'
    },
     
    // Player Configs
    { 
      key: '#$45a5242c3cfddf0c3cb',

      play: {opacity: 0},

      canvas: {
     		background: '#000000',
     		backgroundGradient: 'none'
     	},

     	screen: {
     		backgroundColor: '#000000',
     		backgroundGradient: 'none'
     	},

      plugins:  {
        content: {
     			// the only required property for dynamic loading
     			url: 'swfs/flowplayer.content-3.1.0.swf',

     			// some display properties
     			height: 80,
     			color: '#ffffff',
     			// padding:10,
     			backgroundColor: '#000000',
     			backgroundGradient: [0.0, 0.0, 0.0],
     			border: "none",
     			opacity: 0.0,
     			zIndex: 10
     		},
        controls: {
          sliderGradient: 'none',
          tooltipColor: '#5F747C',
          borderRadius: '0px',
          volumeSliderGradient: 'none',
          bufferColor: '#ffffff',
          progressColor: '#0b471d',
          progressGradient: 'medium',
          timeBgColor: '#555555',
          durationColor: '#ffffff',
          buttonOverColor: '#728B94',
          sliderColor: '#000000',
          volumeSliderColor: '#000000',
          buttonColor: '#3d4c43',
          bufferGradient: 'none',
          timeColor: '#051a0b',
          backgroundColor: '#000000',
          tooltipTextColor: '#ffffff',
          backgroundGradient: 'low',
          height: 20,
          opacity: 1.0
        }
      },

      clip: {
        // url: "/videos/4/original/brian_fox_073109.f4v?1260914724",
     		autoPlay: false,
     		autoBuffering: true,
     		fadeInSpeed: 5000,
     		scaling: "orig",
     		backgroundColor: '#000000'
     	},

      playlist: []

    }
    
    );

    $("a.overlay_link").overlay({ 
        // custom expose settings
  	    top: 'center',
  	    expose: {
  	      color: '#000',
  	      opacity: 0.85,
  	      closeSpeed: 700
  	    },
  	    onLoad: function() {
  	      var v = this.getTrigger().attr("href");
  	 	    player.load().play(v);
  	    },

  	    onClose: function() {
  	      player.unload();
  	    }
  	  });
  },
  
  resourceVideos: function() {
    (function(a){$f.addPlugin("playlist",function(d,o){var n=this;var b={playingClass:"playing",pausedClass:"paused",progressClass:"progress",template:'<a href="${url}">${title}</a>',loop:false,playOnClick:true,manual:false};a.extend(b,o);d=a(d);var j=n.getPlaylist().length<=1||b.manual;var k=null;function e(q){var p=m;a.each(q,function(r,s){if(!a.isFunction(s)){p=p.replace("${"+r+"}",s).replace("$%7B"+r+"%7D",s)}});return p}function i(){k=d.children().unbind("click.playlist").bind("click.playlist",function(){return h(a(this),k.index(this))})}function c(){d.empty();a.each(n.getPlaylist(),function(){d.append(e(this))});i()}function h(p,q){if(p.hasClass(b.playingClass)||p.hasClass(b.pausedClass)){n.toggle()}else{p.addClass(b.progressClass);n.play(q)}return false}function l(){if(j){k=d.children()}k.removeClass(b.playingClass);k.removeClass(b.pausedClass);k.removeClass(b.progressClass)}function f(p){return(j)?k.filter("[href="+p.originalUrl+"]"):k.eq(p.index)}if(!j){var m=d.is(":empty")?b.template:d.html();c()}else{k=d.children();if(a.isFunction(k.live)){a(d.selector+"> *").live("click",function(){var p=a(this);return h(p,p.attr("href"))})}else{k.click(function(){var p=a(this);return h(p,p.attr("href"))})}var g=n.getClip(0);if(!g.url&&b.playOnClick){g.update({url:k.eq(0).attr("href")})}}n.onBegin(function(p){l();f(p).addClass(b.playingClass)});n.onPause(function(p){f(p).removeClass(b.playingClass).addClass(b.pausedClass)});n.onResume(function(p){f(p).removeClass(b.pausedClass).addClass(b.playingClass)});if(!b.loop&&!j){n.onBeforeFinish(function(p){if(!p.isInStream&&p.index<k.length-1){return false}})}if(j&&b.loop){n.onBeforeFinish(function(q){var p=f(q);if(p.next().length){p.next().click()}else{k.eq(0).click()}return false})}n.onUnload(function(){l()});if(!j){n.onPlaylistReplace(function(){c()})}n.onClipAdd(function(q,p){k.eq(p).before(e(q));i()});return n})})(jQuery);
    $f("resource_video_player",
    // Flash Configs
    {
      src: "/swfs/flowplayer.commercial-3.1.5.swf",
      wmode: 'transparent',
      bgcolor: "none"
    },
    // Player Configs
    { 
      key: '#$45a5242c3cfddf0c3cb',
      play: {opacity: 0},
      clip: {
        fadeInSpeed: 3000
      },
      canvas: {
        backgroundColor: "transparent",
        backgroundGradient: "none"
      },
      plugins:  { 
        controls: {
          sliderGradient: 'none',
          tooltipColor: '#5F747C',
          borderRadius: '0px',
          volumeSliderGradient: 'none',
          bufferColor: '#ffffff',
          progressColor: '#0b471d',
          progressGradient: 'medium',
          timeBgColor: '#555555',
          durationColor: '#ffffff',
          buttonOverColor: '#00853f',
          sliderColor: '#000000',
          volumeSliderColor: '#000000',
          buttonColor: '#555555',
          bufferGradient: 'none',
          timeColor: '#051a0b',
          backgroundColor: '#000000',
          tooltipTextColor: '#ffffff',
          backgroundGradient: 'low',
          height: 20,
          opacity: 1.0
        }
      },
      onMouseOver: function() { 
        this.getControls().fadeIn(600); 
      }, 

      // you can specify milliseconds how long the fading lasts 
      onMouseOut: function() { 
        this.getControls().fadeOut(600); 
      },  

      // make screen take all available space 
      screen: { 
        bottom: 0 
      }
    }).playlist("#playlist .video_playlist_item").ipad();
  }
  
};

var nucleus = {
  
  nucleusNav: function() {
    
    var anchors = $('ul#nucleus_banner_nav_ul li a');
    var anchorLis = anchors.parents("ul#nucleus_banner_nav_ul li");
    
    anchorLis.removeClass('highlight');
    anchors.append('<span class="hover" />').each(function(){
          $(this).css({fontSize : 0});
          var $span = $('> span.hover', this).css({opacity : 0});
          $(this).hover(function() {
            if ($(this).hasClass('active')) {
              $span.stop().fadeTo(400, 0);
            } else {
             $span.stop().fadeTo(400, 1); 
            }
          }, function() {
            $span.stop().fadeTo(400, 0);
        });
        $(this).click( function() {
          $span.fadeTo(200, 0);
          anchors.removeClass('active selected');
          $(this).addClass('active selected');
        });
    });
  },
  
  nucleusPopups: function() {
    $('.popup_trigger').each(function () {
      // options
      var distance = 10;
      var time = 250;
      var hideDelay = 500;
      var hideDelayTimer = null;

      // tracker
      var beingShown = false;
      var shown = false;

      var trigger = $(this).find("h3");
      var popup = $(this).find(".popup").css('opacity', 0);

      // set the mouseover and mouseout on both element
      $([trigger.get(0), popup.get(0)]).mouseover(function () {
        // stops the hide event if we move from the trigger to the popup element
        if (hideDelayTimer) clearTimeout(hideDelayTimer);

        // don't trigger the animation again if we're being shown, or already visible
        if (beingShown || shown) {
          return;
        } else {
          beingShown = true;

          // reset position of popup box
          popup.css({
            display: 'block' // brings the popup back in to view
          })

          // (we're using chaining on the popup) now animate it's opacity and position
          .animate({
            top: '-=' + distance + 'px',
            opacity: 1
          }, time, 'swing', function() {
            // once the animation is complete, set the tracker variables
            beingShown = false;
            shown = true;
          });
        }
      }).mouseout(function () {
        // reset the timer if we get fired again - avoids double animations
        if (hideDelayTimer) clearTimeout(hideDelayTimer);

        // store the timer so that it can be cleared in the mouseover if required
        hideDelayTimer = setTimeout(function () {
          hideDelayTimer = null;
          popup.animate({
            top: '-=' + distance + 'px',
            opacity: 0
          }, time, 'swing', function () {
            shown = false;
            popup.css({'display':'none', 'top':'-150px'});
          });
        }, hideDelay);
      });
    });
  }
  
};

var services = {
    
  servicePopups: function() {
    $('div#service_boxes div.popup_box a.service_avatar').append('<span class="hover" />').each(function(){
          var $service_span = $('> span.hover', this).css({opacity : 0});
          $(this).hover(function() {
            if ($(this).hasClass('active')) {
              $service_span.stop().fadeTo(400, 0);
            } else {
             $service_span.stop().fadeTo(400, 1);
             $(this).parent().stop().animate({ backgroundColor: "#efefef", top : "-2px" }, 400);
            }
          }, function() {
            $service_span.stop().fadeTo(400, 0);
            $(this).parent().stop().animate({ backgroundColor: "#dedede", top : "0px" }, 400);
        });
    });
  },
  
  serviceInquiry: function() {
    $('#new_service_inquiry').submit(function() {
      var $business_type = $('#service_inquiry_business_type_id :selected');
      var $claim_type = $('#service_inquiry_claim_type_id :selected');
      var $goal_type = $('#service_inquiry_goal_type_id :selected');

      if ( $business_type.text() === "Choose Option" || $claim_type.text() === "Choose Option" || $goal_type.text() === "Choose Option" ) {
        jAlert('All 3 options must be selected', 'Selection Error');
      } else {
        $params = $(this).serializeArray();

        services.triggerServicePanel($claim_type.text());

        $.post($(this).attr("action"), $params, null, "script");
      };

      return false;
    });
  },
  
  triggerServicePanel: function(classval){
    var $block = $("." + classval);
    var $service_span = $('> span.hover', $block).css({opacity : 0});
    
    $block.parent().nextAll().find('span.hover').fadeTo(400, 0);
    $block.parent().nextAll().animate({ backgroundColor: "#dedede", top : "0px" }, 400);
    
    $service_span.stop().fadeTo(400, 1);
    $block.parent().stop().animate({ backgroundColor: "#efefef", top : "-2px" }, 400);
  }
  
};

var markets = {
  
  marketPopup: function() {
    $('#market_popups .popup_box a.market_link').append('<span class="hover" />').each(function(){
          var $service_span = $('> span.hover', this).css({opacity : 0});
          $(this).hover(function() {
            if ($(this).hasClass('active')) {
              $service_span.stop().fadeTo(400, 0);
            } else {
             $service_span.stop().fadeTo(400, 1);
             $(this).parent().stop().animate({ backgroundColor: "#efefef", top : "-2px" }, 400);
            }
          }, function() {
            $service_span.stop().fadeTo(400, 0);
            $(this).parent().stop().animate({ backgroundColor: "#dedede", top : "0px" }, 400);
        });
    });
  }
  
};

var accreds = {
  
  accredsPopup: function() {
    $('div.accreditation_work_box a.accreditation_link').append('<span class="hover" />').each(function(){
          var $service_span = $('> span.hover', this).css({opacity : 0});
          $(this).hover(function() {
            if ($(this).hasClass('active')) {
              $service_span.stop().fadeTo(400, 0);
            } else {
             $service_span.stop().fadeTo(400, 1);
             $(this).parent().stop().animate({ backgroundColor: "#efefef", top : "-2px" }, 400);
            }
          }, function() {
            $service_span.stop().fadeTo(400, 0);
            $(this).parent().stop().animate({ backgroundColor: "#dedede", top : "0px" }, 400);
        });
    });
  }
  
};

var admin = {
  
  employeeEdit: function() {
    var emp_edit_link = $('#employee_profile_slide_link');
    var emp_edit_box = $('#employee_profile_slide');

    emp_edit_link.click(function() {
      emp_edit_box.toggle();
    });
  },
  
  datePickers: function() {
    $('#ticket_date_select').datepicker({
  		showButtonPanel: true
  	});
  	$('#event_start_date').datepicker({
  		showButtonPanel: true
  	});
  	$('#event_end_date').datepicker({
  		showButtonPanel: true
  	});
  	$('#ad_expiration_date').datepicker({
  		showButtonPanel: true
  	});
  },
  
  dataTables: function() {
    var servicesTable = $('#services_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });
    var articlesTable = $('#articles_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });
    var eventsTable = $('#events_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });
    var videosTable = $('#videos_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });
    var documentsTable = $('#documents_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });
    var advertisementsTable = $('#advertisements_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });
    var quotesTable = $('#quotes_table').dataTable({
      "bJQueryUI": true,
      "sPaginationType": "full_numbers"
    });
  },
  
  thirdPartyUrlToggle: function() {
    var $tpurl = $('#third_party_url_field').hide();
    var $tpcb = $('#article_third_party');

    $tpcb.click( function() {
     if ($(this).is(':checked')) {
      $tpurl.show(); 
     } else {
      $tpurl.hide();
     }
    });
  },
  
  multipleUploads: function() {
    var $upload_div = $('.upload_div');
    var $upload_field = $('.upload_field');
    var $add_link = $("#add_upload");
    
    $upload_div.before('<a id="add_upload" href="#">Add More Attachments<a/>');
    
    $add_link.click(function() {
      $upload_field.clone().appendTo($upload_div);
    });
  }
  
};

$(document).ready(function() {
  app.badgeRemoval();
  flash.injectFlashBox();
	flash.setFlash();
  app.ieButtonFix();
  //app.mainNavHovers();
  app.setCurrentLink();
});




