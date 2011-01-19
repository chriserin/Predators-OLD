# == Schema Information
# Schema version: 20110111234559
#
# Table name: blogs
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  frontpage  :boolean
#  blogtext   :text
#  created_at :datetime
#  updated_at :datetime
#

require 'maruku'

class Blog < ActiveRecord::Base

  belongs_to :user
  
  def to_html
	doc = Maruku.new(blogtext)
	doc.to_html
  end  
  
  class << self 
	def latest_for_frontpage
		self.where(:frontpage => true).last
	end
  
    def new_from_post(post)
	  Blog.new do |b|
	    
		if(is_blog_post?(post))
		  b.frontpage = is_front_page?(post)
		  b.blogtext = get_blog_text post
		else
			raise "#{post} isn't a blog post"
		end
	  end
	end
	
	def get_blog_text(post)	
		post.gsub(/blog\sfrontpage\s|blog\s/, '')
	end
	  
	def is_blog_post?(post)
	  post.split()[0] == 'blog'
	end
	  
	def is_front_page?(post)
	  return post.split()[1] == 'frontpage'
	end
  end
end