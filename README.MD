Find the actual activation date of phone number.

# How to run

    require './phone_activation'
    input = 'input.csv'
    output = 'output.csv'
    PhoneActivation.new(input, output).run

# Development    

Run test

    bundle exec rspec

Check Ruby style

    bundle exec rubocop
