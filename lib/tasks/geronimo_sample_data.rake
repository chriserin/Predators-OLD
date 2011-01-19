require 'faker'

namespace :db do
  desc "Fill database with geronimo sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
	make_blog_posts
	make_shows
  end
end

def make_blog_posts
  admin = User.create!(:name => "Example User",
                       :email => "example_blog_maker@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
    99.times do |n|
    blogtext = Faker::Lorem.sentence(10)
	admin.blogs.create_with_post("blog " + blogtext)
  end
end

def make_shows
  admin = User.create!(:name => "Example User",
                       :email => "example_show_maker@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
    99.times do |n|
    showtext = Faker::Lorem.sentence(10)
	Show.new_from_post("show " + Date.today.next_day(n - 50).strftime('%m/%d/%y') + " " + showtext).save
  end
end


def make_users
  admin = User.create!(:name => "Example User",
                       :email => "example@railstutorial.org",
                       :password => "foobar",
                       :password_confirmation => "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
                 :email => email,
                 :password => password,
                 :password_confirmation => password)
  end
end

def make_microposts
  User.all(:limit => 6).each do |user|
    50.times do
      user.microposts.create!(:content => Faker::Lorem.sentence(5))
    end
  end
end

def make_relationships
  users = User.all
  user  = users.first
  following = users[1..50]
  followers  = users[3..40]
  following.each { |followed| user.follow!(followed) }
  followers.each { |follower| follower.follow!(user) }
end