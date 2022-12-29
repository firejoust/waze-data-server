require "json"
require "http/client"

config = File.open("./config.json") do |file|
    Hash(String, Int32 | Float64).from_json(file.gets_to_end)
end

def request(config)
    params = URI::Params.encode({
        "bottom" => config["pos_bottom"].to_s,
        "left"   => config["pos_left"].to_s,
        "ma"     => config["max_alerts"].to_s,
        "mj"     => config["max_jams"].to_s,
        "mu"     => config["max_users"].to_s,
        "right"  => config["pos_right"].to_s,
        "top"    => config["pos_top"].to_s
    })
    response = HTTP::Client.get URI.new("https", "www.waze.com", nil, "/rtserver/web/TGeoRSS/", params)
    puts response.body
end

request(config)