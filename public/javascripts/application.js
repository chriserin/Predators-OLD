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
		var filename = $(this).siblings('a').attr("href").split(/\?/)[0];
		alert(filename);
		$("#jquery_jplayer_1").jPlayer("setMedia", { mp3: filename });
		$("#jquery_jplayer_1").jPlayer("play");
		$("#jp_playlist_1").html($(this).siblings('a').text());
	});	
});