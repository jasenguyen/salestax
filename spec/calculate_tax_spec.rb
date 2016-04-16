require_relative '../lib/calculate_tax'


describe "tax calculator" do
    input = "1, cake, 3.2 4, monitor, 55.4"

    tax_calculator = CalculateTax.new(input)
    items_to_prepare = tax_calculator.validate_input(input)

    it { is_expected.not_to be_falsey }
    
    it "should return array output after validating" do
      expect(tax_calculator.validate_input(input)). to eq(["1, cake, 3.2", "4, monitor, 55.4"])
    end
    
    it "should return an array 2 objects that is already calculated in tax" do
      expect(tax_calculator.prepare_items_for_exporting(items_to_prepare).length). to eq(2)
    end
    
    it "should return detail of first item before exporting" do
      items_prepared = tax_calculator.prepare_items_for_exporting(items_to_prepare)
      expected = Item.new("1", "cake", "3.2")
      expected.calc_sales_tax
      expect(tax_calculator.prepare_items_for_exporting(items_to_prepare)[0]) == expected
    end
    
    it "should return the result of sales tax" do
      items_to_export = tax_calculator.export(items_to_prepare)
      expected = Item.new("1", "cake", "3.2")
      expect(items_to_export == expected)
    end
end