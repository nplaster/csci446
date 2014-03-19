#!/usr/bin/ruby

require 'rack'
require 'erb'
require 'sqlite3'
require 'csv'

class SimpleApp
	def initialize()
    # can set up variables that will be needed later
		@whatsort = nil
		#@listofbooks = []
		@database = SQLite3::Database.new("books.sqlite3.db")
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
    # include the header
		File.open("header.html", "r") { |head| response.write(head.read) }
		#readfile(request, response)
		render_form(request, response)
		case env["PATH_INFO"]	
	
      when /.*?\.css/
        # serve up a css file
        # remove leading /
        file = env["PATH_INFO"][1..-1]
        return [200, {"Content-Type" => "text/css"}, [File.open(file, "rb").read]]
      when /\/sort.*/
        # serve up a list response
        render_sort(request, response)
      else
        [404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      end	# end case
	
	File.open("footer.html", "r") { |foot| response.write(foot.read) }
      response.finish
    end
	
	def render_sort(req, response)
		@whatsort = req.GET["sorting"]
		#sortedlist = @listofbooks.sort{|x,y| x[whatsort.to_i] <=> y[whatsort.to_i]}
		#@newlist = sortedlist.uniq
		#use sql to create table
		render_table(req, response)
	end

	def render_form(req, response)
		response.write(ERB.new(File.read('form.html.erb')).result(binding))
	end

  # try http://localhost:8080/
	def render_table(req, response)
		response.write(ERB.new(File.read('list.html.erb')).result(binding))
	end
	
	#def readfile(req, response)
	#	i = 1
	#	info = "books.csv"
	#	csv = CSV.open(info , :headers => false).read
	#	csv.each do |row|
	#		individualbook = []
	#		individualbook.push(i)
	#		row.each do |element|
	#			individualbook.push(element)
	#		end
	#		@listofbooks.push(individualbook)
	#		i=i+1
	#	end
	#end
end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run SimpleApp.new, :Port => 8080
