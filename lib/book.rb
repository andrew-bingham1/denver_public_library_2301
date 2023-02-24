class Book
  attr_reader :title,
              :author,
              :publication_year

  attr_accessor :checked_out

  def initialize(hash)
    @title = hash[:title]
    @author = "#{hash[:author_first_name]} #{hash[:author_last_name]}"
    @publication_year = hash[:publication_date].split(' ').last
    @checked_out = false
  end
end
