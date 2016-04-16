require_relative 'lib/calculate_tax'



ARGF.each do |line|
  if line.length < 6
    puts "Usage: enter input in following format: {{product}}, {{quality}}, {{price}}"
    puts "3 attributes must be defined"
    exit(2)
  end
  
    
  tax_calculator = CalculateTax.new(line)
  #tax = CalculateTax.new(line)
  input_to_export = tax_calculator.validate_input(line)
  result = tax_calculator.export(input_to_export)
  puts result
  exit(1)
end



