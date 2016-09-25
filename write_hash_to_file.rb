require 'csv'
require 'set'
require_relative 'file_reading'

ratings_users_movie_ids = csv_to_array('udata.csv')
movie_ids_titles = csv_to_array('uitem.csv')

def get_all_movie_ids(movie_ids_titles)
  all_movie_ids = []
  movie_ids_titles.each do |movie|
    all_movie_ids << movie["movie_id"]
  end
  return all_movie_ids # each item is a string
end

def find_ratings_and_movies(ratings_users_movie_ids, movie_id)
  ratings_by_movie_id = []
  ratings_users_movie_ids.each do |movie|
    if movie["movie_id"] == movie_id
      ratings_by_movie_id << movie["rating"].to_f
    end
  end
  return ratings_by_movie_id
end

def avg_ratings_per_movie(ratings_users_movie_ids, movie_id)
  ratings_by_movie_id = find_ratings_and_movies(ratings_users_movie_ids, movie_id)
  total_ratings = ratings_by_movie_id.count
  sum_of_ratings = ratings_by_movie_id.inject(:+)
  all_ratings_average = sum_of_ratings / total_ratings
  return all_ratings_average.round(2)
end

def find_top_movies(ratings_users_movie_ids, movie_ids_titles)
  all_movies_with_avg_rating = Hash.new
  all_movie_ids_array = get_all_movie_ids(movie_ids_titles)
  all_movie_ids_array.each do |id|
    avg_rating = avg_ratings_per_movie(ratings_users_movie_ids, id)
    all_movies_with_avg_rating[id] = avg_rating
  end
  return all_movies_with_avg_rating.sort_by{ |movie_id, avg_rating| -avg_rating }
end

all_movies_with_avg_rating = find_top_movies(ratings_users_movie_ids, movie_ids_titles)

File.open('movies_with_average_ratings.txt', 'w') do |f|
  all_movies_with_avg_rating.each do |movie_id, avg_rating|
    f.puts "#{movie_id}: #{avg_rating}"
  end
end
