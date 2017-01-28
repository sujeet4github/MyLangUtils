
# Fails Law of Demeter, tight coupling between objects
#
Weather = Struct.new(:description)
City = Struct.new(:weather)
Address = Struct.new(:city)

Job = Struct.new(:address) do
	def weather
		address.city.weather.description
	end
end

j = Job.new(Address.new(City.new(Weather.new("Cloudy"))))

p j.weather


# To comply with law of Demeter use delegation

City2 = Struct.new(:weatherValue) do
	def weather
		weatherValue.description
	end
end

Address2 = Struct.new(:city) do
	def weather
		city.weather
	end
end

Job2 = Struct.new(:address) do
	def weather
		address.weather
	end
end

j = Job2.new(Address2.new(City2.new(Weather.new("Cloudy"))))

p j.weather
