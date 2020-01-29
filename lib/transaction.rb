class Transaction
  attr_reader :credit_amount, :debit_amount, :balance, :date
  
  def initialize(credit_amount, debit_amount, balance)
    @credit_amount = credit_amount
    @debit_amount = debit_amount
    @balance = balance
    @date = Time.now.strftime "%d/%m/%Y"
  end

  def print
    "#{date} || #{credit(credit_amount)} || #{debit(debit_amount)} || #{"%.2f" % balance}"
  end

  private

  def credit(amount)
    amount == "" ? "" : "#{"%.2f" % amount}"
  end

  def debit(amount)
    amount == "" ? "" : "#{"%.2f" % amount}"
  end
end
