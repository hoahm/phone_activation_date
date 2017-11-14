require 'spec_helper'

describe MyCSV::Openner do
  let(:file_name) { __dir__ + '/../fixtures/phone_activation.csv' }

  describe '#initialize' do
    it { expect { MyCSV::Openner.new }.to raise_error(ArgumentError) }
    it { expect { MyCSV::Openner.new(file_name) }.not_to raise_error }
  end

  describe '#run' do
    before do
      @csv = MyCSV::Openner.new file_name
    end

    it { expect(@csv).to respond_to(:read) }
    it { expect { |b| @csv.read(&b) }.to yield_control }
  end
end
