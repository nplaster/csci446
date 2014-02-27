#!/usr/bin/ruby

require 'rack'
require 'csv'

class SimpleApp
	def initialize()
    # can set up variables that will be needed later
		@time = Time.now
	end

	def call(env)
    # create request and response objects
		request = Rack::Request.new(env)
		response = Rack::Response.new
    # include the header
		File.open("header.html", "r") { |head| response.write(head.read) }
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
      when /\/table.*/
        # serve up a list response
        render_table(request, response)
      else
        [404, {"Content-Type" => "text/plain"}, ["Error 404!"]]
      end	# end case
	
	File.open("footer.html", "r") { |foot| response.write(foot.read) }
      response.finish
    end

  # try http://localhost:8080/table?info=books
	def render_table(req, response)
		name      = req.GET["info"]
		info = name + ".csv"
		#File.open(info, "r") { |book| response.write(book.read) }
		csv = CSV.open(info , :headers => true).read
		response.write("<table border='0' cellspacing='5' cellpadding='5'>")
		response.write("<tr>")
		csv.headers.each do |head|
			response.write("<th> #{head} </th>")
		end 
		response.write("</tr>")
		csv.each do |row| 
		  response.write("<tr>")
		    row.each do |element| 
		      response.write("<td> #{element[1]} </td>")
		    end
		  response.write("</tr>")
		end
		response.write("</table>")
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
