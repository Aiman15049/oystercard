class Oystercard

attr_reader :balance

  MAXIMUM_BALANCE = 90

  def initialize

    @balance = 0
    @in_journey = false

  end 

  def touch_in
    @in_journey = true
  end 


  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey
  end 

  def touch_out
    @in_journey = false
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
