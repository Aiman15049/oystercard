require 'oystercard'

RSpec.describe Oystercard do
  context 'default state' do
    it 'should have default balance of zero' do
      expect(subject.balance).to eq 0
    end
  end

  context 'top up' do
    it 'should top up' do
      expect { subject.top_up(1) }.to change { subject.balance }.from(0).to(1)
    end

    it 'should raise an error when maximum balance exceeded during topup' do
      expect { subject.top_up(100) }.to raise_error(
        "Maximum balance of $#{Oystercard::MAXIMUM_BALANCE} exceeded"
      )
    end
  end

  context 'deduct' do
    it 'should deduct money from the card' do
      subject.top_up(1)
      expect { subject.deduct(1) }.to change { subject.balance }.from(1).to(0)
    end
  end

  context 'Journey' do
    it 'should default to not being in a journey' do
      expect(subject).not_to be_in_journey
    end

    it 'should be in a journey after touch in' do
      subject.touch_in
      expect(subject).to be_in_journey
    end

    it 'should not be in a journey after touch out' do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
