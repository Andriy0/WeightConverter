require_relative 'value'
require 'yaml'

hash_data = YAML.load_file "data.yml"

values = []

Value.descendants&.each do |klass|
  hash_data[klass.name]&.split&.each do |v|
    values.append klass.new(v.to_f)
  end
end

File.open('result.txt', 'w') do |f|
  values.each do |v|
    f.write "#{v.message}\n"
  end
end
