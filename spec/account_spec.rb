require 'account'
require 'timecop'

describe Account do
  let(:transaction) { double :transaction, print: true }
  let(:statement) { double :statement, history: [] }
  let(:transaction_class) { double :transaction_class, new: transaction }
  subject(:account) { described_class.new(statement, transaction_class) }
  balance = 1000.00

  describe "#initialise" do
    it "should initialise with a empty statement" do
      expect_statement = "date || credit || debit || balance\n"
      allow(statement).to receive(:history) { [] }
      expect(STDOUT).to receive(:puts).with(expect_statement)
      expect(account.print_statement).to eq nil
    end
  end

  describe "#credit" do
    it "should add money into the account" do
      expect(transaction_class).to receive(:new).with(1000, "", 1000)
      account.credit(1000)
    end
  end

  describe "#debit" do
    it "should withraw from the account" do
      account.credit(2000)
      expect(account.debit(1000)).to eq balance
    end
  end
end
