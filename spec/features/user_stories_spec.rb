describe "User Stories" do

  let(:account) { Account.new }

  # As a user
  # So that I can keep track of my transactions in the future
  # I would like to have an empty statement with a header: date, credit, debit and balance.
  it "user should have with an empty statement" do
    expect_statement = "date || credit || debit || balance\n"
    expect(STDOUT).to receive(:puts).with(expect_statement)
    account.print_statement
  end

  # As a user
  # So that I can have money on my account
  # I would like to make a deposit
  context "when deposit" do
    it "user should make a credit to his account" do
      expect { account.credit(1000) }.not_to raise_error
    end

    # As a user
    # So that I don't regret any mistake actions that I made do
    # I would like to raise an error when putting a wrong amount
    context "when insufficient balance or incorrect input" do
      it "raises an error" do
        expect { account.credit(-1000) }.to raise_error OrderError, Account::ERROR
      end
    end
  end

  # As a user
  # So that I can buy a jumper
  # I would like the price of it to be deducted from my account
  context "when withraw" do
    it "user should debit from his account" do
      account.credit(2000)
      expect { account.debit(1000) }.to_not raise_error
    end

    # As a user
    # So that I don't have a negative balance
    # I would like to raise an error when withrawing a wrong amount
    context "when insufficient balance or incorrect input" do
      it "raises an error" do
        expect { account.debit(1000) }.to raise_error OrderError, Account::ERROR
      end
    end
  end

  # As a user
  # So that I can see all my transactions
  # I would like see a full statement of actions, including the date and balance
  it "user should check all the transactions on the statement" do
    account.credit(2000)
    account.debit(1000) 
    expect_statement = "date || credit || debit || balance\n30/01/2020 || 2000.00 ||  || 2000.00\n30/01/2020 ||  || -1000.00 || 1000.00"
    expect(STDOUT).to receive(:puts).with(expect_statement)
    account.print_statement
  end
end
