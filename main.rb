
require 'csv'
require 'set'
require_relative 'file_reading'

def find_movies_by_id(ratings_users_movie_ids, movie_id)
  movies_by_id = []
  ratings_users_movie_ids.each do |movie|
    if movie["movie_id"] == movie_id
      movies_by_id << movie
    end
  end
  return movies_by_id
end

def find_movie_title(movie_ids_titles, input)
  movie_title = {}
  movie_ids_titles.each do |movie|
    if movie["movie_id"] == input
      movie_title = movie
    end
  end
  return movie_title["movie_title"]
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

def find_top_movies(ratings_users_movie_ids, movie_ids_titles)
  all_movies_with_avg_rating = Hash.new
  all_movie_ids_array = get_all_movie_ids(movie_ids_titles)
  all_movie_ids_array.each do |id|
    avg_rating = avg_ratings_per_movie(ratings_users_movie_ids, id)
    all_movies_with_avg_rating[id] = avg_rating
  end
  return all_movies_with_avg_rating
end

def avg_ratings_per_movie(ratings_users_movie_ids, movie_id)
  ratings_by_movie_id = find_ratings_and_movies(ratings_users_movie_ids, movie_id)
  total_ratings = ratings_by_movie_id.count
  sum_of_ratings = ratings_by_movie_id.inject(:+)
  all_ratings_average = sum_of_ratings / total_ratings
  return all_ratings_average.round(2)
end

def find_ratings_per_user(ratings_users_movie_ids, user_id)
  ratings_for_user = []
  ratings_users_movie_ids.each do |movie|
    if movie["user_id"] == user_id
      ratings_for_user << movie["rating"].to_f
    end
  end
  return ratings_for_user
end

def get_all_movie_ids(movie_ids_titles)
  all_movie_ids = []
  movie_ids_titles.each do |movie|
    all_movie_ids << movie["movie_id"]
  end
  return all_movie_ids # each item is a string
end

def get_top_movies(all_movies_with_avg_rating)
  all_movies_with_avg_rating
  # num_of_movies = input.to_i - 1
  # movie_range =
end

def get_user_input
  print ' > '
  input = gets.chomp
end

def want_to_keep_going?(user_input)
  if user_input == 6
    return true
  end
end

def main

  ratings_users_movie_ids = csv_to_array('udata.csv')
  movie_ids_titles = csv_to_array('uitem.csv')
  all_movies_with_avg_rating = find_top_movies(ratings_users_movie_ids, movie_ids_titles)

  loop do
    puts " "
    puts "What would you like to do?"
    puts "(1) Find the average ratings for a movie by id"
    puts "(2) Find all ratings for a user by id"
    puts "(3) Find all ratings for a movie by id"
    puts "(4) Find the name of a movie by id"
    puts "(5) Get the top movies by rating"
    puts "(6) Exit"
    user_mode_choice = get_user_input.to_i

      if user_mode_choice == 1
        puts "Enter the Movie ID of your choice: "
        input = get_user_input
        averaged_ratings = avg_ratings_per_movie(ratings_users_movie_ids, input)
        puts "Average of all ratings for the movie: #{averaged_ratings}"

      elsif user_mode_choice == 2
        puts "Enter the User ID of your choice: "
        input = get_user_input
        ratings_by_user_id = find_ratings_per_user(ratings_users_movie_ids, input)
        puts "The user has left these ratings: #{ratings_by_user_id}"

      elsif user_mode_choice == 3
        puts "Enter the Movie ID of your choice: "
        input = get_user_input
        movie_title = find_movie_title(movie_ids_titles, input)
        ratings_per_movie = find_ratings_and_movies(ratings_users_movie_ids, input)
        puts "All ratings for your movie #{movie_title}: #{ratings_per_movie}"

      elsif user_mode_choice == 4
        puts "Enter the Movie ID of your choice: "
        input = get_user_input
        movie_title = find_movie_title(movie_ids_titles, input)
        puts "That movie's title is: #{movie_title}"

      elsif user_mode_choice == 5
        puts "The number of movies you'd like to see: "
        input = get_user_input
        top_movies = get_top_movies(input)
        puts "Movies and their avg rating: #{top_movies}"

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
