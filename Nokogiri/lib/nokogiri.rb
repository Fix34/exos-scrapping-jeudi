require 'rubygems'
require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(open("http://ruby.bastardsbook.com/files/hello-webpage.html"))
puts page.css('/html/body/div[1]/div/div[1]/div[1]/div[2]/nav[2]/div/ul/li[1]/a/span').each do |el|
    puts el.text
end
