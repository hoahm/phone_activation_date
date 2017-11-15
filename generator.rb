require './my_csv/exporter.rb'
require 'date'

class Generator
  def initialize(total_record, file_name = nil)
    @total_record = total_record
    @file_name = file_name || (__dir__ + '/input.csv')
  end

  def run
    exporter.run do |csv_obj|
      i = 0
      while i < total_record
        csv_obj << [ phone, activation_date, deactivation_date ]

        i += 1
      end
    end
  end

  private

  attr_reader :total_record, :file_name

  def headers
    %w(PHONE_NUMBER ACTIVATION_DATE DEACTIVATION_DATE)
  end

  def exporter
    @exporter ||= MyCSV::Exporter.new(file_name, headers)
  end

  def phone
    '09%08d' % rand(8 ** 8)
  end

  def activation_date
    Date.today - rand(365)
  end

  def deactivation_date
    Date.today + rand(60)
  end
end
