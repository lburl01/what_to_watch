require 'csv'

output = CSV.foreach('uitem.csv', 'r:ISO-8859-1').map do |row|
  row.to_csv(:col_sep => ", ")
end
puts output[0][4..12] # put an integer here (movie id in first column) and will call only that line's data
