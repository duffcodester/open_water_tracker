json.array!(@swimmer) do |data|
  # json.extract! swim_record, :id
  # json.extract! swim_record, :check_in
  # json.extract! swim_record, :check_in_user_id
  # json.extract! swim_record, :check_in_first_name
  # json.extract! swim_record, :check_in_last_name
  # json.extract! swim_record, :check_out
  # json.extract! swim_record, :check_out_user_id
  # json.extract! swim_record, :check_out_first_name
  # json.extract! swim_record, :check_out_last_name
  # json.extract! swim_record, :completed
  # json.extract! swim_record, :swimmer_id

  json.swimmer do
    json.id data.swimmer.id
    json.first_name data.swimmer.first_name
    json.mi data.swimmer.mi
    json.last_name data.swimmer.last_name
  end
end
