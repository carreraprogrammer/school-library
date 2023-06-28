require 'json'

class Storage
  def initialize(file_extention, base_url)
    @file_extention = file_extention
    @base_url = base_url
  end

  def save_data(class_name, object)
    File.write("#{@base_url}#{class_name}.#{@file_extention}", JSON.pretty_generate(object))
  end

  def load_data(class_name)
    file_path = "#{@base_url}#{class_name}.#{@file_extention}"

    return [] unless File.exist?(file_path)

    begin
      data_from_file = File.read(file_path)
      JSON.parse(data_from_file, create_additions: true)
    rescue JSON::ParserError
      []
    end
  end
end
