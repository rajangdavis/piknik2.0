json.streams @streams do |stream|
 json.id     stream.id
 json.name   stream.name
 json.url	 stream.url

 json.user_id stream.user ? stream.user.id : nil
end

