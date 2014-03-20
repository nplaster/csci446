require 'sinatra'
require 'data_mapper'
require_relative 'book'

get '/' do
	"Hello world"
end