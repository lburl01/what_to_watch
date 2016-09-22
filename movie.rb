require 'csv'

class Movie

  def find_movie_name_with_id
    output = []
    CSV.foreach('uitem.csv', 'r:ISO-8859-1') {|row| output << row[0]}
    movie_title = output[0].split('|')
    movie_title[1]
  end

end
