require 'csv'
require_relative 'user'
require_relative 'movie'

class Rating

  attr_reader :user_id, :item_id, :rating, :timestamp

  def initialize(movie_id, rating)
    #@user_id = user_id
    @item_id = movie_id
    @rating = rating
  end

  def average_ratings(movie_id, rating)
    # get all ratings based on movie id
    # add all those rating together
    # divide by number of total ratings
    
  end

  def rating_per_user
    ratings = []
    CSV.foreach('uitem.csv', 'r:ISO-8859-1') {|row| ratings << row[0]}
    ratings = ratings[2].split('|')
    ratings[1]
  end
end
