require_relative './parser.rb'
require 'nokogiri'
require 'open-uri'
require 'HTTParty'
require 'pry'

class Scrapper 
  attr_reader :url, :make, :model

  def initialize(make, model)
    @make = make.capitalize
    @model = model.capitalize
    @url = "https://www.dupontregistry.com/autos/results/#{make}/#{model}/for-sale".sub(" ", "--")
  end

  def parse_url(url)
    unparsed_page = HTTParty.get(url)
    Nokogiri::HTML(unparsed_page)
  end

  def scrap
    parsed_page = parse_url(@url)
    cars = parsed_page.css('div.searchResults')
    binding.pry
  end

  binding.pry
  0
end

# cars.css('.cost').children[0].text.strip
# cars.css('a').children[0].text[0..4].strip.to_i