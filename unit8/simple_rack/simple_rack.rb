#!/usr/bin/ruby

require 'rack'
require 'csv'

class SimpleApp
	def initialize()
    # can set up variables that will be needed later
		@time = Time.now
		@listofbooks = []
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
    # include the header
		File.open("header.html", "r") { |head| response.write(head.read) }
		readfile(request, response)
		render_form(request, response)
		case env["PATH_INFO"]	
	
      when /.*?\.css/
        # serve up a css file
        # remove leading /
        file = env["PATH_INFO"][1..-1]
        return [200, {"Content-Type" => "text/css"}, [File.open(file, "rb").read]]
      when /\/crazy.*/
        # serve up the form
        render_crazy(request, response)
      when /\/goofy.*/
        # serve up a list response
        render_goofy(request, response)
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
		whatsort = req.GET["sorting"]
		sortedlist = @listofbooks.sort{|x,y| x[whatsort.to_i] <=> y[whatsort.to_i]}
		@newlist = sortedlist.uniq
		render_table(req, response)
	end

	def render_form(req, response)
		response.write("<form action='http://localhost:8080/sort' method='GET'>")
		response.write("<select name='sorting'>")
		response.write("<option value='1'>Title</option>")
		response.write("<option value='2'>Author</option>")
		response.write("<option value='3'>Language</option>")
		response.write("<option value='4'>Year</option>")
		response.write("</select>")
		response.write("<input type='submit' value='Submit'>")
		response.write("</form>")
	end

  # try http://localhost:8080/
	def render_table(req, response)
		response.write("<table border='0' cellspacing='5' cellpadding='5'>")
		response.write("<tr>")
		response.write("<th> Rank </th>")
		response.write("<th> Title </th>")
		response.write("<th> Author </th>")
		response.write("<th> Language </th>")
		response.write("<th> Year </th>")
		response.write("<th> Copies </th>")
		response.write("</tr>")
		@newlist.each do |book|
		  response.write("<tr>")
		  book.each do |element|
			response.write("<td> #{element} </td>")
		  end
		  response.write("</tr>")
		end
		
		response.write("</table>")
	end
	
	def readfile(req, response)
		i = 1
		info = "books.csv"
		csv = CSV.open(info , :headers => false).read
		csv.each do |row|
			individualbook = []
			individualbook.push(i)
			row.each do |element|
				individualbook.push(element)
			end
			@listofbooks.push(individualbook)
			i=i+1
		end
	end
	
  # try http://localhost:8080/crazy
	def render_crazy(req, response)
		response.write("This is just crazy! #{@time}")
	end

  # try http://localhost:8080/goofy?name=Jezebel
	def render_goofy(req, response)
		whoIsGoofy = req.GET["name"]
		response.write( "<h2>Proclamation</h2>\n" )
    response.write("<p>#{whoIsGoofy} is goofy!")
	end
end


Signal.trap('INT') {
	Rack::Handler::WEBrick.shutdown
}

Rack::Handler::WEBrick.run SimpleApp.new, :Port => 8080
