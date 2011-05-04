module TracksHelper

	def get_track_status_action(track)
		if not signed_in? then
			return 
		end
		if(track.public)
			link_to "make private", tracks_private_path(track.id)	
		else
			link_to "make public", tracks_public_path(track.id)
		end
	end
end
