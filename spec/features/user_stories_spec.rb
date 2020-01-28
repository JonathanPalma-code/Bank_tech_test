describe "User Stories" do

  account = Account.new
  # As a user
  # So that I can check my balance
  # I would like to access my account
  it "should access the balance" do
    expect { account.balance }.not_to raise_error
  end
end
