require './lib/enigma'

enigma_1 = Enigma.new

input_file = ARGV[0]
output_file = ARGV[1]

message_txt = File.new(input_file).read

File.open(output_file, "w") do |file|
  result_hash = enigma_1.encrypt(message_txt)
  file.puts result_hash[:encryption]
  puts "Created #{output_file} with the key #{result_hash[:key]} and date #{result_hash[:date]}"
end
