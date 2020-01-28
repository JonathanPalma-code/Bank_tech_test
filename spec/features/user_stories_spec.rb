describe "User Stories" do

  account = Account.new
  # As a user
  # So that I can check my balance
  # I would like to access my account
  it "should access the balance" do
    expect { account.balance }.not_to raise_error
  end

  # As a user
  # So that I can have money on my account
  # I would like to make a deposit
  it "should make a credit to my account" do
    expect { account.credit(1000) }.not_to raise_error
  end

  # As a user
  # So that I can buy a jumper
  # I would like the price of it to be deducted from my account
  it "should deduct a certain amount from my account" do
    expect { account.debit(1000) }.to_not raise_error
  end

  # As a user
  # So that I can manage my account
  # I would like to include the details of a transaction
  it "should implement details of a transaction" do
    transaction = Transaction.new(1000.00, nil, 2000.00)
    expect { transaction.credit }.to_not raise_error
    expect { transaction.debit }.to_not raise_error
    expect { transaction.balance }.to_not raise_error
  end

  # As a user
  # So that I can keep a history of transactions
  # I would like to have a statement
  it "should an empty statement" do
    statement = Statement.new
    expect { account.statement }.to_not raise_error
  end
end
