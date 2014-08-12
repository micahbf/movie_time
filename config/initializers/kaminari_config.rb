Kaminari.configure do |config|
  config.default_per_page = 25
  config.max_per_page = 100
  config.window = 4
  config.outer_window = 2
end
