require 'json'

class Store
  def read_file(name_of_file)
    file = File.read(name_of_file)
    JSON.parse(file)
  end

  def write_file(name_of_file, data)
    data_in_json = JSON.generate(data)
    File.write(name_of_file, data_in_json)
  end
end
