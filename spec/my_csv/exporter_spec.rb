require 'spec_helper'

describe MyCSV::Exporter do
  let(:file_name) { __dir__ + '/../tmp/export.csv' }
  let(:headers) { %w(PHONE_NUMBER REAL_ACTIVATION_DATE) }

  describe '#initialize' do
    it { expect { MyCSV::Exporter.new }.to raise_error(ArgumentError) }
    it { expect { MyCSV::Exporter.new(file_name) }.not_to raise_error }
    it { expect { MyCSV::Exporter.new(file_name, headers) }.not_to raise_error }
  end

  describe '#run' do
    before do
      @exporter = MyCSV::Exporter.new(file_name, headers)
    end

    it { expect(@exporter).to respond_to(:run) }
    it { expect { |b| @exporter.run(&b) }.to yield_control }
    it { expect(File).to exist(file_name) }
  end
end
