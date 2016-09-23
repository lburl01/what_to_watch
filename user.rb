require 'csv'
require_relative 'rating'
require_relative 'movie'
require_relative 'file_reading'

all_ratings = csv_to_array('udata.csv')
all_users = csv_to_array('uuser.csv')

class User

  attr_reader :user_id, :age, :gender, :occupation, :zip_code

  def initialize(user_id)
    @user_id = user_id
    @age = age
    @gender = gender
    @occupation = occupation
    @zip_code = zip_code
  end

  def print_5_lines

  end
end

new_user = User.new(61)
new_user.print_5_lines
