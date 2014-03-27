json.array!(@analytics) do |analytic|
  json.extract! analytic, :id
  json.url analytic_url(analytic, format: :json)
end
