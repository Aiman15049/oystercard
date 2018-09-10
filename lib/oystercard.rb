class Oystercard

attr_reader :balance


  def initialize

    @balance = 0

  end 

  def topup(number)
    @balance += number
  end 


end
