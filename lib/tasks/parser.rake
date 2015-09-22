namespace :data do
	task :parser => :environment do 
		require 'open-uri'
		doc = Nokogiri::HTML(open('https://itunes.apple.com/us/rss/topsongs/limit=10/xml'))
		artists = []
		
		doc.xpath("//title").each do |i| 
			artists << i.text.split("- ")[1]
		end
		
		artists.compact!
		artists.map! { |i| i.mb_chars.normalize(:kd).gsub(/[^\x00-\x7F]/n,'').downcase.to_s.gsub(/[^A-Za-z,\s]/, "").gsub(" ", "-") }
	
		artists.each do |i|
			url_ids = "http://api.deezer.com/artist/#{i}"
			res_ids = open(url_ids)	
			doc_ids = JSON.parse(res_ids.read)

			top_url = "http://api.deezer.com/artist/#{doc_ids['id']}/top"
			top_res = open(top_url)
			doc_top = JSON.parse(top_res.read)
			
			newmusic = TopMusic.new
			if doc_top['data'].first.nil? == false
				newmusic.name = doc_top['data'].first['contributors'].first['name']
				newmusic.title = doc_top['data'].first['title']
				newmusic.picture = doc_top['data'].first['contributors'].first['picture_medium']
				newmusic.save
			end
		end
	end
end

