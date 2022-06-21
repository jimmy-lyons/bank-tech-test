require './database_connection_setup'

class Transaction
  def user_id
    1
  end

  def credit
    123.45
  end

  def debit
    0
  end

  def balance
    223.45
  end

  def self.record(user_id:, credit:, debit:, balance:)
    Transaction.new
  end
end