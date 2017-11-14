require 'spec_helper'

describe PhoneActivation do
  let(:input) { __dir__ + '/fixtures/phone_activation.csv' }
  let(:output) { __dir__ + '/tmp/export.csv' }
  let(:service) { PhoneActivation.new(input, output) }

  describe '#initialize' do
    it { expect { PhoneActivation.new }.to raise_error(ArgumentError) }
    it { expect { PhoneActivation.new(input, output) }.not_to raise_error }
  end

  describe '#run' do
    it 'export to CSV file' do
      service.run
      expect(File.file?(output)).to be_truthy
    end
  end
end
