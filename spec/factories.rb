Factory.define :user do |user|
  user.name                  "Michael Hartl"
  user.email                 "mhartl@example.com"
  user.password              "foobar"
  user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end

Factory.define :micropost do |micropost|
  micropost.content "Foo bar"
  micropost.association :user
end

Factory.define :blog do |blog|
  blog.blogtext "zzz xxx"
  blog.association :user
  blog.frontpage false
end

Factory.define :show do |show|
  show.showtext "January 4th at the yacht club in Iowa City"
  show.showdate DateTime.now.next_year  
end