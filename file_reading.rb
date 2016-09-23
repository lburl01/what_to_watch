require 'csv'

def csv_to_array(filename)
    csv = CSV::parse(File.open(filename, 'r:ISO-8859-1') {|line| line.read })
    fields = csv.shift
    fields = fields.map {|f| f.downcase.gsub(" ", "_")}
    records = csv.collect { |record| Hash[*fields.zip(record).flatten ] }
    return records
end
