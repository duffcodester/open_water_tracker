json.array!(@swim_records) do |swim_record|
  json.extract! swim_record, :id
  json.extract! swim_record, :check_in
  json.extract! swim_record, :check_in_user_id
  json.extract! swim_record, :check_in_first_name
  json.extract! swim_record, :check_in_last_name
  json.extract! swim_record, :check_out
  json.extract! swim_record, :check_out_user_id
  json.extract! swim_record, :check_out_first_name
  json.extract! swim_record, :check_out_last_name
  json.extract! swim_record, :completed
  json.extract! swim_record, :swimmer_id

  json.swimmer do
    json.id swim_record.swimmer.id
    json.first_name swim_record.swimmer.first_name
    json.mi swim_record.swimmer.mi
    json.last_name swim_record.swimmer.last_name
    json.phone_number swim_record.swimmer.phone_number
    json.usms_number swim_record.swimmer.usms_number
    json.lmsc swim_record.swimmer.lmsc
    json.swimmer_checked_in swim_record.swimmer.swimmer_checked_in
  end
end
