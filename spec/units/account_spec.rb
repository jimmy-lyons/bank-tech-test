require 'account'

describe "Account Class" do
  describe ".create_account" do
    it "returns an instance of account" do
      expect(Account.create_account('Joe Bloggs')).to be_an_instance_of(Account)
    end

    it "takes a name as an argument and initialises an balance to 0" do
      test_account = Account.create_account('Joe Bloggs')
      expect(test_account.name).to eq 'Joe Bloggs'
      expect(test_account.balance.to_f).to eq 0.00
    end

    it "raises an error when digits are provided in name" do
      expect{ Account.create_account(123) }.to raise_error "Input Error: Invalid name."
      expect{ Account.create_account("123") }.to raise_error "Input Error: Invalid name."
      expect{ Account.create_account("abc123") }.to raise_error "Input Error: Invalid name."
    end
  end

  describe ".deposit" do
    it "accepts an account number and value, and returns the updated balance" do
      account_bloggs = Account.create_account('Joe Bloggs')
      account_bloggs = Account.deposit(id: account_bloggs.id, value: 100)
      expect(account_bloggs.balance).to eq 100
    end

    it "returns 200 when 100 is deposited twice" do
      account_bloggs = Account.create_account('Joe Bloggs')
      Account.deposit(id: account_bloggs.id, value: 100)
      account_bloggs = Account.deposit(id: account_bloggs.id, value: 100)
      expect(account_bloggs.balance).to eq 200
    end

    it "throws error when given negative number" do
      account_bloggs = Account.create_account('Joe Bloggs')
      expect{ Account.deposit(id: account_bloggs.id, value: -100) }
      .to raise_error "Input Error: Invalid value."
    end
    
    it "throws error when given a string" do
      account_bloggs = Account.create_account('Joe Bloggs')
      expect{ Account.deposit(id: account_bloggs.id, value: "100") }
      .to raise_error "Input Error: Invalid value."
    end
  end

  describe ".withdraw" do
    it "deducts 100 from balance" do
      account_bloggs = Account.create_account('Joe Bloggs')
      Account.deposit(id: account_bloggs.id, value: 500)
      account_bloggs = Account.withdraw(id: account_bloggs.id, value: 100)
      expect(account_bloggs.balance).to eq 400
    end

    it "deducts 123.45 from balance" do
      account_bloggs = Account.create_account('Joe Bloggs')
      Account.deposit(id: account_bloggs.id, value: 500)
      account_bloggs = Account.withdraw(id: account_bloggs.id, value: 123.45)
      expect(account_bloggs.balance).to eq 376.55
    end
  end
end