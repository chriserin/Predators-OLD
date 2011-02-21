// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
	$("#micropost_content").keypress(function(e){
		if($("#micropost_content").val() == 'track upload')
		{
			document.getElementById("micropost_track_recording").click();

		}
	});
	
	$("#micropost_track_recording").bind('change', function(e)
	{
		var filename = $("#micropost_track_recording").val().split(/\\/);
		$("#micropost_content").val($("#micropost_content").val() + filename[2]);
	});


	$(".play_button").bind('click', function(e){
		$('audio').audivid("src", $(this).siblings('a').attr("href"));
		$('audio').audivid("play");		
	});	
});

