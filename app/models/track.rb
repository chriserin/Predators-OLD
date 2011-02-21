class Track < ActiveRecord::Base
	has_attached_file :recording, 
		:storage => :s3,
		:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		:path => 'audio/:session_name/:basename.:extension',
		:bucket => 'chriserin_paperclip_test'

		
	class << self
		def is_track_upload_post?(post)
			post =~ /^track\supload/i						
		end		 
		
		def get_name(post, track)
			if(post =~/n=(\w.*)/i)
				$1.split(" ")[0]
			else				
				post.split(" ")[2].split('.')[0]
			end
		end
		
		def get_session_name(post)
			if(post =~/s=(\w.*)/i)
				$1
			else	
				Date.today.strftime('%d%b%y')
			end					
		end
	end
end