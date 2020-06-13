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
    json.account_id swim_record.swimmer.account_id
    json.email swim_record.swimmer.email
    json.date_of_birth swim_record.swimmer.date_of_birth
    json.emergency_first swim_record.swimmer.emergency_first
    json.emergency_last swim_record.swimmer.emergency_last
    json.emergency_phone swim_record.swimmer.emergency_phone
  end
end
