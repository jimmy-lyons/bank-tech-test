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
    result = DatabaseConnection.query(
      "INSERT INTO transactions (transaction_date, user_id, credit, debit, balance) 
      VALUES($1, $2, $3, $4, $5) RETURNING transaction_id, transaction_date, user_id, credit, debit, balance;",
      [Time.now.strftime("%d/%m/%Y %H:%M"), user_id, credit, debit, balance]
    )

    Transaction.new(
      user_id: (result[0]['user_id']).to_i, 
      credit: (result[0]['credit']).to_f, 
      debit: (result[0]['debit']).to_f, 
      balance: (result[0]['balance']).to_f,
      transaction_date: result[0]['transaction_date']
    )
  end
end