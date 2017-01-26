require 'mongo'

# https://docs.mongodb.com/ruby-driver/master/quick-start/
#

include Mongo

client = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'erep')

puts "\tExisting Collections for erep :"
db = client.database
db.collection_names.each { |cname|
	puts "\t" + cname
	puts "\t=======:"
}

coll_name = "OENSCASEDICISION"

coll = db[coll_name]

coll.find.first(2).flatten.each do |doc|
	puts doc
end

