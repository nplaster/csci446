require 'sinatra'
require 'data_mapper'
DataMapper.setup(:default, 'sqlite:./books.sqlite3.db')
require_relative 'Book'
DataMapper.finalize

get '/' do
	erb :'form.html', :layout => :'layout.html'
end

post '/list' do
	@books = Book.all
	erb :'list.html', :layout => :'layout.html'
end