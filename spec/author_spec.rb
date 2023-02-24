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

  describe '#write' do
    it 'can write books' do
      charlotte_bronte = Author.new({
        first_name: "Charlotte",
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")

      expect(jane_eyre.class).to be_a Book
      expect(jane_eyre.title).to eq("Jane Eyre")
    end
  end
end