json.array!(@records) do |s_records|
  json.extract! s_records, :id
  json.extract! s_records.swimmer, :id, :first_name, :last_name, :lmsc
  json.extract! s_records, :check_in, :completed
end
