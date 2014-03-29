json.array!(@swim_records) do |swim_record|
  json.extract! swim_record, :id, :check_in, :check_out, :completed
  json.extract! swim_record.swimmer, :id, :first_name, :last_name, :lmsc
  json.url swim_record_url(swim_record, format: :json)
end
