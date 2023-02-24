class Author
  attr_reader :name,
              :books

  def initialize(hash)
    @name = hash[:first_name] + ' ' + hash[:last_name]
    @books = []

  end

  def write(book_title, book_date)
   @books << Book.new({
      author_first_name: (@name.split(' ').first),
      author_last_name: (@name.split(' ').last),
      title: book_title,
      publication_date: book_date
      })

    @books.last
  end
end


