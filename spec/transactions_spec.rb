require "transaction"
require 'timecop'

describe Transaction do
  subject(:credit_transaction) { described_class.new(1000, "", 2000) }
  subject(:debit_transaction) { described_class.new("", -1000, 1000) }

  describe "#initialise" do
    it "should implement a credit action" do
      Timecop.freeze do
        expect(credit_transaction.print).to eq Time.now.strftime "%d/%m/%Y || 1000.00 ||  || 2000.00"
      end
    end

    it "should implement a debit action" do
      Timecop.freeze do
        expect(debit_transaction.print).to eq Time.now.strftime "%d/%m/%Y ||  || -1000.00 || 1000.00"
      end
    end
  end
end
