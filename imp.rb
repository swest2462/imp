require 'nokogiri'
require 'rails'

data_result = [["US - 2280101";"Kg.";"<tbody> <tr> <th> AIRKRAFT </th> <td> 126013 </td> </tr> </tbody>";"<tbody> <tr> <th> </th> <td> A6393280101 </td> </tr> <tr> <th> </th> <td> 6393280101 </td> </tr> <tr> <th> </th> <td> CDI 2.2 ab 09/2003, 80-110 kW </td> </tr> <tr> <th> </th> <td> 109-111-115-119-122 CDI 2.2 </td> </tr> <tr> <th> </th> <td> 109-111-115 CDI 2.2 </td> </tr> <tr> <th> </th> <td> 119-122 CDI 3.2 </td> </tr> </tbody>";"http://www.usmerkaucuk.com/products/details/c/72";"US - 2280101.png"]]

data_result.each do |row|
  crosses = []
  (2..3).each do |t|
    html_doc = Nokogiri::HTML(row[t])
    table_rows = html_doc.search('tbody tr')
    make_name = table_rows[0].blank? ? '' : table_rows[0].text
    oem = table_rows[1].blank? ? '' : table_rows[1].text
    crosses << [ make_name, oem ] # массив вида ["Производитель", "Номер"]
  end

  puts crosses

end

data_result.each do |row|
  crosses = []
  (2..3).each do |t|
    html_doc = Nokogiri::HTML(row[t])
    table_rows = html_doc.search('tbody tr')
    make_name = table_rows[0].blank? ? '' : table_rows[0].text
    oem = table_rows[1].blank? ? '' : table_rows[1].text
    crosses << [ make_name, oem ] # массив вида ["Производитель", "Номер"]
  end

  puts crosses

end