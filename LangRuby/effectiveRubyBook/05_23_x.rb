=begin

##23
Understanding the difference between Time, DateTime and Date

DateTime implemented in ruby

Time implemented in C
 - higher precision than DateTime
 - supports daylight savings time

=end

# some date functions need this require
require "date"

d = Date.today
dt = DateTime.now
t = Time.now

p d.to_s
p dt.to_s
p t.to_s

d = Date.new(2015, 04, 03)

p d

# both date time and time have zone methods
p dt.zone # returns offset from GMT
p t.zone # returns timezone as a string

# time has daylight savings time
p t.dst?
