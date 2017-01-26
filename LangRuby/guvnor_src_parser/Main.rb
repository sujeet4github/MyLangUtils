require_relative	'ParseModule'

file_name = ARGV[0]
output_dir = ARGV[1]

gsr = GuvnorSourceReader.new(file_name)
gsr.read_decision_tables
gsr.result
gsr.decision_tables.each { |dt|
	dtw = DecisionTableWriter.new(output_dir, dt)
	dtw.do
}
