require 'data_mapper'

class Book
  include DataMapper::Resource
  
  property :id, Serial
  property :title, String
  property :author, String
  property :language, String
  property :published, Integer
end