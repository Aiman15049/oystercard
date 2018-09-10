require 'oystercard'

RSpec.describe Oystercard do
  
  it "should have default balance of zero" do
    expect(subject.balance).to eq 0
  end 

  it "should top up" do
    expect{subject.topup(1)}.to change{subject.balance}.from(0).to(1)
  end 
end