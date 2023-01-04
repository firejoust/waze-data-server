require "big"
require "json"
require "http/client"

config = File.open("./config.json") do |file|
    JSON.parse(file)
end

def request(config)
    params = URI::Params.encode({
        "top"    => config["pos_top"].to_s,
        "bottom" => config["pos_bottom"].to_s,
        "left"   => config["pos_left"].to_s,
        "right"  => config["pos_right"].to_s,
        "ma"     => config["max_alerts"].to_s,
        "mj"     => config["max_jams"].to_s,
        "mu"     => config["max_users"].to_s,
    })
    response = HTTP::Client.get URI.new("https", "www.waze.com", nil, "/rtserver/web/TGeoRSS/", params)

    data = JSON.parse(response.body)

    data["alerts"].size.times do |i|
        x = data["alerts"][i]["location"]["x"].as_f32
        y = data["alerts"][i]["location"]["y"].as_f32
        puts "found #{data["alerts"][i]["type"]} at x: #{x}, y: #{y}"

        big_x = x.to_big_d
        big_y = y.to_big_d
        puts "the integer representation is: x: #{big_x.value} (scale #{big_x.scale}), y: #{big_y.value} (scale #{big_y.scale})}"

        x_k = big_x.value.remainder(10 ** big_x.scale)
        y_k = big_y.value.remainder(10 ** big_y.scale)

        x_number = (big_x.value - x_k) // 10 ** big_x.scale
        y_number = (big_y.value - y_k) // 10 ** big_y.scale
        puts "the numeric value is: x: #{x_number}, y: #{y_number}"

        x_decimal = x_k.abs
        y_decimal = y_k.abs
        puts "the decimal value is: x: #{x_decimal}, y: #{y_decimal}"
    end
end

request(config)