require_relative "../lib/item"

Item = Struct.new(:quantity, :name, :price)
item = Item.new('1', 'Book', '2.22')

describe item do

    it { is_expected.to have_attributes(:quantity => '1')}
    it { is_expected.to have_attributes(:name => 'Book')}
    it { is_expected.to have_attributes(:price => '2.22')}
    
    it { is_expected.to be_truthy }

end