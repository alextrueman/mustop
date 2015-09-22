json.array!(@top_musics) do |top_music|
  json.extract! top_music, :id, :name, :picture, :title
  json.url top_music_url(top_music, format: :json)
end
