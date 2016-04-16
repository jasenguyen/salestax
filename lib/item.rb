class Item
  attr_reader :sales_tax, :total
  attr_accessor :name, :quantity, :price
  
  BASIC_TAX_RATE = 0.1
  IMPORT_DUTY_RATE = 0.05
  
  def initialize(quantity, name, price)
    @quantity = quantity.to_i
    @name = name
    @price = price.to_f
    @sales_tax = 0
    @total = 0
  end
  
  def calc_sales_tax
    basic_tax = @price * @quantity * BASIC_TAX_RATE
    import_duty_tax = @price * @quantity * IMPORT_DUTY_RATE
    @sales_tax = basic_tax + import_duty_tax
    @total = @sales_tax + (@price * @quantity)
  end
  
end