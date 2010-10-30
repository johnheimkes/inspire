# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

(1..30).each do |x|
  Post.create(
    :image_url => nil,
    :title => "asffada",
    :body => "foo",
    :user_id => 1,
    :created_at => "2010-09-24 22:33:02",
    :updated_at => "2010-09-24 22:33:02",
    :image_file_name => "Screen shot 2010-09-24 at 5.42.16 PM.png",
    :image_content_type => "image/png",
    :image_file_size => 382461,
    :image_updated_at => "2010-09-24 22:33:01"
  )
end

a = Post.find(1)
a.tag_list = "foo, bar, baz"
a.save

b = Post.find(2)
b.tag_list = "foo, bar"
b.save

c = Post.find(3)
c.tag_list = "foo"
c.save
