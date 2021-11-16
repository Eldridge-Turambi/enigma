require './lib/enigma'

enigma_1 = Enigma.new

input_file = ARGV[0]
output_file = ARGV[1]
key = ARGV[2]
date = ARGV[3]

encrypted_txt = File.read(input_file).delete!("\n")

File.open(output_file, "w") do |file|
  result_hash = enigma_1.decrypt(encrypted_txt, key, date)
  file.puts result_hash[:decryption]
  puts "Created #{output_file} with the key #{result_hash[:key]} and date #{result_hash[:date]}"
end
