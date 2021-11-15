require './lib/enigma'

enigma_1 = Enigma.new

input_file = ARGV[0]
output_file = ARGV[1]
key = ARGV[2].to_s
date = ARGV[3].to_s


encrypted_txt = File.new(input_file).read

File.open(output_file, "w") do |file|
  result_hash = enigma_1.decrypt(encrypted_txt, key, date)
  file.puts result_hash[:decryption]
  puts "Created #{output_file} with the key #{result_hash[:key]} and date #{result_hash[:date]}"
end
