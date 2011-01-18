require 'spec_helper'

describe Show do

  describe 'getting upcoming shows' do
    it 'should get todays show but not yesterdays' do
        today_date = DateTime.now.strftime('%m/%d/%y')
        yesterday_date = DateTime.now.next_day(-1).strftime('%m/%d/%y')
        show1 = Show.new_from_post("show xxx #{today_date} zzz")
        show2 = Show.new_from_post("show xxx #{yesterday_date} zzz")
        show1.save
        show2.save
        Show.next_show.should == show1
        Show.upcoming_shows.should == [show1]
        Show.past_shows.should == [show2]
    end  
  end


  describe 'creating a show with a post' do
    it 'should throw error if not a show post' do
          lambda do
            Show.new_from_post("xxx zzz")
          end.should raise_error()
    end  
	
    it 'should change shows by one if created successfully' do
          lambda do
            Show.new_from_post("show xxx 3/24/2011 zzz").save
          end.should change(Show, :count).by(1) 
    end

    it 'should change throw error if cant put a date to it' do
          lambda do
            Show.new_from_post("show xxx zzz").save
          end.should raise_error()
    end	
  end
  
  describe 'class methods' do
    
    it 'should respond to new from post' do
      Show.should respond_to(:new_from_post)
    end  
    
    it 'should respond to get_date' do
      Show.should respond_to(:get_date)
    end  
    
    it 'should respond to get_show_text' do
      Show.should respond_to(:get_show_text)
    end	
    
    it 'should respond to is_show_post?' do
      Show.should respond_to(:is_show_post?)
    end		
    
    it 'should be true if post is a show post' do
      post = 'show xxx yyy'
      Show.is_show_post?(post).should be_true
    end

    describe 'get date' do

      before(:each) do
        @expected_date = Date.new 2011, 12, 31
        if @expected_date < DateTime.now 
          @expected_date = @expected_date.next_year
        end
        
        @year = @expected_date.year.to_s
        @year_truncated = @expected_date.year.to_s.slice 2..3
      end    

      it 'should be expected date for format mm/dd/yyyy' do
        post = "show 12/31/#{@year}"
        Show.get_date(post).should == @expected_date
      end

      it 'should be expected date for format mm/dd/yy' do
        post = "show 12/31/#{@year_truncated}"
        Show.get_date(post).should == @expected_date
      end

      it 'should be expected date for format mm/dd' do
        post = "show 12/31"
        Show.get_date(post).should == @expected_date
      end
      
      it 'should be expected date for format mm-dd-yyyy' do
        post = "show 12-31-#{@year_truncated}"
        Show.get_date(post).should == @expected_date
      end

      it 'should be expected date for format mm-dd-yy' do
        post = "show 12-31-#{@year_truncated}"
        Show.get_date(post).should == @expected_date
      end

      it 'should be expected date for format mm-dd' do
        post = "show 12-31"
        Show.get_date(post).should == @expected_date
      end

      it 'should be expected date for format Dec 31st' do
        post = "show Dec 31st"
        Show.get_date(post).should == @expected_date
      end

      it 'should be expected date for format December 31, YYYY' do
        post = "show December 31, #{@year_truncated}"
        Show.get_date(post).should == @expected_date
      end      
    end
  end
end