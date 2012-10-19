require "nokogiri"

collection = Nokogiri::XML(File.open("./COLLECTION.nml"))
collection = collection.xpath("//COLLECTION//ENTRY")

artists = []

collection.each do |row|
	artist = row['ARTIST']
	artists << artist
end

#attempt to remove duplicates and put in some logical order
artists = artists.compact
artists = artists.map { |artist| artist.downcase } 
artists = artists.sort.uniq
artists = artists.map { |artist| artist.gsub("*bonus*","").strip.gsub(/\b('?[a-z])/) { $1.capitalize }.gsub("Dj ","DJ ").gsub("And ", "& ").gsub("Featuring", "Feat").gsub("Ft.","Feat.").gsub("Feat ","Feat.") }
artists = artists.sort.uniq

artists.map {|artist| puts artist}
