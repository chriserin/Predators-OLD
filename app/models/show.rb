# == Schema Information
# Schema version: 20110113205037
#
# Table name: shows
#
#  id         :integer         not null, primary key
#  showtext   :text
#  showdate   :date            not null
#  created_at :datetime
#  updated_at :datetime
#

class Show < ActiveRecord::Base

  class << self 
  
    def next_show()
      Show.where("showdate > ?", Date.today.yesterday).order("showdate ASC").first      
    end    
  
    def upcoming_shows()
      Show.where("showdate > ?", Date.today.yesterday).order("showdate ASC")    
    end
    
    def past_shows()
      Show.where("showdate < ?", Date.today).order("showdate DESC")
    end
  
    def new_from_post(post)
      Show.new do |show|	    
        if(is_show_post?(post))
          show.showdate = get_date(post)
          show.showtext = get_show_text post
        else
          raise "#{post} isn't a show post"
        end
      end
    end
	
    def is_show_post?(post)
      post.split()[0] == 'show'	  
    end
	
    def get_date(post)
                
      regexpFormats = [/\d+\/\d+\/\d+/, /\d+-\d+-\d+/, /\d+-\d+/]
      formats = ['%m/%d/%Y', '%m/%d/%y', '%m-%d-%Y', '%m-%d-%y', '%m-%d']
      
      show_date = nil
      
      while (not show_date or (show_date < DateTime.now or show_date > DateTime.now.next_year(2))) and formats.size > 0 
        begin
          format = formats.shift(1)[0]
          for r_format in regexpFormats
            if post =~ r_format
              show_date = Date.strptime($~[0], format)			
            end
          end
        rescue
          puts $!
          retry unless formats.size == 0
        end
      end
      
      if(not show_date)	  
        begin
          show_date = Date.parse(post)
        rescue
          #if has reached here show_date should be nil
        end
      end	  
      
      return show_date
    end
	
    def get_show_text(post)
      post_array = post.split()
        post_array.shift(1)
      post_array.join(' ')	      
    end
  end
end
