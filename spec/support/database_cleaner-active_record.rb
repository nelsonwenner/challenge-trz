RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(
      :truncation,
      except: %w(ar_internal_metadata)
    )
    load "#{Rails.root}/db/seeds.rb" 
  end
end
