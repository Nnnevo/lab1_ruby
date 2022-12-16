require 'open-uri'
require 'nokogiri'
require 'json'
require 'csv'

URL = 'https://stylus.ua/uk/smartfony/'
HTML = URI.open(URL)
DOC = Nokogiri::HTML(HTML)



smart_list=DOC.css("#p-list-category-products > div.products-listing.grid").css('.products-listing-item').slice(0,10)

json_list=[]
csv_list=[['brand','category','id','name','price']]



smart_list.each do |obj| 
    data_hash=JSON.parse(obj['data-ec']).sort.to_h
    json_list.push(data_hash)
    csv_list.push(data_hash.values)
end



File.write('smartphones.csv',csv_list.map(&:to_csv).join)
File.write('smartphones.json',JSON.dump(json_list))