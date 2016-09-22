require 'csv'
require_relative 'rating'
require_relative 'movie'

class User

  attr_reader :user_id, :age, :gender, :occupation, :zip_code

  def initialize(user_id)
    @user_id = user_id
  end
end
