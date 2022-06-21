require './database_connection_setup'
require './lib/account'
require './lib/transaction'
require './view/formatter'

class Bank

  def self.create_bank_account(name)
    account = Account.create_account(name)
    Formatter.new_account_confirmation(account.name, account.id)
  end

  def self.make_deposit(id, value)
    account = Account.deposit(id: id, value: value)
    Transaction.record(
      user_id: account.id,
      credit: value,
      debit: 0,
      balance: account.balance
    )
    Formatter.deposit_confirmation(value, account.balance)
  end

  def self.make_withdrawl(id, value)
    account = Account.withdraw(id: id, value: value)
    Transaction.record(
      user_id: account.id,
      credit: 0,
      debit: value,
      balance: account.balance
    )
    Formatter.withdrawl_confirmation(value, account.balance)
  end

  def self.statement(user_id:)
    transactions = Transaction.statement(user_id: user_id)
    Formatter.format_statement(transactions)
  end
end