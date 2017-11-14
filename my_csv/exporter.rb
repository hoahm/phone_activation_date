require 'csv'
require 'fileutils'

module MyCSV
  class Exporter
    #
    # @param [String] file_name
    # @param [Array] headers
    #
    def initialize(file_name, headers = [])
      @file_name = file_name
      @headers = headers
    end

    def run
      ensure_dir

      CSV.open(file_name, 'w') do |csv_obj|
        csv_obj << headers if headers.any?
        if block_given?
          yield(csv_obj)
        else
          yield(self)
        end
      end
    end

    private

    attr_reader :file_name, :headers

    def dir_name
      File.dirname(file_name)
    end

    def ensure_dir
      return if File.directory?(dir_name)

      FileUtils.mkdir_p(dir_name)
    end
  end
end
