class Oystercard

attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize

    @balance = 0

  end 

  def top_up(number)
    exceed_max_balance?(number)
    @balance += number
  end 

  private

  def exceed_max_balance?(number)
    fail "Maximum balance of $#{MAXIMUM_BALANCE} exceeded" if @balance + number > MAXIMUM_BALANCE
  end

end
