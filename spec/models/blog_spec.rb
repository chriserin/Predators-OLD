require 'spec_helper'

describe Blog do
  describe 'class methods' do
	
	it 'should respond to new_from_post' do
	  Blog.should respond_to(:new_from_post)
	end
	
	it 'should respond to get_blog_text' do
	  Blog.should respond_to(:get_blog_text)	
	end
	
	it 'should respond to is_blog_post' do
	  Blog.should respond_to('is_blog_post?')	
	end
  
	it 'should respond to is_front_page' do
	  Blog.should respond_to('is_front_page?')	
	end 
	
	it 'should throw error if not a blog post' do
        lambda do
          Blog.new_from_post("xxx zzz")
        end.should raise_error()
	end
	
	it 'should change blogs by one if created successfully' do
        lambda do
          Blog.new_from_post("blog xxx zzz").save
        end.should change(Blog, :count).by(1) 
	end
	
	it 'should be a frontpage with correct content' do
	  Blog.is_front_page?("blog frontpage xxx").should be_true
	end
	
	it 'should be a blog given correct content' do
	  Blog.is_blog_post?("blog frontpage xxx").should be_true
	end
	
	it 'should not be a blog given incorrect content' do
	  Blog.is_blog_post?("frontpage xxx").should be_false
	end
	
	it 'should not be a frontpage blog without front page token' do
	  Blog.is_front_page?("blog xxx").should be_false
	end
	
	it 'should parse post content successfully for blogtext' do
	  Blog.get_blog_text("blog xxx").should =~ /xxx/
	end
  end
end