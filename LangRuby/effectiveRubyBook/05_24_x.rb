=begin

##24
Do HTTP requests with Net::HTTP
  very performant library

=end

require "net/http"

response = Net::HTTP.get("httpbin.org", "/user-agent")

puts response

p "----------------------------"

require "net/http"

uri = URI("http://httpbin.org/user-agent")

response = Net::HTTP.get(uri)

puts response

p "--------------------------------"

params = {:limit => 10, :offset => 3}
uri = URI("http://httpbin.org/get")
uri.query = URI.encode_www_form(params)
response = Net::HTTP.get_response(uri)
puts response.body
puts response.code

p "--------------------------------"

uri = URI("http://httpbin.org/post")
response = Net::HTTP.post_form(uri, :q => 'ruby')
puts response.body
puts response.code

p "--------------------------------"

# block form
#  connection is kept-alive
	request = Net::HTTP::Get.new(URI("http://httpbin.org/user-agent"))
	response = http.request(request)
	
	p response.code
	puts response.body
end
