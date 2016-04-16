require_relative '../lib/item'

class CalculateTax
  def initialize(input)
    @input_data = input
  end
  
  def validate_input(input)
    input_arr = input.split(/(\d,\s\w*,\s\d+(\.\d{2})?.\d+)/).collect(&:strip).reject(&:empty?)
    return false if input_arr.length < 1
    return input_arr
  end
  
  def prepare_items_for_exporting(parsed_item)
    line_item = []
    line_item_count = 0
    
    parsed_item.each do |item|
      item_properties = item.split(', ')
      item = Item.new(item_properties[0], item_properties[1], item_properties[2])
      item.calc_sales_tax
      line_item << item
    end
    return line_item
  end
  
  def export(parsed_item)
    items_to_export = prepare_items_for_exporting(parsed_item)
    sales_tax = 0
    total = 0
    items_to_export.each do |item|
      sales_tax += item.sales_tax
      total += item.total
    end
    return "Sales Tax: ".concat(sales_tax.to_s).concat(" Total: ").concat(total.to_s)
  end
  
end

