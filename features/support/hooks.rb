Before do |scenario|
  Rails.application.config.fake_location = {latitude: 58.00, longitude: 13.06}
end

Before '@stripe' do
  StripeMock.start
end

After '@stripe' do
  StripeMock.stop
end
