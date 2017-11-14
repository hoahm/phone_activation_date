require 'csv'

module MyCSV
  class Openner
    #
    # @param [String] file_name
    #
    def initialize(file_name)
      @file_name = file_name
    end

    def read
      CSV.foreach(file_name, headers: true) do |row|
        yield(row)
      end
    end

    private

    attr_reader :file_name
  end
end
