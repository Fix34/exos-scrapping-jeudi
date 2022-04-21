require 'rubygems'
require 'nokogiri'
require 'open-uri'

def array_currency_names

array_currency_names = []

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[2]').each do |currencies| array_currency_names << currencies.text
end
return array_currency_names
end

def array_currency_price

    array_currency_price = []

    page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

    page.xpath('//*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span').each do |price| array_currency_price << price.text
    end
    return array_currency_price
end

def hash_combined(array_currency_names,array_currency_price)
 puts  hash_crypto = Hash[array_currency_names.zip(array_currency_price)]
end

hash_combined(array_currency_names,array_currency_price)