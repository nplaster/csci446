require 'sinatra'
require 'data_mapper'
DataMapper.setup(:default, 'sqlite:./books.sqlite3.db')
require_relative 'Book'
DataMapper.finalize

get '/form' do
	"Hello world"
end

post '/list' do
	@books = Book.all
	"Hello world"
end