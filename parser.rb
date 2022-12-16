require 'open-uri'
require 'nokogiri'
require 'json'
require 'csv'

URL = 'https://stylus.ua/uk/smartfony/'
HTML = URI.open(URL)
DOC = Nokogiri::HTML(HTML)



