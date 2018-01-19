module ApplicationHelper
  def fake_location
    ({coords:Rails.application.config.fake_location.to_hash}).to_json
  end
end
