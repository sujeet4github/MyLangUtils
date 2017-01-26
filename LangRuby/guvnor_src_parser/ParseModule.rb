
# A DecisionTable
# 	Decision Table has 0 or more Rules
#   Rule has lines which make up its comments, name, body
#
class DecisionTable

	def initialize(name)
		raise ArgumentError.new("Not a Valid name") if name.nil?
		@name=name
		@rule_count=0
	end
	
	def name
		@name
	end

	def desc
		"#{@name} with #{@rule_count} rules"
	end
	
	def lines
		@lines
	end

	def add_rule(comments, line)
		add_line({}, "")
		@rule_count += 1
		add_line(comments, line)
	end
	
	def add_line(comments, line)
		
		@lines = Array.new if @lines.nil?
		
		if not comments.nil?
			comments.each { |comment_line|
				@lines.push comment_line
			}
		end

		@lines.push line		
	end
	
end

# Append a line to the right DecisionTable
# initial import statements are not kept any where
# all rules with same rule name go into the same decision table
# create a new one if rule name has changed
# comments are handled appropriately going with the rule
#
class DecisionTableAppender

	def initialialize()
		@current_decision_table = nil
	end

	def current_decision_table
		@current_decision_table
	end
	
	def decision_tables
		@decision_tables
	end

	def append (line)
	
		matchdata = line.match(/^rule "Row ([0-9]+) (.*)"/)
		new_rule_name = nil
		if not matchdata.nil?
			matchdata.captures				
			
			new_rule_number = matchdata[1]
			new_rule_name = matchdata[2]
		end

		if not new_rule_name.nil?
			if @current_decision_table.nil? or not @current_decision_table.name == new_rule_name
				@current_decision_table = DecisionTable.new(new_rule_name) 

				@decision_tables = Array.new if @decision_tables.nil?
				@decision_tables.push @current_decision_table
			end
			current_decision_table.add_rule @commentsForNext, line if current_decision_table.name == new_rule_name
			@commentsForNext = nil
		else
			if line.start_with?("//")
				@commentsForNext = Array.new if @commentsForNext.nil?
				@commentsForNext.push line
			else
				@current_decision_table.add_line @commentsForNext, line  if not current_decision_table.nil?
				@commentsForNext = nil
			end
		end
	end

end

# Read a Guvnor source file and create DecisionTable objects using the DecisionTableAppender
#
class GuvnorSourceReader

	def initialize(path)
		raise ArgumentError.new("Valid path must be provided, not nil") if path.nil?
		raise ArgumentError.new("Not a Valid path - #{path}") if not File.exists?(path)
		raise ArgumentError.new("Not a Valid file - #{path}") if not File.file?(path)
		raise ArgumentError.new("Not a Valid readable file - #{path}") if not File.readable?(path)
			
		@path = path
		@appender = DecisionTableAppender.new
	end

	def read_decision_tables
		source_file = File.open(@path)
		source_file.each { |line|
			line = line.chomp(' ')			
			line = line.chomp
			@appender.append line if not line.empty?
		}
		source_file.close
	end
	
	def decision_tables
		@appender.decision_tables
	end

	def result
		puts "Finished reading #{decision_tables.count} decision tables from #{@path}"
		puts
	end
end

# Write out a decision table to a file
#
class DecisionTableWriter
	def initialize(path, decision_table)
		raise ArgumentError.new("Valid path must be provided - not nil") if path.nil?
		raise ArgumentError.new("Not a Valid path - #{path}") if not File.exists?(path)
		raise ArgumentError.new("Not a Valid directory - #{path}") if not File.directory?(path)
		raise ArgumentError.new("Not a Valid writable directory - #{path}") if not File.writable?(path)
		raise ArgumentError.new("Not a Valid decision table - #{path}") if decision_table.nil?
			
		@path = path
		@decision_table = decision_table
	end
	
	def do
		decision_table_path = @path + "/" + @decision_table.name + ".txt"
		w = File.new decision_table_path, "w"
		
		w.puts "// BEGIN: #{@decision_table.desc}"
		w.puts
		@decision_table.lines.each { |line|
			w.puts line
		}
		w.puts
		w.puts "// END: #{@decision_table.desc}"
		w.close
	end
end

if __FILE__ == $0
	gsr = GuvnorSourceReader.new("C:/Users/ssukumaran/Downloads/Eligibility.txt")
	gsr.read_decision_tables
	gsr.result
	gsr.decision_tables.each { |dt|
		dtw = DecisionTableWriter.new("C:/temp/dts", dt)
		dtw.do
	}
	
end