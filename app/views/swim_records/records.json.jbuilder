json.array!(@records) do |s_records|
  json.extract! s_records, :id
  json.extract! s_records, :check_in
  json.extract! s_records, :check_in_user_id
  json.extract! s_records, :check_in_first_name
  json.extract! s_records, :check_in_last_name
  json.extract! s_records, :check_out
  json.extract! s_records, :check_out_user_id
  json.extract! s_records, :check_out_first_name
  json.extract! s_records, :check_out_last_name
  json.extract! s_records, :completed
  json.extract! s_records, :swimmer_id

  json.swimmer do
    json.id s_records.swimmer.id
    json.first_name s_records.swimmer.first_name
    json.middle_initial s_records.swimmer.middle_initial
    json.last_name s_records.swimmer.last_name
    json.usms_number s_records.swimmer.usms_number
    json.lmsc s_records.swimmer.lmsc
    json.phone_number s_records.swimmer.phone_number
  end
end
