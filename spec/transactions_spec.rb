require "transaction"
require 'timecop'

describe Transaction do
  subject(:credit_transaction) { described_class.new(1000.00, nil, 2000.00) }
  subject(:debit_transaction) { described_class.new(nil, -1000.00, 0.00) }

  describe "#initialise" do
    it "should implement a credit action" do
      Timecop.freeze do
        expect(credit_transaction.credit).to eq 1000.00
        expect(credit_transaction.debit).to eq nil
        expect(credit_transaction.balance).to eq 2000.00
        expect(credit_transaction.date).to eq Time.now
      end
    end

    it "should implement a debit action" do
      Timecop.freeze do
        expect(debit_transaction.credit).to eq nil
        expect(debit_transaction.debit).to eq(-1000.00)
        expect(debit_transaction.balance).to eq 0.00
        expect(debit_transaction.date).to eq Time.now
      end
    end
  end
end
