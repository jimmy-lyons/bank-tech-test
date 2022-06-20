require 'account'

describe "Account Class" do
  describe ".create_account" do
    it "returns an instance of account" do
      expect(Account.create_account).to be_an_instance_of(Account)
    end
  end
end