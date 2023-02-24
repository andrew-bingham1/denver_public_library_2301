class Author
  attr_reader :name,
              :books

  def initialize(hash)
    @name = hash[:first_name] + ' ' + hash[:last_name]
    @books = []

  end

  def
end
