if ARGV.empty?
	file_name = '\s\temp\EJBServer.log'
else
	file_name = ARGV[0]
end

File.open file_name do |f|
	f.each_line do |line|
		if line =~ /Reassessing For Date: /
			puts line
		elsif line =~ /^Rule Fired /
			puts line
		end
	end
end