json.array!(@swimmers) do |swimmer|
  json.extract! swimmer, :id, :first_name, :middle_initial, :last_name,
    :phone_number, :usms_number, :lmsc, :phone_added, :in_state
  json.url swimmer_url(swimmer, format: :json)
end
