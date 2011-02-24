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
		 
		var filename = $(this).siblings('a').attr("href").split(/\?/)[0];
		var extension_array = filename.split(/\./);
		var extension = extension_array[extension_array.length -1];

		
 		if(extension == 'mp3')
		{
			$("#jquery_jplayer_1").jPlayer("setMedia", { mp3: filename });		
			$("#jquery_jplayer_1").jPlayer("supplied", extension);
		}
		else if (extension == 'm4a')
		{
			$("#jquery_jplayer_1").jPlayer("setMedia", { m4a: filename });		
			$("#jquery_jplayer_1").jPlayer("supplied", extension);		
		}
		else if (extension == 'ogg')
		{
			$("#jquery_jplayer_1").jPlayer("setMedia", { ogg: filename });		
			$("#jquery_jplayer_1").jPlayer("supplied", extension);		
		}

		$("#jquery_jplayer_1").jPlayer("play");
		$("#jp_playlist_1").html($(this).siblings('a').text());
	});	
});