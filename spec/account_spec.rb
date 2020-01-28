require 'account'

describe Account do
  subject(:account) { described_class.new }

  describe "#initialize" do
    it "should give an initial balance of 0£" do
      expect(account.balance).to eq 0.00
    end
  end
end
