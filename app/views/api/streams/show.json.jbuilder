json.stream do
  json.id  @stream.id
  json.name @stream.name

  json.user_id @stream.user ? @stream.user.id : nil
end
