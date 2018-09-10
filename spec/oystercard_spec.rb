require 'oystercard'

RSpec.describe Oystercard do
  
  it "should have default balance of zero" do
    expect(subject.balance).to eq 0
  end 

  describe 'top up' do

    it "should top up" do
      expect{subject.top_up(1)}.to change{subject.balance}.from(0).to(1)
    end 

    it 'should raise an error when maximum balance exceeded during topup' do
      expect { subject.top_up(100) }.to raise_error("Maximum balance of $#{Oystercard::MAXIMUM_BALANCE} exceeded")
    end

  end

  describe 'deduct' do
    it 'should deduct money from the card' do
      subject.top_up(1)
      expect { subject.deduct(1) }.to change{ subject.balance }.from(1).to(0)
    end

end


end