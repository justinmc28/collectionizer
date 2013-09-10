jQuery ->
	$('#msg').slideDown('slow').delay(12000).fadeOut();
	$('#msg').click ->
    	$(this).clearQueue().slideUp('slow', 'easeOutBounce');