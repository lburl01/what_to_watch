require 'csv'
require_relative 'file_reading'
require 'set'

def get_user_input
  print ' > '
  input = gets.chomp
end

def get_seen_movie_ids(ratings_users_movie_ids, user_id)
  movies_seen_by_user = []
  ratings_users_movie_ids.each do |movie|
    if movie["user_id"] == user_id
      movies_seen_by_user << movie["movie_id"].to_i
    end
  end
  return movies_seen_by_user.sort
end

def get_common_movies(user_one_movies, user_two_movies)
  user_one_movies_set = Set.new(user_one_movies)
  user_two_movies_set = Set.new(user_two_movies)
  common_movies = user_one_movies_set & user_two_movies_set
  common_movies_arary = common_movies.to_a
  return common_movies_arary.sort
end

def main

  ratings_users_movie_ids = csv_to_array('udata.csv')
  movie_ids_titles = csv_to_array('uitem.csv')

  print "Give the first User ID number, please: "
  user_one = get_user_input
  user_one_movies = get_seen_movie_ids(ratings_users_movie_ids, user_one)

  print "Give the second User ID number, please: "
  user_two = get_user_input
  user_two_movies = get_seen_movie_ids(ratings_users_movie_ids, user_two)

  common_movies = get_common_movies(user_one_movies, user_two_movies)
  puts "Common movies seen by these users: #{common_movies}"

end

if __FILE__ == $PROGRAM_NAME
  main
end
