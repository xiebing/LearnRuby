require 'rubygems'
gem 'activerecord'
require 'activerecord'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => ':memory'

ActiveRecord::Base.connection.create_table("books") do |t|
  t.string :isbn, :limit => 13, :null => false, :unique => true
  t.string :title, :null => false
  t.timestamps
end

class Book < ActiveRecord::Base; end
Book.create!(:isbn => '9784003220931', :title => "hello world")

p Book.find_by_title("hello world")
