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
    return_instance_of_transaction(result)
  end

  def self.statement(user_id:)
    result = DatabaseConnection.query(
      "SELECT * FROM transactions WHERE user_id = $1;", [user_id]
    )
    transactions = []
    result.each do | transaction |
      transactions << Transaction.new(
        user_id: (transaction['user_id']).to_i, 
        credit: (transaction['credit']).to_f, 
        debit: (transaction['debit']).to_f, 
        balance: (transaction['balance']).to_f,
        transaction_date: transaction['transaction_date']
      )
    end
    return transactions
  end

  private

  def self.return_instance_of_transaction(psql_result)
    return Transaction.new(
      user_id: (psql_result[0]['user_id']).to_i, 
      credit: (psql_result[0]['credit']).to_f, 
      debit: (psql_result[0]['debit']).to_f, 
      balance: (psql_result[0]['balance']).to_f,
      transaction_date: psql_result[0]['transaction_date']
    )
  end

end