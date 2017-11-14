require 'spec_helper'

describe ActivationDate do
  let(:data) do
    [
      { activation_date: Date.new(2016, 3, 1), deactivation_date: Date.new(2016, 5, 1) },
      { activation_date: Date.new(2016, 1, 1), deactivation_date: Date.new(2016, 3, 1) },
      { activation_date: Date.new(2016, 12, 1), deactivation_date: nil },
      { activation_date: Date.new(2016, 9, 1), deactivation_date: Date.new(2016, 12, 1) },
      { activation_date: Date.new(2016, 6, 1), deactivation_date: Date.new(2016, 9, 1) }
    ]
  end

  let(:service) { ActivationDate.new(data) }

  describe '#initialize' do
    it { expect { ActivationDate.new }.to raise_error(ArgumentError) }
    it { expect { ActivationDate.new(data) }.not_to raise_error }
  end

  describe '#find' do
    it { expect(service.find).to eq(Date.new(2016, 6, 1)) }
    it { expect(service.find).to be_a(Date) }
  end

  describe '#length' do
    it { expect(service.send(:length)).to be_a(Integer) }
    it { expect(service.send(:length)).to eq(data.count) }
  end

  describe '#date_diff' do
    it { expect { service.send(:date_diff) }.to raise_error }

    context 'true' do
      [
        Date.new(2016, 4, 1), Date.new(2016, 3, 31)
      ].each do |valid_date|
        it { expect(service.send(:date_diff, Date.new(2016, 5, 1), valid_date)).to be_truthy }
      end
    end

    context 'false' do
      [
        Date.new(2016, 4, 30), Date.new(2016, 4, 2), Date.new(2016, 5, 2), Date.new(2016, 6, 1)
      ].each do |invalid_date|
        it { expect(service.send(:date_diff, Date.new(2016, 5, 1), invalid_date)).to be_falsy }
      end
    end
  end
end
