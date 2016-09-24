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

def euclidean_distance(user_one_movies, user_two_movies)
  # Given two lists, give the Euclidean distance between them on a scale of 0 to 1.
  # 1 means the two lists are identical.

  # Guard against empty arrays.
  return 0 if user_one_movies.length == 0

  # Note that this is the same as vector subtraction. (whatever that means -LB)
  differences = 0.upto(user_one_movies.length - 1).map { |i| user_one_movies[i] - user_two_movies[i] }
  squares = differences.map { |diff| diff ** 2 }
  sum_of_squares = squares.reduce { |total, square| total + square }

  euclidian_number = (1 / (1 + Math.sqrt(sum_of_squares))).round(5)

  return euclidian_number
end

def want_to_keep_going?(user_input)
  if user_input == "N"
    return true
  end
end

def main

  ratings_users_movie_ids = csv_to_array('udata.csv')
  movie_ids_titles = csv_to_array('uitem.csv')

  loop do

    print "Give the first User ID number, please: "
    user_one = get_user_input
    user_one_movies = get_seen_movie_ids(ratings_users_movie_ids, user_one)

    print "Give the second User ID number, please: "
    user_two = get_user_input
    user_two_movies = get_seen_movie_ids(ratings_users_movie_ids, user_two)

    common_movies = get_common_movies(user_one_movies, user_two_movies)
    puts "Common movies seen by these users: #{common_movies}"

    movie_similarity = euclidean_distance(user_one_movies, user_two_movies)
    if movie_similarity == 0
    puts "#{movie_similarity}"

    if movie_similarity <= 0.5
      puts "These users are not very similar at all!  Their Euclidian Distance is #{movie_similarity} where 1 is very similar and 0 is not similar at all."
    else
      puts "These users are quite similar!  Their Euclidian Distance is #{movie_similarity} where 1 is very similar and 0 is not similar at all."
    end

    print "Would you like to try 2 more users? (Y) or (N)"
    keep_going = get_user_input.upcase
    if want_to_keep_going?(keep_going)
      puts "See you next time!"
      exit
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  main
end
