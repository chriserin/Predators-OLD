require 'spec_helper'

describe "Microposts" do

  before(:each) do
    user = Factory(:user)  

    visit signin_path
    fill_in :email,    :with => user.email
    fill_in :password, :with => user.password
    click_button
  end

  describe "creation" do

    describe "failure" do
      it "should not make a new micropost" do
        lambda do
          visit '/home'
          fill_in :micropost_content, :with => ""
          click_button
          response.should render_template('pages/home')
          response.should have_selector('div#error_explanation')
        end.should_not change(Micropost, :count)
      end
    end
    
    describe "success" do
      it "should make a new micropost" do
        content = "Lorem ipsum dolor sit amet"
        lambda do
          visit '/home'
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector('span.content', :content => content)
        end.should change(Micropost, :count).by(1)
      end
    end
  end
  
  describe "blog creation" do
 
    describe "success" do
      it "should make a new micropost+blog" do
        content = "blog Lorem ipsum dolor sit amet"
        lambda do
          visit '/home'
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector('span.content', :content => content)
        end.should change(Blog, :count).by(1)
      end
    end
	
    describe "success frontpage" do
      it "should make a new micropost+blog and publish to front page" do
        content = "blog frontpage Lorem ipsum dolor sit amet"
        lambda do
          visit '/home'
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector('span.content', :content => content)
          expected_content = 'Lorem ipsum dolor sit amet'
          visit '/'
          response.should have_selector('div.BandSays', :content => expected_content)
        end.should change(Blog, :count).by(1)
      end
    end	
  end
  
  describe "show creation" do
 

 
    describe "success" do
      it "should make a new micropost+show and confirm" do
        content = "show Lorem ipsum dolor 12/31/2011 sit amet"
        lambda do
          visit '/home'
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector('span.content', :content => content)
        end.should change(Show, :count).by(1)
      end
    end
	
    describe "success show added" do
      it "should make a new micropost+show and publish to front page" do
        expected_content = 'Lorem ipsum dolor 12/31/2011 sit amet'
        content = "show " + expected_content
        lambda do
          visit '/home'
          fill_in :micropost_content, :with => content
          click_button
          response.should have_selector('span.content', :content => content)
          visit '/'          
          response.should have_selector('div.NextShow', :content => expected_content)
        end.should change(Show, :count).by(1)
      end
    end	
  end
end