json.array!(@tests) do |test|
  json.extract! test, :name, :description, :type, :difficulty, :random
  json.url test_url(test, format: :json)
end
