// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function(){
	$("#micropost_content").keypress(function(e){
		if($("#micropost_content").val() == 'track upload')
		{
			$("#micropost_track_recording").click();
			$("#track_chooser").css("z-index", 1);
		}
	});
	
	$("#micropost_track_recording").bind('change', function(e)
	{
		var filename = $("#micropost_track_recording").val()
		if(filename.search(/\\/) > 0)
		{
			filename = filename.split(/\\/)[2];
		}
		
		$("#micropost_content").val($("#micropost_content").val() + filename);
		$("#track_chooser").css("z-index", -1);
	});


	$(".play_button").bind('click', function(e){
		$('audio').audivid("src", $(this).siblings('a').attr("href"));
		$('audio').audivid("play");		
	});	
});

