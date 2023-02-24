class Library
  attr_reader :name,
              :books,
              :authors,
              :checked_out

  def initialize(name)
    @name = name
    @books = []
    @authors = []
    @checked_out = []
  end

  def add_author(author)
    author.books.each do |book|
      @books << book
    end
    @authors << author
  end

  def publication_time_frame_for(author)
    publication_hash = {} 
    books_arr = []
      author.books.each do |book|
      books_arr << book.publication_year.to_i
      end
    sorted_books_arr = books_arr.sort
    publication_hash[:start] = sorted_books_arr.first.to_s
    publication_hash[:end] = sorted_books_arr.last.to_s
    publication_hash
  end

  def checkout(book)
    if books.include?(book) && book.checked_out == false
      book.checked_out = true
      checked_out << book 
    else 
      puts "Sorry, you cannot checkout that book"
    end
  end
end

