require 'account'

describe "Account Class" do
  describe ".create_account" do
    it "returns an instance of account" do
      expect(Account.create_account('Joe Bloggs')).to be_an_instance_of(Account)
    end

    it "takes a name as an argument and initialises an balance to 0" do
      test_account = Account.create_account('Joe Bloggs')
      expect(test_account.name).to eq 'Joe Bloggs'
      expect(test_account.balance).to eq 0
    end

    it "raises an error when digits are provided in name" do
      expect{ Account.create_account(123) }.to raise_error "Input Error: Invalid name."
      expect{ Account.create_account("123") }.to raise_error "Input Error: Invalid name."
      expect{ Account.create_account("abc123") }.to raise_error "Input Error: Invalid name."
    end
  end

  describe ".deposit" do
    it "accepts an account number and value, and returns the updated balance" do
      expect(Account.deposit(id: 1, value: 100)).to eq 100
    end
  end
end