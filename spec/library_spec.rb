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
end
