json.array!(@swim_records) do |swim_record|
  json.extract! swim_record, :id
  json.url swim_record_url(swim_record, format: :json)
end
