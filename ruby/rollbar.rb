Rollbar.configure do |config|
  config.access_token = ENV.fetch('ROLLBAR_ACCESS_TOKEN')
  config.enabled = false if %w(development test).include?(Rails.env)
  config.environment = ENV.fetch('ROLLBAR_ENV', Rails.env)
  config.exception_level_filters.merge!(
    'ActiveRecord::RecordNotFound' => 'ignore',
    'ActionController::RoutingError' => 'ignore',
    'ActionController::UnknownFormat' => 'ignore'
  )
end
