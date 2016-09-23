# This data set consists of:
# 	* 100,000 ratings (1-5) from 943 users on 1682 movies.
# 	* Each user has rated at least 20 movies.
#         * Simple demographic info for the users (age, gender, occupation, zip)

require 'csv'
# require_relative 'user'
# require_relative 'rating'
# require_relative 'movie'
require_relative 'file_reading'

def find_movies_by_id(ratings_users_movie_ids, movie_id)
  # get all movies with correct id
  movies_by_id = []
  ratings_users_movie_ids.each do |movie|
    if movie["movie_id"] == movie_id
      movies_by_id << movie
    end
  end
  return movies_by_id
end

def find_movie_title(movie_ids_titles, input)
  # get all movies with correct id
  movie_title = {}
  movie_ids_titles.each do |movie|
    if movie["movie_id"] == input
      movie_title = movie
    end
  end
  return movie_title["movie_title"]
end

def movie_title_with_id(movie_id)
  find_movies_by_id(movie_id)
end

def get_user_input
  print ' > '
  input = gets.chomp
end

def want_to_keep_going?(user_input)
  if user_input == 5
    return true
  end
end

def main

  ratings_users_movie_ids = csv_to_array('udata.csv')
  movie_ids_titles = csv_to_array('uitem.csv')

  loop do
    puts "What would you like to do?"
    puts "(1) Find the average ratings for a movie by id"
    puts "(2) Find all ratings for a user by id"
    puts "(3) Find all ratings for a movie by id"
    puts "(4) Find the name of a movie by id"
    puts "(5) Exit"
    user_mode_choice = get_user_input.to_i

      if user_mode_choice == 4
        input = get_user_input
        movie_title = find_movie_title(movie_ids_titles, input)
        puts "That movie's title is: #{movie_title}"
      elsif want_to_keep_going?(user_mode_choice)
        puts "See you next time!"
        exit
      else
        puts "You can't do that! Try entering a number between 1 and 5."
      end

  end

# movie_id, user_id
#   average_movie_rating = Movie.get_average_rating
#
# # user_id, rating
#   all_ratings_for_user = Rating.get_all_ratings_per_users
#
# # movie_id, rating
#   all_ratings_for_movie = Rating.get_all_ratings_per_movie
end

if __FILE__ == $PROGRAM_NAME
  main
end
