require_relative 'statement'
require_relative 'transaction'

class Account
  
  def initialize
    @statement = Statement.new
    @balance = 0
  end

  def credit(amount)
    @balance += amount
    new_transaction(amount, "")
    @balance
  end

  def debit(amount)
    @balance -= amount
    new_transaction("", -amount)
    @balance
  end

  def print_statement
    puts save_data.each { |format| format }
  end

  private

  attr_reader :balance

  def new_transaction(credit = "", debit = "")
    transaction = Transaction.new(credit, debit, balance)
    save_data.push(transaction.print)
  end

  def save_data
    @statement.history
  end
end
