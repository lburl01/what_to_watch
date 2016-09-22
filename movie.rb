require 'csv'
require_relative 'user'
require_relative 'rating'

class Movie
attr_reader :movie_id, :movie_title

  def initialize(movie_id)
    @movie_id = movie_id
    @movie_title = movie_title
  end

  def get_user_input_of_id
    user_input = gets.chomp.to_i
  end

  def find_movie_name_with_id
    output = []
    CSV.foreach('uitem.csv', 'r:ISO-8859-1') {|row| output << row[0]}
    movie_title = output[0].split('|')
    movie_title[1]
  end

end
