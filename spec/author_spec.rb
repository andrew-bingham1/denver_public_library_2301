require 'rspec'
require './lib/book'
require './lib/author'

RSpec.describe Author do 
  describe '#initialize' do
    it 'can initialize' do 
      charlotte_bronte = Author.new({
        first_name: "Charlotte",
        last_name: "Bronte"
        })

        expect(charlotte_bronte).to be_a Author
        expect(charlotte_bronte.name).to eq("Charlotte Bronte")
        expect(charlotte_bronte.books).to eq([])
    end
  end
end