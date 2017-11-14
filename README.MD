Find the actual activation date of phone number.

# How to run

## Run in shell

    chmod +x ./extract_phone_activation.sh
    ./extract_phone_activation.sh <input> <output>
    # ./extract_phone_activation.sh ./spec/fixtures/phone_activation.csv ./output.csv

## Ruby

    require './phone_activation'
    input = 'input.csv'
    output = 'output.csv'
    PhoneActivation.new(input, output).run

# Development    

Run test

    bundle exec rspec

Check Ruby style

    bundle exec rubocop
