require "transaction"
require 'timecop'

describe Transaction do
  subject(:credit_transaction) { described_class.new(1000, "", 2000) }
  subject(:debit_transaction) { described_class.new("", -1000, 1000) }

  describe "#initialise" do
    it "should implement a credit action" do
      Timecop.freeze do
        expect(credit_transaction.credit_amount).to eq 1000
        expect(credit_transaction.debit_amount).to eq ""
        expect(credit_transaction.balance).to eq 2000
        expect(credit_transaction.date).to eq "29/01/2020"
        expect(credit_transaction.print).to eq "29/01/2020 || 1000.00 ||  || 2000.00"
      end
    end

    it "should implement a debit action" do
      Timecop.freeze do
        expect(debit_transaction.credit_amount).to eq ""
        expect(debit_transaction.debit_amount).to eq(-1000)
        expect(debit_transaction.balance).to eq 1000
        expect(debit_transaction.date).to eq "29/01/2020"
        expect(debit_transaction.print).to eq "29/01/2020 ||  || -1000.00 || 1000.00"
      end
    end
  end
end
