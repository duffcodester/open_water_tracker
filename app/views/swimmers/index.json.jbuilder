json.array!(@swimmers) do |swimmer|
  json.extract! swimmer, :id
  json.extract! swimmer, :first_name
  json.extract! swimmer, :mi
  json.extract! swimmer, :last_name
  json.extract! swimmer, :usms_number
  json.extract! swimmer, :ilmscd
end
