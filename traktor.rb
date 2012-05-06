require "nokogiri"

collection = Nokogiri::XML(File.open("./COLLECTION.nml"))

x = collection.xpath("//COLLECTION//ENTRY")

puts x.size

artists = []

x.each do |y|
	artist = y['ARTIST']
	artists << artist
end

artists = artists.compact

artists = artists.map { |x| x.downcase }

artists = artists.sort.uniq

artists = artists.map { |x| x.gsub("*bonus*","").strip.gsub(/\b('?[a-z])/) { $1.capitalize }.gsub("Dj ","DJ ").gsub("And ", "& ").gsub("Featuring", "Feat").gsub("Ft.","Feat.").gsub("Feat ","Feat.") }

artists = artists.sort.uniq


puts artists.size

artists.each do |a|
	puts a
end

#puts x.first['AUDIO_ID']

#entry = Nokogiri::Slop(x.first)

#puts entry.AUDIO_ID
