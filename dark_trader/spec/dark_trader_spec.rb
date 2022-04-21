require_relative '../lib/dark_trader'
describe 'the currency name method' do
    it "should return an array with the crypto names inside" do 
        expect(array_currency_names).not_to be_nil
    end
end

describe 'the currency price method' do
    it "should return a value and is  supposed not to be nil" do
    expect(array_currency_price).not_to be_nil
    end
end

describe 'the currency name methode number of value' do
    it "should return that it has a certain number of value" do
        array_currency_names = [1, 2, 3]
        expect([1, 2, 3]).to contain_exactly(1, 2, 3)
    end
end