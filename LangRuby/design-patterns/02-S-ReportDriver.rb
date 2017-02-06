require_relative "02-S-Report"
require_relative "02-S-HTMLFormatter"
require_relative "02-S-PlainTextFormatter"

puts("Report in HTML Format")
puts("---------------------")
report = Report.new(HTMLFormatter.new)
report.output_report

puts("")
puts("--------------------------")
puts("Report in Plain Text Format")
puts("--------------------------")
report.formatter = PlainTextFormatter.new
report.output_report
