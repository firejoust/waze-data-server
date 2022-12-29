require "json"

config = File.open("./config.json") do |file|
    Hash(String, Int32 | Float32).from_json(file.gets_to_end)
end

puts config
puts config["interval_mins"]