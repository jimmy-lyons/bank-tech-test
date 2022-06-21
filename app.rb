require './database_connection_setup'
require 'account'
require 'formatter'

class Bank

  def create_bank_account(name)
    account = Account.create_account(name)
    Formatter.new_account_confirmation(account.name, account.id)
  end

end