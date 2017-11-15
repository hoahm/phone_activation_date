require './phone_activation'
require './helpers'

print_memory_usage do
  print_time_spent do
    input = ARGV[0]
    output = ARGV[1]
    PhoneActivation.new(input, output).run
  end
end
