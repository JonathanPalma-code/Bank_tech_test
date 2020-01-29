require_relative 'statement'
require_relative 'transaction'

class Account
  
  def initialize
    @statement = Statement.new
    @balance = 0
  end

  def credit(amount)
    raise error_message unless valid_credit_action?(amount)
    
    @balance += amount
    new_transaction(amount, "")
    @balance
  end

  def debit(amount)
    raise error_message unless valid_debit_action?(amount)
    
    @balance -= amount
    new_transaction("", -amount)
    @balance
  end

  def print_statement
    result = save_data.reverse_each { |format| format }
    puts result
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

  def valid_debit_action?(amount)
    (balance - amount) >= 0 && (amount.is_a? Integer)
  end

  def valid_credit_action?(amount)
    amount.positive? && (amount.is_a? Integer)
  end

  def error_message
    error = "Invalid operation: please enter a correct amount."
    OrderError.new(error)
  end
end

class OrderError < StandardError
end
