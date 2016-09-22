# require_relative '../main'
require_relative '../movie'
# require_relative '../rating'
# require_relative '../user'

describe 'movie.rb' do
  it 'puts movie title based on user input' do
    title = Movie.new()
  expect(title).to eq(title.find_movie_name_with_id)
  end
end
