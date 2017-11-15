require './phone_activation'
require 'benchmark'

puts Benchmark.measure {
  input = ARGV[0]
  output = ARGV[1]
  PhoneActivation.new(input, output).run
}
