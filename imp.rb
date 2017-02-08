require 'nokogiri'
require 'rails'
require 'csv'

data_result = CSV.read("text.csv")

data_result.each do |row|
  crosses = []
  (0..1).each do |t|
    brand = t.row[1]
    html_doc = Nokogiri::HTML(row[t])
    table_rows = html_doc.search('tbody tr')
    make_name = table_rows[0].blank? ? '' : table_rows[0].text
    oem = table_rows[1].blank? ? '' : table_rows[1].text
    crosses << [ make_name, oem, brand] # массив вида ["Производитель", "Номер"]
  end

  puts crosses

end
