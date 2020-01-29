require 'account'

describe Account do
  subject(:account) { described_class.new }
  let(:statement) { Statement.new }
  balance = 1000.00

  describe "#initialise" do
    it "should not have a statement detailed" do
      expect(account.print_statement).to eq nil
    end
  end

  describe "#credit" do
    it "should add money into the account" do
      expect(account.credit(1000)).to eq balance
    end
  end

  describe "#debit" do
    it "should withraw from the account" do
      account.credit(2000)
      expect(account.debit(1000)).to eq balance
    end
  end

  describe "#print_statement" do
    it "should print the statement" do
      result = "29/01/2020 || 2000.00 ||  || 2000.00\n29/01/2020 ||  || -1000.00 || #{"%.2f" % balance}\n"
      account.credit(2000)
      account.debit(1000)
      expect { account.print_statement }.to output(result).to_stdout
    end
  end
end
