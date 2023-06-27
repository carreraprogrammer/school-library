require 'json'

class ParseJson
  def initialize(data)
    @data = data
  end

  def parse_json
    JSON.generate(@data)
  end
end

data = { example: "example" }
parser = ParseJson.new(data)
json_string = parser.parse_json

puts json_string