class Oystercard

attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize

    @balance = 0

  end 

  def deduct(amount)
    @balance -= amount
  end

  def top_up(amount)
    exceed_max_balance?(amount)
    @balance += amount
  end 

  private

  def exceed_max_balance?(amount)
    fail "Maximum balance of $#{MAXIMUM_BALANCE} exceeded" if @balance + amount > MAXIMUM_BALANCE
  end

end
