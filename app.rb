require './database_connection_setup'
require './lib/account'
require './view/formatter'

class Bank

  def self.create_bank_account(name)
    account = Account.create_account(name)
    Formatter.new_account_confirmation(account.name, account.id)
  end

  def self.make_deposit(id, value)
    account = Account.deposit(id: id, value: value)
    Formatter.deposit_confirmation(value, account.balance)
  end

  def self.make_withdrawl(id, value)
    account = Account.withdraw(id: id, value: value)
    Formatter.withdrawl_confirmation(value, account.balance)
  end

end