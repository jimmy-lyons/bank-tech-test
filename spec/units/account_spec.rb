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
  end
end