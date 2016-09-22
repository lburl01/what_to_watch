# require_relative '../main'
require_relative '../movie'
# require_relative '../rating'
# require_relative '../user'

describe 'movie.rb' do
  before do
    @pedro = Movie.new(1)
  end

  it 'initialize a new movie class object' do
    expect(@pedro.movie_id).to eq(1)
  end

  it 'returns title when given movie id' do
    expect(@pedro.movie_title).to eq("Title")
  end
end

describe 'rating.rb' do

  it 'averages ratings for one movie' do
    movie1 = Movie.new(1)
    expect()to eq()
  end

end
