json.array!(@report_cards) do |report_card|
  json.extract! report_card, :test_id, :user_id, :grade, :name, :finished, :current_question
  json.url report_card_url(report_card, format: :json)
end
