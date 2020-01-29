class Transaction
  attr_reader :credit_amount, :debit_amount, :balance, :date
  
  def initialize(credit_amount, debit_amount, balance)
    @credit_amount = credit_amount
    @debit_amount = debit_amount
    @balance = balance
    @date = Time.now.strftime "%d/%m/%Y"
  end

  def print
    "#{date} || #{credit} || #{debit} || #{"%.2f" % balance}"
  end

  private

  def credit
    deposit(credit_amount)
  end

  def debit
    withraw(debit_amount)
  end

  def deposit(amount)
    amount == "" ? "" : "#{"%.2f" % amount}"
  end

  def withraw(amount)
    amount == "" ? "" : "#{"%.2f" % amount}"
  end
end
