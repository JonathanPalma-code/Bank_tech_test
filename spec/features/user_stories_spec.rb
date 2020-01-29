describe "User Stories" do

  account = Account.new

  # As a user
  # So that I can keep track of my transactions
  # I would like to have a Statement
  it "should start with an empty statement" do
    expect { account.print_statement }.to_not raise_error
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
    account.credit(2000)
    expect { account.debit(1000) }.to_not raise_error
  end
end
