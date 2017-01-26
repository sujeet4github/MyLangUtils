require 'csv'


def process(filename)

	puts("will process #{filename}")
	csv_text = File.read(filename)
	csv = CSV.parse(csv_text, :headers => true)
	
	duplicates = Array.new
	goodRows = Hash.new
	goodRows.default = 0
	
	csv.each do |row|
	
		# process row here
		caseRef = row['CASEREFERENCE']
		taskDesc = row['WDOATTRIBUTEVALUE']
		taskId = row['TASKID']
		key = caseRef + "-" + taskDesc

		if (goodRows[key] == 0)
			goodRows[key] = taskId
		else
			duplicates << taskId
		end
	end
	
	puts("Found #{duplicates.length} duplicates");
	File.write('./dups.txt', duplicates)
	
end

# call function with generated CSV file
process("COLA_Tasks_And_AssociatedCases.csv")