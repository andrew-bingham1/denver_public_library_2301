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

    it 'can authors with their books2' do 
      library = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({
        first_name: "Charlotte",
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      harper_lee = Author.new({
        first_name: "Harper",
        last_name: "Lee"})
      to_kill_a_mocking_bird = harper_lee.write("To Kill a Mockingbird", "July 11, 1960")

      library.add_author(charlotte_bronte)
      library.add_author(harper_lee)

      expect(library.books.last.title).to eq("To Kill a Mockingbird")
    end
  end

  describe '#publication_time_frame_for' do
    it 'can determine publication time frame' do 
      library = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({
        first_name: "Charlotte",
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      the_professor = charlotte_bronte.write("The Professor", "1857")
    
      expect(library.publication_time_frame_for(charlotte_bronte)[:start]).to eq("1847")
      expect(library.publication_time_frame_for(charlotte_bronte)[:end]).to eq("1857")
    end
  end

  describe '#checkout_book' do
    it 'can checkout books' do
      library = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({
        first_name: "Charlotte",
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      the_professor = charlotte_bronte.write("The Professor", "1857")
      
      library.add_author(charlotte_bronte)
      library.checkout(the_professor)

      expect(library.checked_out).to eq([the_professor])
    end
  end

  describe '#return_book' do
    it 'can return books' do
      library = Library.new("Denver Public Library")
      charlotte_bronte = Author.new({
        first_name: "Charlotte",
        last_name: "Bronte"
        })
      jane_eyre = charlotte_bronte.write("Jane Eyre", "October 16, 1847")
      villette = charlotte_bronte.write("Villette", "1853")
      the_professor = charlotte_bronte.write("The Professor", "1857")
      
      library.add_author(charlotte_bronte)
      library.checkout(the_professor)
      library.return(the_professor)

      expect(library.checked_out).to eq([])
    end
  end

end
