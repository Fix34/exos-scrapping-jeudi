require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'

def townhall_email
array_city_email = []
#pour choper les url de chaque mairie mettre une variable à la place du nom de la ville qui permettra de choper l'ensemble et pas une seule (peut être avec loop?)

page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/95/ableiges.html"))
element = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |cities| array_city_email << cities.text
end
return array_city_email
end

puts townhall_email

#Liste les url de chaque mairie dans un tableau puis aller chercher pour chaque mairie l'email correspondant

def townhall_links

    array__townhall_url = []
    main_page = "http://www.annuaire-des-mairies.com/"

    page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath('//a[@class="lientxt"]/@href').each do |href| array__townhall_url << main_page + href.content[2..-1]
    end
    return array__townhall_url
end

puts townhall_links

#Get the names of each cities

def townhall_names
    array_townhall_names = []
    page = Nokogiri::HTML(URI.open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath('//*[@class="lientxt"]').each do |names| array_townhall_names << names.text
    end
    return array_townhall_names
end

puts townhall_names

def townhall_email_all

array_all_email = []
townhall_links.each do |url| 
    page = Nokogiri::HTML(URI.open(url))
    page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |email| array_all_email << email.text
    end
end
return array_all_email
end

puts townhall_email_all

def hash_combined_mail_city(townhall_names, townhall_email_all)
    
    puts hash_townhall = Hash[array_townhall_names.zip(array_all_email)]
end

puts hash_combined_mail_city(townhall_names,townhall_email_all)

