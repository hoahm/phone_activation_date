Dir[__dir__ + '/my_csv/**/*.rb'].each { |f| require f }
require './activation_date'

#
# Load list of records from CSV file
# Find the actual activation date of phone number
# Export to CSV file
#
# @example
#   PhoneActivation.new.run
#
# @example
#   input = './input.csv'
#   output = './output.csv'
#   PhoneActivation.new(input, outpt).run
#
class PhoneActivation
  #
  # @param [String] input
  # @param [String] output
  #
  def initialize(input, output)
    @input = input || (__dir__ + '/input.csv')
    @output = output || (__dir__ + '/output.csv')
    @my_array = {}
  end

  def run
    load_data
    execute
  rescue Errno::ENOENT => e
    puts e.message
  end

  private

  attr_reader :input, :output, :my_array

  def headers
    %w(PHONE_NUMBER REAL_ACTIVATION_DATE)
  end

  def openner
    @openner ||= MyCSV::Openner.new(input)
  end

  def exporter
    @exporter ||= MyCSV::Exporter.new(output, headers)
  end

  def to_date(string)
    Date.strptime(string, '%Y-%m-%d')
  rescue
    nil
  end

  def push_data(row)
    setter = row.to_hash

    phone = setter['PHONE_NUMBER']
    activation_date = to_date(setter['ACTIVATION_DATE'])
    deactivation_date = to_date(setter['DEACTIVATION_DATE'])

    my_array[phone] = [] if my_array[phone].nil?
    my_array[phone] << { activation_date: activation_date,
                         deactivation_date: deactivation_date }
  end

  def load_data
    openner.read do |row|
      push_data(row)
    end
  end

  def execute
    exporter.run do |csv_obj|
      my_array.each do |phone, data|
        activation_date = ActivationDate.new(data).find
        csv_obj << [phone, activation_date]
      end
    end
  end
end
