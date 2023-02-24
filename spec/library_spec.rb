require 'rspec'
require './lib/book'
require './lib/author'
require './lib/library'

RSpec.describe Library do 
  describe '#initialize' do
    it 'can initialize' do 
      library = Library.new("Denver Public Library")

      expect(library).to be_a Library
      expect(library.name).to eq("Denver Public Library")
      expect(library.books).to eq([])
      expect(library.authors).to eq([])
    end
  end

  describe '#add_author' do
    it 'can add authors with their books' do
      library = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({
        first_name: "Charlotte",
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")

      library.add_author(charlotte_bronte)
      
      expect(library.books.first).to be_a Book
      expect(library.books.first).to eq(jane_eyre)
      expect(library.authors.first).to be_a Author
      expect(library.authors.first).to eq (charlotte_bronte)
    end

  end
end
