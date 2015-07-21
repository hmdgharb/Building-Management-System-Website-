$(document).ready(function(){
	$('a#toggle').click(function(e)
	{
		e.preventDefault();

		var menu = $('#startingBar');
		
		if(menu.hasClass('left'))
    	{
    		menu.animate({ 'marginLeft': '+222px' }, 1000, function(){
	    		menu.removeClass('left');

	    		$('a#toggle').html('Hide');
	    	});
    	}
    	else
    	{
    		menu.animate({ 'marginLeft': '-650px' }, 1000, function(){
	    		menu.addClass('left');

	    		$('a#toggle').html('Show');

	    		$.ajax(
			 	{   
			 		url : 'text.html',
			 		success : function(data)
			 		{
			 			menu.html(data);
			 		},
			 	});
    		});
    	}
		var menu2 = $('#mainContainer');
		
		if(menu2.hasClass('left'))
    	{
    		menu2.animate({ 'marginRight': '+222px' }, 1000, function(){
	    		menu2.removeClass('left');

	    		$('a#toggle').html('Hide');
	    	});
    	}
    	else
    	{
    		menu2.animate({ 'marginRight': '-800px' }, 1000, function(){
	    		menu2.addClass('left');

	    		$('a#toggle').html('Show');

	    		$.ajax(
			 	{   
			 		url : 'text.html',
			 		success : function(data)
			 		{
			 			menu2.html(data);
			 		},
			 	});
    		});
    	}
		var menu3 = $('#myInterest');
		if(menu3.hasClass('left'))
    	{
    		menu3.animate({ 'marginLeft': '+222px' }, 1000, function(){
	    		menu3.removeClass('left');

	    		$('a#toggle').html('Hide');
	    	});
    	}
    	else
    	{
    		menu3.animate({ 'marginLeft': '-650px' }, 1000, function(){
	    		menu3.addClass('left');

	    		$('a#toggle').html('Show');

	    		$.ajax(
			 	{   
			 		url : 'text.html',
			 		success : function(data)
			 		{
			 			menu3.html(data);
			 		},
			 	});
    		});
    	}
		
		var menu4 = $('#mainContainer2');
		
		if(menu4.hasClass('left'))
    	{
    		menu4.animate({ 'marginRight': '+222px' }, 1000, function(){
	    		menu4.removeClass('left');

	    		$('a#toggle').html('Hide');
	    	});
    	}
    	else
    	{
    		menu4.animate({ 'marginRight': '-800px' }, 1000, function(){
	    		menu4.addClass('left');

	    		$('a#toggle').html('Show');

	    		$.ajax(
			 	{   
			 		url : 'text.html',
			 		success : function(data)
			 		{
			 			menu4.html(data);
			 		},
			 	});
    		});
    	}
	});

});