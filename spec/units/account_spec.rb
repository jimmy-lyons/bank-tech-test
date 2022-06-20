require 'account'

describe "Account Class" do
  describe ".create_account" do
    it "initialises a new account with a name and balance" do
      expect(Account.create_account).to be_an_instance_of(Account)
    end
  end
end