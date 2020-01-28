require_relative 'statement'
require_relative 'transaction'

class Account
  attr_reader :balance
  
  def initialize(statement = Statement.new)
    @statement = statement
    @balance = 0
  end

  def credit(amount)
    @balance += amount
    new_transaction(amount, nil)
  end

  def debit(amount)
    @balance -= amount
    new_transaction(nil, -amount)
  end

  def statement
    @statement.history
  end

  private

  def new_transaction(credit = nil, debit = nil)
    transaction = Transaction.new(credit, debit, balance)
    statement.push(transaction)
  end
end
