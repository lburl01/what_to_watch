require 'csv'

  def csv_to_array(filename)
      csv = CSV::parse(File.open(filename, 'r:ISO-8859-1') {|f| f.read })
      fields = csv.shift
      fields = fields.map {|f| f.downcase.gsub(" ", "_")}
      variable = csv.collect { |record| Hash[*fields.zip(record).flatten ] }
      puts variable[25..28]
  end

  csv_to_array('data.csv')
