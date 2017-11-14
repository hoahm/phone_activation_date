require './phone_activation'

input = ARGV[0]
output = ARGV[1]
PhoneActivation.new(input, output).run
