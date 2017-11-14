Dir['../**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.after(:all) do
    FileUtils.rm_rf(Dir[__dir__ + "/tmp/[^.]*"])
  end
end
