require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:statement) { Statement.new }

  describe "#initialise" do
    it "should give an initial balance of 0£" do
      expect(account.balance).to eq 0.00
      expect(account.statement).to eq []
    end
  end

  describe "#credit" do
    it "should add money in to the account" do
      account.credit(1000.00)
      expect(account.balance).to eq 1000.00
    end
  end

  describe "#debit" do
    it "should withraw from the account" do
      account.credit(1000.00)
      account.debit(500.00)
      expect(account.balance).to eq 500.00
    end
  end
end
