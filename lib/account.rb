require './database_connection_setup'

class Account 
  attr_reader :name, :balance, :id

  def initialize(id:, name:, balance: 0)
    @id = id
    @name = name
    @balance = balance
  end
 
  def self.create_account(name)
    raise "Input Error: Invalid name." unless name_validation(name)

    result = DatabaseConnection.query(
      "INSERT INTO accounts (username, balance) VALUES($1, 0) RETURNING user_id, username, balance;",
      [name]
    )

    return Account.new(
      id: result[0]['user_id'],
      name: result[0]['username'],
      balance: result[0]['balance']
    )
  end

  def self.deposit(id:, value:)
    balance = DatabaseConnection.query("SELECT * FROM accounts WHERE user_id = $1;", [id])
    new_balance = balance[0]['balance'].to_f + value

    result = DatabaseConnection.query(
      "UPDATE accounts SET balance = $1 WHERE user_id = $2 RETURNING user_id, username, balance;",
      [new_balance, id]
    )

    return Account.new(
      id: result[0]['user_id'],
      name: result[0]['username'],
      balance: (result[0]['balance']).to_f
    )
  end

  private
  
  def self.name_validation(name)
    return false unless name.is_a? String

    if name =~ /\d/
      return false
    end

    true
  end

end