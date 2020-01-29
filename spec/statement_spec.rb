require 'statement'

describe Statement do
  subject(:statement) { described_class.new }
  let(:transaction) { Transaction.new(1000, "", 2000) }

  describe "#initialise" do
    it "should be empty" do
      expect(statement.history).to eq []
    end
  end

  describe "#new_transaction" do
    it "should add a new transaction" do
      record = statement.history.push(transaction)
      expect(record).to eq [transaction]
    end
  end
end
