require './database_connection_setup'

class Transaction

  def initialize(user_id: 0, credit: 0, debit: 0, balance: 0, transaction_date: nil)
    @user_id = user_id
    @credit = credit
    @debit = debit
    @balance = balance
    @transaction_date = transaction_date
  end

  def user_id
    @user_id
  end

  def credit
    @credit
  end

  def debit
    @debit
  end

  def balance
    @balance
  end

  def transaction_date
    @transaction_date
  end

  def self.record(user_id:, credit:, debit:, balance:)
    Transaction.new(
      user_id: user_id, 
      credit: credit, 
      debit: debit, 
      balance: balance,
      transaction_date: Time.now.strftime("%d/%m/%Y %H:%M")
    )
  end
end