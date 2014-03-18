json.array!(@swimmers) do |swimmer|
  json.extract! swimmer, :id, :first_name, :last_name, :usms_number, :lmsc
  json.url swimmer_url(swimmer, format: :json)
end
