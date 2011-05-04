class Picture < ActiveRecord::Base
	has_attached_file :image,
		:storage => :s3,
		:s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
		:path => 'images/:session_name/:basename.:extension',
		:bucket => 'chriserin_paperclip_test'

		
	class << self
		def is_picture_upload_post?(post)
			post =~ /^picture\supload/i						
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
