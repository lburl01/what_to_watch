require 'csv'
require_relative 'user'
require_relative 'rating'
require_relative 'file_reading'

movie_ids_titles = csv_to_array('uitem.csv')
ratings_users_movie_ids = csv_to_array('udata.csv')

# this class is an object that contains all movies by id and their associated data
class Movie
attr_reader :movie_ids, :movie_titles, :movie_ids_titles, :ratings_users_movie_ids

  def initialize(movie_id, )
    @movie_id = movie_id
    @movie_title = movie_title
    @movie_ids_titles = movie_ids_titles
    @ratings_users_movie_ids = ratings_users_movie_ids
  end

  def find_movies_by_id(movie_id)
    # get all movies with correct id
    movies_by_id = []
    @ratings_users_movie_ids.each do |movie|
      if movie["movie_id"] == @movie_id
        movies_by_id << movie
      end
    end
    return movies_by_id
  end

  def find_movie_title(input)
    # get all movies with correct id
    movie_title = []
    @movie_ids_titles.each do |movie|
      if movie["movie_id"] == user_input
        movie_title << movie
      end
    end
    return movie_title[0]["movie_title"]
  end

end
